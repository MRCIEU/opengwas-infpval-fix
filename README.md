# Fix OpenGWAS p-value issues

```
scripts/fix_vcf.sh \
    /mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/met-d-import/processed \
    met-d-DHA \
    /mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/opengwas-infpval-fix/met-d
```


## Snakemake

```
snakemake -prk \
-j 400 \
--cluster-config bc4-cluster.json \
--cluster "sbatch \
  --job-name={cluster.name} \
  --partition={cluster.partition} \
  --nodes={cluster.nodes} \
  --ntasks-per-node={cluster.ntask} \
  --cpus-per-task={cluster.ncpu} \
  --time={cluster.time} \
  --mem={cluster.mem} \
  --output={cluster.output}"
```

