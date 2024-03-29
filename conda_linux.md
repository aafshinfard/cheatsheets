Cheatsheet for Conda (Linux)
=====================
by Amirhossein, aafshinfard@gmail.com

Contents
========

* [Initial Steps](#initial-steps)
* [Environments](#environments)
* [Usefull Packages](#usefull-packages)
* [Uploading to Conda/Bioconda](#uploading-to-bioconda)

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
* deepcut: contains all packages I need for the deepcut project 
```bash
        # make a new conda env
> conda create --name deepcut python=3.5
        # install pysam, wrapper for htslib that powers samtools (https://github.com/pysam-developers/pysam)
> conda config --add channels defaults
> conda config --add channels conda-forge
> conda config --add channels bioconda
> conda install pysam
        # other packages required:
> mamba install -c bioconda minimap2 # to map reads against the draft assembly
> mamba install -c bioconda quast # to annotate the misassemblies for the reference-based ground truth generation

```

* aga: contains all packages I need for the AGA project 
```bash
        # make a new conda env
> conda create --name aga python=3.5
        # install mamba to faster install other packages
conda install -c conda-forge mamba
        # install qt for GfaViz
mamba install -c anaconda qt
mamba install -c anaconda mesa-libgl-cos6-x86_64
mamba install -c bioconda gfapy
# GfaViz is not available through conda, so:
git clone https://github.com/ggonnella/gfaviz
cd gfaviz
qmake # was originally qmake-qt5, but as I intalled qt via conda seems like I need to run like this...
make

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
axel [link]
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

* SRA toolkit:
```bash
> conda install -c bioconda/label/cf201901 sra-tools
# https://anaconda.org/bioconda/sra-tools
```



Uploading to Bioconda
==============
Summary: 
There is a GitHub repo for bioconda, and you need to fork and make a new branch and add a recipe for your tool. Then you test it locally to see if it builds okay, and then you can push your changes back to the main repo and it will be available for users. Follow the instructions in the link below:
https://bioconda.github.io/contributor/index.html
checking locally:
https://bioconda.github.io/contributor/building-locally.html


Log of environments
==============
* python39:
```bash
> conda create -n python39 python=3.9
> conda activate python39
> conda install -c conda-forge mamba
> mamba install -c conda-forge pypy3.9
> mamba install -c bioconda btllib
```

* python39_2:
```bash
> conda create -n python39_2 python=3.9
> conda activate python39_2
> conda install -c conda-forge mamba
```


* btllib-dev:
Developer-ready env for btllib
```bash
> echo "conda-forge::mamba" >> x.txt
> echo "bioconda::btllib" >> x.txt
> conda create --name btllib-dev --file x.txt
> rm x.txt
> conda activate btllib-dev
> mamba install -c conda-forge meson ninja wheel llvm-openmp compilers
> mamba install -c anaconda cmake pip swig 
> 
```
