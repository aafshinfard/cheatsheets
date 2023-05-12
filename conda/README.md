This folder contains conda environment clones most of which are listed below.
In order to create a new environment equivalent to a SOURCE env:
```
conda create --name cloned_env
conda activate cloned_env
conda env update --name root --file SOURCE.yml
```

- btl: core bioinformatics tools needed for BTL analysis
-

Things to add:
- physlrpy3.7: conda env to run latest Physlr via pypy3 and python 3.7 (indexlr should be included too)
- 
