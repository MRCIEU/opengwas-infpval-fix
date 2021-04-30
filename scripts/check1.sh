#!/bin/bash

# Example issues
# met-d-DHA rs174546	

mkdir -p ~/scratch/data/gwas2vcf_fix
mkdir -p ~/scratch/data/gwas2vcf_fix/met-d-DHA
cp ~/IGD/data/dev/met-d-import/processed/met-d-DHA/met-d-DHA_data.json ~/scratch/data/gwas2vcf_fix/met-d-DHA/
cp ~/IGD/data/dev/met-d-import/processed/met-d-DHA/met-d-DHA.json ~/scratch/data/gwas2vcf_fix/met-d-DHA/
zcat ~/IGD/data/dev/met-d-import/processed/met-d-DHA/DHA_int.imputed.txt.gz | head -n 1 > temp
zcat ~/IGD/data/dev/met-d-import/processed/met-d-DHA/DHA_int.imputed.txt.gz | head -n 8184468 | tail > temp2
cat temp temp2 | gzip -c > ~/scratch/data/gwas2vcf_fix/met-d-DHA/DHA_int.imputed.txt.gz
rm temp temp2

cd ~/scratch/repo/gwas2vcf
module add languages/anaconda3/2020-3.8.5
python3 -m venv env
source env/bin/activate
pip install -r requirements.txt
pip install git+git://github.com/bioinformed/vgraph@v1.4.0#egg=vgraph
python main.py -h


gwasdir="/mnt/storage/scratch/gh13047/data/gwas2vcf_fix"
id="met-d-DHA"

./env/bin/python main.py \
        --json ${gwasdir}/${id}/${id}_data.json \
        --data ${gwasdir}/${id}/DHA_int.imputed.txt.gz \
        --out ${gwasdir}/${id}/${id}.vcf.gz \
        --ref /mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/QC/genomes/b37/human_g1k_v37.fasta

zless ${gwasdir}/${id}/${id}.vcf.gz

