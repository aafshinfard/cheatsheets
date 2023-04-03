# Physlr
## Setup Physlr
```
git clone git@github.com:bcgsc/physlr.git
conda_env physlr_ready // dependencies for compiling
cd physlr/src
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
```
