# README content 1 (set 1)
Goldrush parameters used for these experiments:
# set by Amirhossein

# ln -s /projects/btl/datasets/hprc/HG02055/nanopore/HG02055.fq hg02055.ont.fq
# ln -s /projects/btl/datasets/hprc/HG01243/nanopore/HG01243.fq hg01243.ont.fq
# ln -s /projects/btl/datasets/hsapiens/giab/AshkenazimTrio/HG002_NA24385_son/nanopore/gm_2020.11_guppy5/NA24385.ont.fq hg002.ont.fq

# ln -s /projects/btl/reference_genomes/H_sapiens/GRCh38/GCA_000001405.15_GRCh38_genomic.chr-only.fa grch38.fa

reads=hg02055.ont.fq
reads=hg01243.ont.fq
reads=hg002.ont.fq

t=45
# optimization work
z=2000
tile=1750
b=6
u=6
a=1
o=0.15
x=19
m=20000
M=7
r=0.85
P=20
d=4
span=2
dist=500
rounds=6
# from paper
k_ntLink=72 or 64
w_ntLink=500


command time -v -o time.goldrush-run.time goldrush run reads=${reads} G=3e9 t=$t z=$z tile=${tile} b=$b u=$u a=$a o=$o x=$x m=$m M=$M r=$r P=$P d=$d span=${span} dist=${dist} k_ntLink=${k_ntLink} w_ntLink=${w_ntLink} rounds=${rounds} > log.goldrush-run.log 2>&1

conda_env deepcut

goldrush=$(ls -t *fa | head -n1)
[[ ${goldrush} == "grch38.fa" ]] && goldrush="none.fa"
ln -s ${goldrush} goldrush.fa

fasta=goldrush.fa
ref=grch38.fa

quast-lg -t48 -es --fast --large --scaffold-gap-max-size 100000 --min-identity 80 --split-scaffolds -R ${ref} -o quast_${fasta}_${ref}_quast ${fasta}
minimap2 --version > quast_${fasta}_${ref}_quast/minimap2.version
quast --version > quast_${fasta}_${ref}_quast/quast.version
cat quast_${fasta}_${ref}_quast/transposed_report.tsv |  mlr --tsv cut -o -f Assembly,NG50,NGA50,"# misassemblies","# local misassemblies","Genome fraction (%)","Duplication ratio","Total length","Unaligned length","# unaligned contigs","# N's per 100 kbp","# mismatches per 100 kbp","# indels per 100 kbp"| sed 's/\t/|/g' | sed 's/^/|/g' | sed -E ':a;s/([0-9]+)([0-9]{3}\>)/\1,\2/g;ta' > quast_${fasta}_${ref}_quast.tsv
cat quast_${fasta}_${ref}_quast.tsv

conda_env goldrush


######################################
# README content 2 (set 2)
Goldrush parameters used for these experiments:

# set by Amirhossein
reads=
t=45
# optimization work
z=2250
tile=1000
b=9
u=8
a=1
o=0.05
x=7
m=20000
M=6
r=0.95
P=19
d=5
span=3
dist=750
rounds=7
# from paper
k_ntLink=72 or 64
w_ntLink=250


command time -v -o time.goldrush-run.time goldrush run reads=${reads} G=3e9 t=$t z=$z tile=${tile} b=$b u=$u a=$a o=$o x=$x m=$m M=$M r=$r P=$P d=$d span=${span} dist=${dist} k_ntLink=${k_ntLink} w_ntLink=${w_ntLink} rounds=${rounds} > log.goldrush-run.log 2>&1
.
.
.


########################################## GoldRush v1.1 with ntLink k and w from paper:

# ln -s /projects/btl/datasets/hprc/HG02055/nanopore/HG02055.fq hg02055.ont.fq
# ln -s /projects/btl/datasets/hprc/HG01243/nanopore/HG01243.fq hg01243.ont.fq
# ln -s /projects/btl/datasets/hsapiens/giab/AshkenazimTrio/HG002_NA24385_son/nanopore/gm_2020.11_guppy5/NA24385.ont.fq hg002.ont.fq

# ln -s /projects/btl/reference_genomes/H_sapiens/GRCh38/GCA_000001405.15_GRCh38_genomic.chr-only.fa grch38.fa

reads=hg02055.ont
reads=hg01243.ont
reads=hg002.ont

t=45
# from paper
k_ntLink=72 or 64
w_ntLink=500

command time -v -o time.goldrush-run.time goldrush run reads=${reads} G=3e9 t=$t k_ntLink=${k_ntLink} w_ntLink=${w_ntLink} > log.goldrush-run.log 2>&1

conda_env deepcut

goldrush=$(ls -t *fa | head -n1)
[[ ${goldrush} == "grch38.fa" ]] && goldrush="none.fa"
ln -s ${goldrush} goldrush.fa

fasta=goldrush.fa
ref=grch38.fa

quast-lg -t48 -es --fast --large --scaffold-gap-max-size 100000 --min-identity 80 --split-scaffolds -R ${ref} -o quast_${fasta}_${ref}_quast ${fasta}
minimap2 --version > quast_${fasta}_${ref}_quast/minimap2.version
quast --version > quast_${fasta}_${ref}_quast/quast.version
cat quast_${fasta}_${ref}_quast/transposed_report.tsv |  mlr --tsv cut -o -f Assembly,NG50,NGA50,"# misassemblies","# local misassemblies","Genome fraction (%)","Duplication ratio","Total length","Unaligned length","# unaligned contigs","# N's per 100 kbp","# mismatches per 100 kbp","# indels per 100 kbp"| sed 's/\t/|/g' | sed 's/^/|/g' | sed -E ':a;s/([0-9]+)([0-9]{3}\>)/\1,\2/g;ta' > quast_${fasta}_${ref}_quast.tsv
cat quast_${fasta}_${ref}_quast.tsv

conda_env goldrush



###
# T289 record for chm13
