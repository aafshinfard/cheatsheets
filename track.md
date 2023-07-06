# Physlr
## Setup Physlr
```
git clone git@github.com:bcgsc/physlr.git
conda_env physlr_ready // dependencies for compiling
cd physlr/src && make install
conda_env physlrpy3.7
// prepare for runs by adding more stuff like bttlib/indexlr to path
```



## Runs:


Directory:
```
/projects/btl_scratch/aafshinfard/projects/physlr2/experiments/
```

Conda env:
physlrpy3.7 or physlr_ready
```
conda_env physlrpy3.7
conda_env physlr_ready // (python 3.9)
```

Additional packages added to path:
btllib v1.5.1
```
export PATH="/projects/btl/aafshinfard/miniconda3/envs/btllib-v1.5.1/bin/:$PATH"
```

example command:
```
../bin/physlr-make physical-map lr=reads.63X ref=chm13v2.0_noY_noM protocol=ont t=32 > log_63X_chm13_ont_t32.log 2>&1

../bin/physlr-make physical-map lr=reads.32X ref=chm13v2.0_noY_noM protocol=ont m=95 t=24 > log_32X_chm13_ont_t24_m95.log 2>&1

> log_16X_chm13_ont_t24_m10.log 2>&1
```

## Results processing:
add "," every 3 digit, and also split columns with |
```
sed -E ':a;s/([0-9]+)([0-9]{3})/\1,\2/g;ta;s/\t/|/g' filename.map-quality.tsv
```

## Scaffolding stage with RLE - to hack to apply the joins on the non-RLE assembly:

../bin/physlr-make scaffolds lr=reads.63X.rle draft=goldrush-chm13.rle ref=chm13v2.0_noY_noM.rle protocol=ont m=85 t=48 > log_scaffolds_rle-default.log 2>&1

```
../bin/physlr-make scaffolds lr=reads.63X.rle draft=goldrush-chm13.rle ref=chm13v2.0_noY_noM.rle protocol=ont m=85 t=48 -n
indexlr --long -t48 -k40 -w32 -r reads.63X.rle.k40.bf --pos -o goldrush-chm13.rle.k40-w32.physlr.tsv goldrush-chm13.rle.fa
command time -v -o reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.bed.time env PYTHONPATH=/projects/btl_scratch/aafshinfard/projects/physlr2/experiments/chm13_guppy_v5/rle_data/default_physlr1_63X_fake_m85 pypy3 /projects/btl_scratch/aafshinfard/projects/physlr2/experiments/chm13_guppy_v5/rle_data/default_physlr1_63X_fake_m85/bin/physlr map --mx-type split --map-pos 10 -V1 -n10 reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.path reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.split.tsv goldrush-chm13.rle.k40-w32.physlr.tsv >reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.bed
sort -k1,1n -k1,1 -k2,2n -k3,3n -k5,5nr -k4,4 reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.bed >reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.bed
awk '{ keep = $1 " " $2 " " $3 != x; x = $1 " " $2 " " $3 } keep' reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.bed >reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.best.bed
command time -v -o reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.best.bed.path.time env PYTHONPATH=/projects/btl_scratch/aafshinfard/projects/physlr2/experiments/chm13_guppy_v5/rle_data/default_physlr1_63X_fake_m85 pypy3 /projects/btl_scratch/aafshinfard/projects/physlr2/experiments/chm13_guppy_v5/rle_data/default_physlr1_63X_fake_m85/bin/physlr bed-to-path -V1 reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.best.bed >reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.best.bed.path
command time -v -o goldrush-chm13.rle_pair.tsv.time arcs --arks -v -f goldrush-chm13.rle.fa \
-c 5 -m 50-6000 -r 0.05 -e 30000 -z 500 -j 0.55 -k 30 -t 48 -d 0 --gap 100 \
-b goldrush-chm13.rle reads.63X.rle.fq.gz \
-P -D --dist_tsv=goldrush-chm13.rle_dist.tsv
command time -v -o reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.best.bed.path.fa.time env PYTHONPATH=/projects/btl_scratch/aafshinfard/projects/physlr2/experiments/chm13_guppy_v5/rle_data/default_physlr1_63X_fake_m85 pypy3 /projects/btl_scratch/aafshinfard/projects/physlr2/experiments/chm13_guppy_v5/rle_data/default_physlr1_63X_fake_m85/bin/physlr path-to-fasta --min-length=0 \
--arcs-pair goldrush-chm13.rle_pair.tsv \
--dist-est goldrush-chm13.rle_dist.tsv \
-V1 goldrush-chm13.rle.fa reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.best.bed.path >reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.best.bed.path.fa
ln -sf reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m85.mol.backbone.map-split.goldrush-chm13.rle.n10.sort.best.bed.path.fa goldrush-chm13.rle.physlr.fa
quast-lg -t48 -es --fast --large --scaffold-gap-max-size 100000 --min-identity 95 -R chm13v2.0_noY_noM.rle/chm13v2.0_noY_noM.rle.fa -o goldrush-chm13.rle.physlr.quast goldrush-chm13.rle.physlr.fa
cp goldrush-chm13.rle.physlr.quast/transposed_report.tsv goldrush-chm13.rle.physlr.quast.tsv
```
# Make a new folder with contents of a run that is done already

```
cp -a physlr-to-copy destination_dir # (default_physlr1_63X_fake_m75_non-rle)
ls -rt default_physlr1_63X_fake_m75/data/ | xargs -I {} ln -s $(realpath default_physlr1_63X_fake_m75/data/{}) default_physlr1_63X_fake_m75_non-rle/data//{}
```

# Filter a bed file for new and old scores
```
awk -F'\t' '($7 > 90) && ($5 > 3000) { printf "%s\t%s\t%s\t%s\t%d\t%s\n", $1, $2, $3, $4, int($7), $6 }' reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m75.mol.backbone.map-split.goldrush-chm13.split-2mb.rle.n10.bed.BAK >reads.63X.rle.k40-w32.n100-5000.c2-x.physlr.overlap.m75.mol.backbone.map-split.goldrush-chm13.split-2mb.rle.n10.bed
```
# run after bed file change
```
../bin/physlr-make scaffolds lr=reads.63X.rle ref=chm13v2.0_noY_noM.rle draft=goldrush-chm13.split-2mb.rle m=75 protocol=ont quast_env=deepcut map_n=10
```

# arcs for long reads of Physlr:
two steps:
1- generate psuedo long reads using arcs-make:
```
arcs-make arks-long reads.63X.rle.cut4.fq.gz draft=chm13v2.0_noY_noM.rle reads=reads.63X.rle cut=4 t=16
```
then run like before, obviously with the new read file, and also with new parameters:
```
ADD from Physlr-make
``
MAKE SURE YOU ONLY USE THIS FILE FOR THE RIGHT STAGES! PHYSLR MAY NEED READ FILE AGAIN AND AGAIN?!
