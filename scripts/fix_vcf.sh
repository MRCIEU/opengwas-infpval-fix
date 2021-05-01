#!/bin/bash

vcf=$1
id=$2
workdir=$3
outdir=$4

indir=$(dirname ${vcf})

# indir="/mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/met-d-import/processed"
# id="met-d-DHA"
# workdir="/mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/opengwas-infpval-fix/met-d"

mkdir -p ${workdir}/${id}
zgrep ":inf:" ${vcf} | grep "PASS" > ${outdir}/${id}.out

if [ ! -s "${outdir}/${id}.out" ]
then
	echo "no inf"
	rm -r ${workdir}/${id}
	exit
fi

gunzip -c ${vcf} | sed 's@:inf:@:999:@g' | bgzip -c > ${workdir}/${id}/${id}.vcf.gz
bcftools index -t ${workdir}/${id}/${id}.vcf.gz

python ~/scratch/repo/gwas_processing/clump.py --bcf ${workdir}/${id}/${id}.vcf.gz --plink_ref /mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/reference/ld_files/data_maf0.01_rs --out ${workdir}/${id}/clump.txt
