# Fix OpenGWAS p-value issues

Issues with some p-values that had p-values smaller than floating point number precision limit (~1e-323) being stored as 1 in the elasticsearch database. 

## Affected GWAS IDs

Each ID and the number of affected SNPs. Each of these datasets has been re-clumped to form tophits using 1/z instead of p-values.

```
{   'bbj-a-23': 19,
    'bbj-a-24': 1,
    'bbj-a-30': 44,
    'bbj-a-38': 10,
    'bbj-a-5': 103,
    'bbj-a-53': 206,
    'bbj-a-55': 2,
    'bbj-a-57': 5,
    'bbj-a-7': 4,
    'ebi-a-GCST000679': 22,
    'ebi-a-GCST000755': 5,
    'ebi-a-GCST001198': 2,
    'ebi-a-GCST001791': 236,
    'ebi-a-GCST002222': 3,
    'ebi-a-GCST002223': 25,
    'ebi-a-GCST002245': 29,
    'ebi-a-GCST004599': 81,
    'ebi-a-GCST004601': 29,
    'ebi-a-GCST004602': 34,
    'ebi-a-GCST004611': 1,
    'ebi-a-GCST004612': 1,
    'ebi-a-GCST004619': 15,
    'ebi-a-GCST004622': 13,
    'ebi-a-GCST004630': 58,
    'ebi-a-GCST005367': 2,
    'ebi-a-GCST005529': 2,
    'ebi-a-GCST005921': 27,
    'ebi-a-GCST005923': 23,
    'ebi-a-GCST006061': 113,
    'ebi-a-GCST006414': 111,
    'ebi-a-GCST006867': 1,
    'ebi-a-GCST006979': 174,
    'ebi-a-GCST008049': 1,
    'ebi-a-GCST90000615': 302,
    'ebi-a-GCST90000616': 247,
    'ebi-a-GCST90001484': 44,
    'ebi-a-GCST90001491': 109,
    'ebi-a-GCST90001495': 109,
    'ebi-a-GCST90001496': 112,
    'ebi-a-GCST90001497': 112,
    'ebi-a-GCST90001658': 112,
    'ebi-a-GCST90001659': 112,
    'ebi-a-GCST90001660': 111,
    'ebi-a-GCST90001670': 67,
    'ebi-a-GCST90001671': 67,
    'ebi-a-GCST90001672': 67,
    'ebi-a-GCST90001702': 14,
    'ebi-a-GCST90001703': 14,
    'ebi-a-GCST90001704': 14,
    'ebi-a-GCST90001705': 14,
    'ebi-a-GCST90001709': 15,
    'ebi-a-GCST90001712': 12,
    'ebi-a-GCST90001715': 14,
    'ebi-a-GCST90001716': 14,
    'ebi-a-GCST90001717': 14,
    'ebi-a-GCST90001718': 12,
    'ebi-a-GCST90001719': 14,
    'ebi-a-GCST90001829': 14,
    'ebi-a-GCST90001979': 16,
    'ebi-a-GCST90002030': 113,
    'ebi-a-GCST90002031': 109,
    'ebi-a-GCST90002032': 109,
    'ebi-a-GCST90002323': 11,
    'ebi-a-GCST90002335': 11,
    'ebi-a-GCST90002350': 1,
    'ebi-a-GCST90002364': 1,
    'ebi-a-GCST90002412': 748,
    'met-d-ApoA1': 33,
    'met-d-ApoB': 9,
    'met-d-ApoB_by_ApoA1': 9,
    'met-d-Clinical_LDL_C': 13,
    'met-d-DHA_pct': 87,
    'met-d-Gln': 27,
    'met-d-Gly': 343,
    'met-d-HDL_C': 42,
    'met-d-HDL_CE': 42,
    'met-d-HDL_FC': 47,
    'met-d-HDL_L': 38,
    'met-d-HDL_PL': 36,
    'met-d-HDL_TG': 32,
    'met-d-HDL_size': 111,
    'met-d-IDL_C': 13,
    'met-d-IDL_CE': 13,
    'met-d-IDL_CE_pct': 13,
    'met-d-IDL_C_pct': 13,
    'met-d-IDL_FC': 12,
    'met-d-IDL_L': 12,
    'met-d-IDL_P': 12,
    'met-d-IDL_PL': 9,
    'met-d-IDL_PL_pct': 7,
    'met-d-IDL_TG': 94,
    'met-d-IDL_TG_pct': 13,
    'met-d-LA_pct': 57,
    'met-d-LDL_C': 12,
    'met-d-LDL_CE': 9,
    'met-d-LDL_FC': 17,
    'met-d-LDL_L': 12,
    'met-d-LDL_P': 9,
    'met-d-LDL_PL': 13,
    'met-d-LDL_TG': 32,
    'met-d-L_HDL_C': 43,
    'met-d-L_HDL_CE': 44,
    'met-d-L_HDL_CE_pct': 13,
    'met-d-L_HDL_C_pct': 28,
    'met-d-L_HDL_FC': 71,
    'met-d-L_HDL_FC_pct': 40,
    'met-d-L_HDL_L': 73,
    'met-d-L_HDL_P': 75,
    'met-d-L_HDL_PL': 72,
    'met-d-L_HDL_TG': 108,
    'met-d-L_HDL_TG_pct': 28,
    'met-d-L_LDL_C': 13,
    'met-d-L_LDL_CE': 12,
    'met-d-L_LDL_C_pct': 9,
    'met-d-L_LDL_FC': 13,
    'met-d-L_LDL_FC_pct': 7,
    'met-d-L_LDL_L': 12,
    'met-d-L_LDL_P': 9,
    'met-d-L_LDL_PL': 13,
    'met-d-L_LDL_PL_pct': 10,
    'met-d-L_LDL_TG': 50,
    'met-d-L_LDL_TG_pct': 39,
    'met-d-L_VLDL_FC_pct': 36,
    'met-d-L_VLDL_PL_pct': 15,
    'met-d-L_VLDL_TG_pct': 36,
    'met-d-MUFA_pct': 61,
    'met-d-M_HDL_C': 37,
    'met-d-M_HDL_C_pct': 28,
    'met-d-M_HDL_FC': 37,
    'met-d-M_HDL_FC_pct': 41,
    'met-d-M_HDL_L': 10,
    'met-d-M_HDL_P': 22,
    'met-d-M_HDL_PL_pct': 28,
    'met-d-M_HDL_TG': 13,
    'met-d-M_LDL_C': 9,
    'met-d-M_LDL_CE': 8,
    'met-d-M_LDL_FC': 14,
    'met-d-M_LDL_FC_pct': 7,
    'met-d-M_LDL_L': 9,
    'met-d-M_LDL_P': 7,
    'met-d-M_LDL_PL': 12,
    'met-d-M_LDL_PL_pct': 2,
    'met-d-M_LDL_TG_pct': 46,
    'met-d-M_VLDL_C': 8,
    'met-d-M_VLDL_CE': 9,
    'met-d-M_VLDL_C_pct': 8,
    'met-d-M_VLDL_FC': 2,
    'met-d-M_VLDL_FC_pct': 8,
    'met-d-M_VLDL_PL_pct': 8,
    'met-d-Omega_3': 149,
    'met-d-Omega_3_pct': 167,
    'met-d-Omega_6_by_Omega_3': 157,
    'met-d-PUFA_by_MUFA': 47,
    'met-d-Phosphatidylc': 14,
    'met-d-Remnant_C': 8,
    'met-d-S_HDL_CE_pct': 71,
    'met-d-S_HDL_C_pct': 7,
    'met-d-S_HDL_FC_pct': 107,
    'met-d-S_HDL_PL_pct': 8,
    'met-d-S_HDL_TG': 2,
    'met-d-S_HDL_TG_pct': 1,
    'met-d-S_LDL_C': 11,
    'met-d-S_LDL_CE': 8,
    'met-d-S_LDL_CE_pct': 2,
    'met-d-S_LDL_FC': 21,
    'met-d-S_LDL_L': 12,
    'met-d-S_LDL_P': 8,
    'met-d-S_LDL_PL': 31,
    'met-d-S_LDL_PL_pct': 2,
    'met-d-S_LDL_TG_pct': 13,
    'met-d-S_VLDL_CE_pct': 17,
    'met-d-S_VLDL_C_pct': 9,
    'met-d-S_VLDL_FC': 2,
    'met-d-S_VLDL_FC_pct': 13,
    'met-d-S_VLDL_PL_pct': 13,
    'met-d-S_VLDL_TG': 2,
    'met-d-S_VLDL_TG_pct': 9,
    'met-d-Sphingomyelins': 7,
    'met-d-Total_C': 8,
    'met-d-Total_CE': 8,
    'met-d-Total_FC': 8,
    'met-d-Unsaturation': 151,
    'met-d-XL_HDL_C': 60,
    'met-d-XL_HDL_CE': 67,
    'met-d-XL_HDL_CE_pct': 2,
    'met-d-XL_HDL_C_pct': 96,
    'met-d-XL_HDL_FC': 33,
    'met-d-XL_HDL_FC_pct': 74,
    'met-d-XL_HDL_L': 90,
    'met-d-XL_HDL_P': 97,
    'met-d-XL_HDL_PL': 87,
    'met-d-XL_HDL_PL_pct': 64,
    'met-d-XL_HDL_TG': 96,
    'met-d-XL_VLDL_CE_pct': 2,
    'met-d-XS_VLDL_C': 17,
    'met-d-XS_VLDL_CE': 12,
    'met-d-XS_VLDL_CE_pct': 9,
    'met-d-XS_VLDL_C_pct': 9,
    'met-d-XS_VLDL_FC': 33,
    'met-d-XS_VLDL_FC_pct': 3,
    'met-d-XS_VLDL_L': 36,
    'met-d-XS_VLDL_P': 33,
    'met-d-XS_VLDL_PL': 43,
    'met-d-XS_VLDL_PL_pct': 2,
    'met-d-XS_VLDL_TG': 33,
    'met-d-XS_VLDL_TG_pct': 9,
    'met-d-XXL_VLDL_TG': 1,
    'met-d-non_HDL_C': 9,
    'prot-a-10': 53,
    'prot-a-1074': 17,
    'prot-a-1075': 35,
    'prot-a-1115': 43,
    'prot-a-1154': 10,
    'prot-a-1196': 1,
    'prot-a-1199': 21,
    'prot-a-1288': 25,
    'prot-a-1298': 7,
    'prot-a-1317': 5,
    'prot-a-1386': 46,
    'prot-a-1397': 37,
    'prot-a-1486': 5,
    'prot-a-1499': 33,
    'prot-a-1500': 34,
    'prot-a-1502': 70,
    'prot-a-1540': 64,
    'prot-a-1541': 64,
    'prot-a-1644': 3,
    'prot-a-1724': 215,
    'prot-a-1742': 10,
    'prot-a-1743': 13,
    'prot-a-1747': 7,
    'prot-a-1753': 41,
    'prot-a-1792': 1,
    'prot-a-18': 69,
    'prot-a-1837': 34,
    'prot-a-1863': 32,
    'prot-a-1867': 119,
    'prot-a-1902': 54,
    'prot-a-1949': 48,
    'prot-a-2025': 51,
    'prot-a-207': 110,
    'prot-a-2071': 1,
    'prot-a-2194': 5,
    'prot-a-2211': 51,
    'prot-a-2230': 5,
    'prot-a-2231': 30,
    'prot-a-2286': 4,
    'prot-a-2291': 24,
    'prot-a-2361': 5,
    'prot-a-2493': 46,
    'prot-a-2557': 16,
    'prot-a-2616': 7,
    'prot-a-2665': 11,
    'prot-a-2676': 8,
    'prot-a-2725': 13,
    'prot-a-2731': 16,
    'prot-a-2732': 79,
    'prot-a-2743': 1,
    'prot-a-276': 120,
    'prot-a-2824': 10,
    'prot-a-2850': 64,
    'prot-a-2927': 87,
    'prot-a-2930': 19,
    'prot-a-2940': 25,
    'prot-a-3004': 9,
    'prot-a-3090': 38,
    'prot-a-3191': 1,
    'prot-a-3203': 2,
    'prot-a-3214': 42,
    'prot-a-346': 61,
    'prot-a-391': 5,
    'prot-a-392': 5,
    'prot-a-393': 2,
    'prot-a-439': 5,
    'prot-a-506': 1,
    'prot-a-540': 10,
    'prot-a-543': 14,
    'prot-a-570': 155,
    'prot-a-643': 50,
    'prot-a-657': 63,
    'prot-a-805': 22,
    'prot-a-86': 74,
    'prot-a-91': 51,
    'prot-a-948': 38,
    'prot-a-972': 174,
    'ukb-a-100': 210,
    'ukb-a-101': 576,
    'ukb-a-210': 8,
    'ukb-a-361': 3,
    'ukb-a-362': 3,
    'ukb-a-500': 44,
    'ukb-a-88': 155,
    'ukb-b-10537': 125,
    'ukb-b-10787': 98,
    'ukb-b-1096': 42,
    'ukb-b-11113': 9,
    'ukb-b-13246': 99,
    'ukb-b-13506': 9,
    'ukb-b-14664': 9,
    'ukb-b-14699': 23,
    'ukb-b-15730': 42,
    'ukb-b-15851': 46,
    'ukb-b-16881': 1,
    'ukb-b-19234': 46,
    'ukb-b-19560': 1079,
    'ukb-b-20032': 42,
    'ukb-b-20124': 46,
    'ukb-b-4657': 42,
    'ukb-b-533': 1080,
    'ukb-b-5447': 12,
    'ukb-b-5463': 42,
    'ukb-b-6027': 16,
    'ukb-b-6235': 19,
    'ukb-b-6852': 9,
    'ukb-b-845': 42,
    'ukb-b-8631': 747,
    'ukb-b-8875': 50,
    'ukb-d-1747_1': 277,
    'ukb-d-1747_2': 1851,
    'ukb-d-1747_3': 208,
    'ukb-d-1747_4': 549,
    'ukb-d-1747_5': 68,
    'ukb-d-2395_1': 1785,
    'ukb-d-30010_irnt': 81,
    'ukb-d-30020_irnt': 7,
    'ukb-d-30040_irnt': 261,
    'ukb-d-30050_irnt': 328,
    'ukb-d-30070_irnt': 37,
    'ukb-d-30080_irnt': 58,
    'ukb-d-30090_irnt': 59,
    'ukb-d-30100_irnt': 1094,
    'ukb-d-30110_irnt': 277,
    'ukb-d-30130_irnt': 111,
    'ukb-d-30140_irnt': 147,
    'ukb-d-30190_irnt': 88,
    'ukb-d-30240_irnt': 38,
    'ukb-d-30250_irnt': 34,
    'ukb-d-30260_irnt': 155,
    'ukb-d-30270_irnt': 106,
    'ukb-d-30280_irnt': 85,
    'ukb-d-30290_irnt': 70,
    'ukb-d-30300_irnt': 48,
    'ukb-d-30610_irnt': 512,
    'ukb-d-30610_raw': 287,
    'ukb-d-30620_irnt': 2,
    'ukb-d-30620_raw': 4,
    'ukb-d-30630_irnt': 121,
    'ukb-d-30630_raw': 116,
    'ukb-d-30640_irnt': 379,
    'ukb-d-30640_raw': 440,
    'ukb-d-30650_irnt': 7,
    'ukb-d-30660_irnt': 737,
    'ukb-d-30660_raw': 676,
    'ukb-d-30680_irnt': 59,
    'ukb-d-30680_raw': 59,
    'ukb-d-30690_irnt': 100,
    'ukb-d-30690_raw': 100,
    'ukb-d-30710_irnt': 357,
    'ukb-d-30710_raw': 1,
    'ukb-d-30720_irnt': 544,
    'ukb-d-30720_raw': 292,
    'ukb-d-30730_irnt': 178,
    'ukb-d-30730_raw': 33,
    'ukb-d-30740_irnt': 50,
    'ukb-d-30750_irnt': 31,
    'ukb-d-30750_raw': 10,
    'ukb-d-30760_irnt': 299,
    'ukb-d-30760_raw': 300,
    'ukb-d-30770_irnt': 33,
    'ukb-d-30770_raw': 12,
    'ukb-d-30780_irnt': 155,
    'ukb-d-30780_raw': 151,
    'ukb-d-30790_irnt': 1357,
    'ukb-d-30790_raw': 1511,
    'ukb-d-30810_irnt': 34,
    'ukb-d-30810_raw': 34,
    'ukb-d-30830_irnt': 602,
    'ukb-d-30830_raw': 451,
    'ukb-d-30840_irnt': 869,
    'ukb-d-30840_raw': 884,
    'ukb-d-30850_irnt': 2,
    'ukb-d-30850_raw': 71,
    'ukb-d-30870_irnt': 334,
    'ukb-d-30870_raw': 309,
    'ukb-d-30880_irnt': 1508,
    'ukb-d-30880_raw': 1486,
    'ukb-d-30890_irnt': 82,
    'ukb-d-30890_raw': 102,
    'ukb-d-L72': 1,
    'ukb-d-M13_DUPUTRYEN': 7,
    'ukb-d-M13_FIBROBLASTIC': 4,
    'ukb-e-30840_AFR': 6,
    'ukb-e-30840_CSA': 60,
    'ukb-e-recode1_AFR': 4,
    'ukb-e-recode1_CSA': 32
}
```



## To run

e.g.

```
scripts/fix_vcf.sh \
    /mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/met-d-import/processed \
    met-d-DHA \
    /mnt/storage/private/mrcieu/research/scratch/IGD/data/dev/opengwas-infpval-fix/met-d \
    logs
```

Pipeline:

```
snakemake -prk \
-j 500 \
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
