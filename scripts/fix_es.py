import os
from elasticsearch import Elasticsearch
import re
import pandas as pd

#workdir = "/mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/opengwas-infpval-fix"
workdir = "temp"
logdir = "logs"

locs = [x[0] for x in os.walk(workdir)][1:]
idlist = [os.path.basename(x) for x in locs]

es = Elasticsearch(
	[{'host': '140.238.83.192','port': '9200'}],
)


# o = es.search(index="met-d", body={"query":{"bool":{"must":[{"term":{"gwas_id": "DHA"}}, {"term":{"snp_id":"rs2524296"}}, {"term": {"p": "1"}}]}}})
# id = [x['_id'] for x in o['hits']['hits']]

# [es.update(index="met-d", doc_type="_doc", id=x, body={"doc":{"p":1.0}}) for x in id]
# [es.get(index="met-d", id=x) for x in id]


# 1. read list of SNPs with p-val problems
# 2. lookup SNPs to get their document IDs
# 3. Update the documents


def fixpval(id, logdir):
	reg = r'^([\w]+-[\w]+)-([\w]+)'
	index,study = re.match(reg, id).groups()
	print(id)
	print(index)
	print(study)
	a = pd.read_csv(logdir + "/" + id + ".out", sep="\t", header=None)
	print(a)
	counter=0
	for i in range(len(a)):
		print(i)
		body={
			"query":{
				"bool":{
					"must":
					[
						{"term":{"gwas_id": study}},
						{"term":{"position": a[1][i]}},
						{"term":{"chr": a[0][i]}},
						{"term":{"p": 1}}
					]
				}
			}
		}
		o = es.search(index=index, body=body)
		if o['hits']['total'] > 0:
			docid = [x['_id'] for x in o['hits']['hits']]
			ind = [x['_index'] for x in o['hits']['hits']]
			[es.update(index=x['_index'], doc_type="_doc", id=x['_id'], body={"doc":{"p":0.0}}, wait_for_active_shards="all") for x in o['hits']['hits']]
			print([es.get(index=x['_index'], id=x['_id']) for x in o['hits']['hits']])
			counter+=1
	return counter


# 4. Read in clump.txt rsid list

def update_tophits(id, workdir):
	reg = r'^([\w]+-[\w]+)-([\w]+)'
	index,study = re.match(reg, id).groups()
	print(id)
	print(index)
	print(study)
	with open(workdir + "/" + id + "/" + "clump.txt", "r") as f:
		clump = f.read().splitlines()
	# 5. Get summary data
	print(len(clump))
	o=[]
	for rsid in clump:
		body={
			"query":{
				"bool":{
					"must":
					[
						{"term":{"gwas_id":study}},
						{"term":{"snp_id":rsid}},
						{"range":{"p":{"lt":5e-8}}}
					]
				}
			}
		}
		res = es.search(index=index, body=body)
		if res['hits']['total'] > 0:
			o.append(res['hits']['hits'][0]['_source'])
	# 6. Delete the tophits for that dataset
	body={
		"query":{
			"term":{"gwas_id":study}
		}
	}
	print(es.count(index=index+"-tophits", body=body))
	# es.delete_by_query(index=index+"-tophits", body=body, request_timeout=600,conflicts='abort', wait_for_active_shards='all', slices=1,wait_for_completion=True)
	del_current_tophits(id)
	es.indices.refresh(index+'-tophits')
	print(es.count(index=index+"-tophits", body=body))
	# 7. Upload the summary data as new tophits
	[es.index(index=index+"-tophits", body=x) for x in o]
	es.indices.refresh(index+'-tophits')
	print(es.count(index=index+"-tophits", body=body))


def del_current_tophits(id):
	reg = r'^([\w]+-[\w]+)-([\w]+)'
	index,study = re.match(reg, id).groups()
	print(id)
	print(index)
	print(study)
	pp.pprint(es.indices.get_settings(index + "-tophits"))
	es.indices.put_settings(index=index + "-tophits", body={'index.blocks.read_only_allow_delete': None})
	pp.pprint(es.indices.get_settings(index + "-tophits"))
	es.indices.refresh(index + "-tophits")
	body={
		"query":{
			"term":{"gwas_id":study}
		}
	}
	o = es.search(index=index+'-tophits', body=body, size=10000)
	print(len(o['hits']['hits']))
	[es.delete(index=x['_index'], id=x['_id']) for x in o['hits']['hits']]

count=[]
fix_success=[]
for id in idlist:
	print(id)
	try:
		c=fixpval(id, logdir)
		print(c)
		count.append({id:c})
		print()
	except:
		fix_success.append({id:False})
	else:
		fix_success.append({id:True})


c={}
for d in count:
	print(d)
	c.update(d)

clump_success=[]
for id in idlist:
	print(id)
	if id in c.keys():
		if c[id] > 0:
			try:
				update_tophits(id, workdir)
			except:
				clump_success.append({id:False})
			else:
				clump_success.append({id:True})



