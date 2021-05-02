import os
from itertools import compress
from collections import Counter

# workdir = "/mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/opengwas-infpval-fix"

os.makedirs("logs", exist_ok=True)
os.makedirs("job_reports", exist_ok=True)
# os.makedirs(workdir, exist_ok=True)

igddir = "/mnt/storage/private/mrcieu/research/scratch/IGD"
sourcedirs = [igddir + "/data/dev/ieu-b-copy", igddir + "/data/public"]

o1 = [x[0] for x in os.walk(igddir + "/data/dev/ieu-b-copy")][1:]
o2 = [x[0] for x in os.walk(igddir + "/data/dev/panukbb_gwas_import/processed")][1:]
o3 = [x[0] for x in os.walk(igddir + "/data/public")][1:]

i = ["ukb-e" in x for x in o3]
o3 = list(compress(o3, [not x for x in i]))
i = ["ieu-b" in x for x in o3]
o3 = list(compress(o3, [not x for x in i]))

o = [item for sublist in [o1, o2, o3] for item in sublist]

i = [os.path.isfile(x+"/clump.txt") for x in o]
Counter(i)
o1 = list(compress(o, [not x for x in i]))
o = list(compress(o, i))

i = [os.path.getsize(x+"/clump.txt") != 0 for x in o]
o = list(compress(o, i))

VCFIN = [x + "/" + os.path.basename(x) + ".vcf.gz" for x in o]

i = [os.path.isfile(x) for x in VCFIN]
Counter(i)
o = list(compress(o, i))
len(o)

VCFIN = list(compress(VCFIN, i))
len(VCFIN)

id = [os.path.basename(x) for x in o]
len(id)

ID = dict(zip(id, VCFIN))
len(ID)

####

rule all:
	input: "summary.csv"

rule inf:
	input: lambda wildcards: ID[wildcards.id]
	output:
		'logs/{id}.out'
	shell:
		"""
scripts/fix_vcf.sh \
{input} \
{wildcards.id} \
/mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/opengwas-infpval-fix \
logs
		"""

rule fix_es:
	input: expand('logs/{filename}.out', filename=ID.keys())
	output:
		"summary.csv"
	shell:
		"python scripts/fix_es.py"

