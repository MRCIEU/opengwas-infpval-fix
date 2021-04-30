#!/bin/bash

vcf=$1
id=$2
workdir=$3

indir=$(dirname ${vcf})

# indir="/mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/met-d-import/processed"
# id="met-d-DHA"
# workdir="/mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/opengwas-infpval-fix/met-d"

mkdir -p ${workdir}/${id}
zgrep "inf" ${vcf} | grep "PASS" > ${workdir}/${id}/inf.txt

if [ ! -s "${workdir}/${id}/inf.txt" ]
then
	echo "no inf"
	rm -r ${workdir}/${id}
	exit
fi

gunzip -c ${vcf} | sed 's@:inf@:999@g' | sed 's@inf:@999:@g' | bgzip -c > ${workdir}/${id}/${id}.vcf.gz
bcftools index -t ${workdir}/${id}/${id}.vcf.gz

python ~/scratch/repo/gwas_processing/clump.py --bcf ${workdir}/${id}/${id}.vcf.gz --plink_ref /mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/reference/ld_files/data_maf0.01_rs --out ${workdir}/${id}/clump.txt


