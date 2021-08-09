Amirhossein Afshinfard - Cheatsheet for Bioinformatics tools


Cheatsheet
=====================

Contents
========

* [Alignment](#alignment)
* [Genome assembly](#genome-assembly)



Alignment
==============
minimap2:
```bash
> # short-read assembly vs reference mapping:
> outdir=${asm_dir}${asm_file}_minimap2_algn/
> mkdir $outdir
> outbam=${outdir}_algn.bam
> minimap2 -x asm5 -a --MD -L -Y -t 47 ${ref} ${asm} | samtools sort -T ${outdir}/tmp -O bam -o ${outbam}
> samtools index ${outbam}
> 
> # Short-read data vs. reference mapping
> minimap2 -ax sr -t47 ${ref} ${read_1} ${read_2} | samtools sort -T ${outdir}/tmp -O bam -o ${outbam}
```

BWA:


Genome assembly
==============
Abyss:
```bash
# Paired-end multiple libraries
abyss-pe j=8 k=96 v=-v kc=3 H=4 B=25G -C /projects/btl_scratch/aafshinfard/projects/redcedar/runResult/abyss/kc3/k96/10M/ name=redCedar_ lib='lr1 lr2 lr3 lr4' lr1='/projects/btl_scratch/aafshinfard/projects/redcedar/subsample/non_random/10Mreadpairs/lr1_sub.fastq.gz' lr2='/projects/btl_scratch/aafshinfard/projects/redcedar/subsample/non_random/10Mreadpairs/lr2_sub.fastq.gz' lr3='/projects/btl_scratch/aafshinfard/projects/redcedar/subsample/non_random/10Mreadpairs/lr3_sub.fastq.gz' lr4='/projects/btl_scratch/aafshinfard/projects/redcedar/subsample/non_random/10Mreadpairs/lr4_sub.fastq.gz' |& tee  abyss_kc3_k96_10M.log &

# Paired-end single library
abyss-pe j=12 k=96 v=-v kc=4 H=4 B=25G -C /projects/btl_scratch/aafshinfard/projects/redcedar/runResult/abyss/linear/10M/kc4k96/ name=redCedar in='/projects/btl_scratch/aafshinfard/projects/redcedar/subsample/linear/10Mreadpairs_R1.fastq.gz /projects/btl_scratch/aafshinfard/projects/redcedar/subsample/linear/10Mreadpairs_R2.fastq.gz' |& tee abyss_kc4_k96_10M.log
```
Konnector: (close the insert in paired-end reads by traversing DBG)
```bash:
reads="../na24143_2x250/1_1.fq.gz ../na24143_2x250/1_2.fq.gz"
/projects/btl/vnikolic/installs/abyss-2.3.1/bin/konnector -k 120 -o konnector_ -b 200G -j48 --fastq $reads 2>&1 | tee konnector_full.log
/projects/btl/vnikolic/installs/abyss-2.3.1/bin/konnector --extend -k 120 -o konnector_extend_ -b 200G -j48 --fastq $reads 2>&1 | tee konnector_extend_full.log

```

Quast:
```bash
ref=/projects/btl_scratch/aafshinfard/projects/physlr/publication/drafts/grch38_no_Y_chromosome.fa

file=na12878.stlfr.arks
quast-lg -t48 -es --fast --large --scaffold-gap-max-size 100000 --min-identity 95 -R ${ref} -o ${file}.quast ${file}.fa

/projects/btl/aafshinfard/tools/quast/quast-5.0.2/quast.py --no-icarus ${file} -r $ref --large --threads 47 --output-dir ${file}.quast-detailed 2>&1 | tee ${file}.quast-detailed.log

# Interpreting output:
# 
# N50 - NG50 - LG75 - #miss - farction% - largest alignment - NGA50 - LGA75
# 19 - 20 - 26 - 27 - 40 - 45 - 48 - 54 
head na24143.pacbio.physlr.quast/transposed_report.txt -n4 | tail -n1 | awk '{print $19" - "$20" - "$26" - "$27" - "$40" - "$45" - "$48" - "$54}'
```

Jupiterplots:
```bash
# Variables
draftdir=/projects/btl_scratch/aafshinfard/projects/abyss2.5/hsapiens/experiments/numbers3/abyss2.5/na12878_2x151-2/assembly-k90-kc2-B200G/
prefix=assembly-scaffolds
ng=90
name=${prefix}_ng${ng}
dir=${draftdir}/jupiterplots_${name}/ #new dir for jupiterplot outputs
fasta=${prefix}.fa
fasta_renamed=${prefix}_renamed.fa
setupdir=/projects/btl_scratch/aafshinfard/projects/physlr/publication/figures/jupiterplots/jupiterplotcodes/JustinChu/ # Jupiterplot codes
ref=/projects/btl_scratch/aafshinfard/projects/physlr/publication/drafts/grch38_no_Y_chromosome.fa
# runs
mkdir $dir
cd $dir
cp -r ${setupdir}* ./
ln -s $ref
awk '/^>/{print ">" ++i; next}{print}' < ${draftdir}${fasta} > ${fasta_renamed}
./jupiter ng=$ng t=47 name=$name ref=grch38_no_Y_chromosome.fa fa=${fasta_renamed}
#
```
_________________________________
### Downlowd data using e-utils:
# fasta 
AcessionNumber=KX832626.1 # Platycladus orientalis chloroplast, complete genome
curl -s  "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=${AcessionNumber}&rettype=fasta&retmode=txt">${AcessionNumber}.fa

_________________________________
### ABySS: genome assembly by short seuqence reads.
- abyss 1
- abyss 2 with bloom filters, just set bloom parameters and abyss will set to run with bloom filters.
Bloom filter parameters: H=4 and B=50G, set them so you have low ....

examples:

_________________________________
### MUMmer / and nucmer
# find all maximal unique matches between ref and query
mummer -mum -b -c ref.fasta query.fasta > mummer.mums
# make a dotplot
mummerplot -x "[0,275287]" -y "[0,265111]" -postscript -p mummer mummer.mums
_________________________________


### LINKS:

_________________________________
### Sealer:

_________________________________
### ARCS and ARKS:


_________________________________
### Tigmint:
# github: https://github.com/bcgsc/tigmint


_________________________________
### physlr

_________________________________
### Bandage: Visualize assemblies

_________________________________
### ntHits and ntCard: k-mer cardinality calculation for genomic sequences

nthits -k32 -j8 /projects/btl_scratch/lcoombe/barcode-assemblies/unitig-graph/celegans/LRSIM-noVariantData/data/barcoded_reformatted.fastq.gz

ntcard -k32 -p freq /projects/btl_scratch/lcoombe/barcode-assemblies/unitig-graph/celegans/LRSIM-noVariantData/data/barcoded_reformatted.fastq.gz
ntcard -k32 -p freq /projects/btl_scratch/sjackman/physlr/HYN5VCCXX_4cp.fq.gz


# export PATH=/home/hmohamadi/ntCard/:$PATH
# export PATH=/home/hmohamadi/ntHits/:$PATH
# source /home/hmohamadi/.e7_env

_________________________________
### Samtools
#
samtools view -b |			# convert to bam
samtools view -u |			# convert to uncompressed bam
samtools sort -@8 -o			# sort a bam file in parallel and then output to ...
samtools -c output.bam 			#number of reads in bam file
samtools -c -F unicode output.bam 	# number of reads with a specific flag in bam file 
samtools -c -F 260 output.bam 		#number of MAPPED reads in bam file


