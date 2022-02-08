Cheatsheet for Conda (Linux)
=====================
by Amirhossein, aafshinfard@gmail.com

Contents
========

* [Initial Steps](#initial-steps)
* [Basics](#basics)


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
> conda install -c bioconda sra-tools
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
