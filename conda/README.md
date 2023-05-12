## Conda envs container
This folder contains conda environment clones most of which are listed below. It helps creating new environments quickly.

### Intro

In order to create a new environment equivalent to a SOURCE env listed in this doc, there are two options:

**1-** if the `yml` file was just created from another env with the following command:
```
conda activate SOURCE
conda env export > SOURCE.yml
```
and with no edits, then we use `udpdate` to replicate:
```
conda create --name cloned_env
conda activate cloned_env
conda env update --name root --file SOURCE.yml
```

**2-** Otherwise, the last line of the `yml` file can be removed and the first line edited to carry the name of te new environment we desire.
Then, the following command will create a new environment using the `yml` file:

```
conda env create -f environment.yml
```

**Bonus tip:** use mamba for a faster installation:
```
# install mamba in your base env:
conda install mamba -n base -c conda-forge
# now, type mamba instead conda for all create and install commands
mamba env create -f SOURCE.yml
```
## List 1: 
- btl: core bioinformatics tools needed for BTL analysis
-

## List 2: things to add
- physlrpy3.7: conda env to run latest Physlr via pypy3 and python 3.7 (indexlr should be included too)
- 
