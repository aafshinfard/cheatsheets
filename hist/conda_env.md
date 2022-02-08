## How to:

* Activating an environment:
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

## Environments: 

* rust-env:

Rust installed
Rust mdbg

```bash
> conda install -c conda-forge/label/rust_dev rust
> conda install -c pkgw-forge cargo
```

* qt:
```bash

```
