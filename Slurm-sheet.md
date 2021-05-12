Submit a job on slurm:
======

##### Create a script file:
Create a new .sh file, and setup what you want to run.
Below is an example script file:
```bash
#!/bin/bash
#SBATCH --partition=upgrade
#SBATCH --job-name=physlr-Numbers
#SBATCH --ntasks=48
#SBATCH --exclusive
#SBATCH --mem=360G
#SBATCH --output=log/%x_%j.out
#SBATCH -N 1-1
#SBATCH --workdir=/projects/btl_scratch/aafshinfard/projects/physlr/publication/experiments/stlfr/NA12878/physlr-rerun3/data
set -euo pipefail
export PATH="/gsc/software/linux-x86_64-centos7/R-3.6.3/lib64/R/bin/:/projects/btl/lcoombe/linuxbrew/bin/:/gsc/btl/linuxbrew/bin/:/home/aafshinfard/.linuxbrew/bin:/home/aafshinfard/.linuxbrew/sbin:/home/aafshinfard/perl5/bin:/gsc/btl/linuxbrew/bin/:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/puppetlabs/bin:/home/aafshinfard/bin:/bin/:$PATH"
hostname
date
/projects/btl/aafshinfard/tools/bin/memusg -t -o memusg.log ../bin/physlr-make physical-map t=48 lr=NA12878_stLFR ref=grch38_no_Y_chromosome protocol=stlfr python_executable=/projects/btl/aafshinfard/v
irtuEnv/pypy3/bin/pypy3 >full-physlr1.log 2>full-physlr2.log
date
```

##### Submit the job:
Log into an slurm node and submit your job using:
```bash
sbatch filename.sh
```

Commands to monitor jobs:
======
See status of job (default: for this user and 12am+)
```bash
sacct
sacct -a
sacct -S 06.04 # to see all data since a specific date
sacct --format=jobid,jobname,user,partition,elapsed,ncpus,state,nodelist,reqmem -X #cumulative data
```
