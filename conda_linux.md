Cheatsheet for Conda (Linux)
=====================
by Amirhossein, aafshinfard@gmail.com

Contents
========

* [Initial Steps](#initial-steps)
* [Basics](#basics)
* [Environments](#environments)
* [Usefull Packages](#usefull-packages)

Initial Steps
==============
* Install Conda


* Create new environment:
```bash
> conda create --name env_name 
```


* Activate environment while another env is active:
```bash
> conda activate --name env_name 
```

* Activate an environment:
```bash
> conda_env "NAME_OF_ENV" #function added to the `.bashrc`
```

* Make sure miniconda lib is leading the $PATH after activation:
```bash
$ echo $PATH
/projects/btl/aafshinfard/miniconda3/envs/"NAME_OF_ENV"/bin:/p...
```

* Function to activate an env (added to the `bashrc` file):

```bash
function conda_env(){
        env_name=$1
        source /projects/btl/aafshinfard/miniconda3/bin/activate ${env_name}
}
```

Environments:
==============
* sra:
SRA toolkit / 

```bash
> conda install -c bioconda/label/cf201901 sra-tools
# https://anaconda.org/bioconda/sra-tools
```


* rust-env:

```bash
> conda install -c conda-forge/label/rust_dev rust
# https://anaconda.org/conda-forge/rust
```

* qt:
```bash

```

* rust-mdb:
```bash
rust
gfatools
rust-mdbg
```

* axel
```bash
# Lightweight CLI download accelerator / a fast alternative to wget
# axel: https://anaconda.org/conda-forge/axel
axel
```

* bioconda-utils
```bash
mamba create -n bioconda -c conda-forge -c bioconda bioconda-utils
```

Usefull packages
==============
* mamba
```bash
# Mamba is a reimplementation of the conda package manager in C++
# https://github.com/mamba-org/mamba
# install just like any other conda package and then you can do `mamba install` instead of `conda install`
```
