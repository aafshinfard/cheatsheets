## Linux cheatsheet
## This document is being updated and is not organised in a clean/rationale order

######################################################
#### Beginner:
cd /
cd ..
touch XYZ.FORMAT
gedit XYZ.FORMAT
mkdir
rmdir
rm -r

ls
ls -lrh
wc -l

redirect both stderr and stdout to the same log file
>>log_file_name 2>&1


# check how far into the file the process has read:
pv -pd PROCESS_ID

######################################################
#### Advanced:

### piping:
XYZ | YZX | ZXY
	cat largeTextFile.txt | less
	gunzip -c /projects/btl/x/data/10x/R1.fastq.gz | head -n 10000 | tail -n 20 | awk '{print length}'

### Running programs in the background from terminal
setsid XYZ
	setsid gedit cheatsheets/linux_sheet
	setsid java -jar ./ABySS-explorer.jar
XYZ & disown
	java -jar ./ABySS-explorer.jar & disown
(XYZ &)
	(java -jar ./ABySS-explorer.jar &)

### Running in background and redirecting output to file:
some_cmnd > some_file 2>&1 &

### less command:



### awk command
# awk {'print length'}
# row editing/filtering: https://www.tim-dennis.com/data/tech/2016/08/09/using-awk-filter-rows.html

### ssh (to become connected to a server/node)
ssh NAME_OF_THE_SERVER
	ssh genesis
## Run command and leave ssh
# https://askubuntu.com/questions/8653/how-to-keep-processes-running-after-ending-ssh-session
# Answer: tmux (which is superior to screen):
# ssh into machine then:
tmux
# then run the command inside started session i ntmux
# leave by typing ctrl+b and then d
tmux attach
# for running multiple tasks, check the askubuntu ticket again and read the complete answer




#### all awk
awk 'NF<3 {print} (s<3 && NF>2) {print} {s=NF}' f1chr4.k32-w32.n100-1000.c2-x.physlr.overlap.n0.tsv > f1chr4.k32-w32.n100-1000.c2-x.physlr.overlap.n0.w15000.tsv
awk '(s>3 && NF>3 && $4>15000) {print} {s=NF}' f1chr4.k32-w32.n100-1000.c2-x.physlr.overlap.n0.tsv >> f1chr4.k32-w32.n100-1000.c2-x.physlr.overlap.n0.w15000.tsv
awk '(NF>3 && s>3) {print} {s=NF}' ${file_overlap}.tsv > ${file_overlap}.edges.tsv
head ${file_overlap}.edges.tsv
awk 'NR==FNR{a[$1$2]++;next} ($1$2 in a){print $1"\t"$2"\t"$3"\t"$4"\t1"}' ${file_true_edges} ${file_overlap}.edges.tsv > ${file_overlap}.edges.labeled_t.tsv
awk 'NR==FNR{a[$2$1]++;next} ($1$2 in a){print $1"\t"$2"\t"$3"\t"$4"\t1"}' ${file_true_edges} ${file_overlap}.edges.tsv >> ${file_overlap}.edges.labeled_t.tsv
awk 'NR==FNR{a[$1$2]++;next} !($1$2 in a){print $1"\t"$2"\t"$3"\t"$4"\t0"}' ${file_overlap}.edges.labeled_t.tsv ${file_overlap}.edges.tsv > ${file_overlap}.edges.labeled_f.tsv



##################
### Process related:
pv -pd <pid>  //will show how much the process has read through an input file, which can help you get a sense of how much longer the process will take


###################
### Run-time and memory-peak monitoring:
/home/kmnip/bin/memusg -t YOUR COMMAND HERE


### SLURM job submitting

#!/bin/bash
#SBATCH --partition=upgrade
#SBATCH --job-name=YOUR_JOB_NAME_HERE
#SBATCH --exclusive
#SBATCH --output=%x_%j.out
#SBATCH --workdir=/path/of/your/log/directory
set -euo pipefail // make sure that commands error out
hostname // machine name for troubleshooting
date // start date and time
memusg -t YOUR COMMAND HERE
date // end date and time
- To submit the script on Numbers:
sbatch script.sh

The bits for hostname , date , and set -euo pipefail are not required at all
