in the tests directory there is:

```
./test_installation.sh
```
then I can run:
```
ntLink scaffold -B target=scaffolds_1.fa reads=long_reads_1.fa  w=250 -n
```
for the full pipeline, but I can also run the following to only generating up tp the dot file:

```
../ntLink scaffolds_1.fa.k32.w250.z1000.n1.scaffold.dot reads=long_reads_1.fa prefix=scaffolds_1.fa.k32.w250.z1000 n=1 w=250 z=1000 k=32 target=scaffolds_1.fa -n
```

in the `gfa` branch of ntlink, I can also run:
```
../ntLink scaffolds_1.fa.k32.w250.z1000.n1.scaffold.gfa reads=long_reads_1.fa prefix=scaffolds_1.fa.k32.w250.z1000 n=1 w=250 z=1000 k=32 target=scaffolds_1.fa -n
```
to generate the `gfa` equivalent of the `dot` file
