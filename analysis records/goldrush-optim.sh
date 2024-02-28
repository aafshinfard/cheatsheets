# README content 1 (set 1)
Goldrush parameters used for these experiments:
# set by Amirhossein
reads=
t=45
# optimization work
z=2000
tile=1750
b=6
u=6
a=1
o=0.15
x=19
m=20000
M=7
r=0.85
P=20
d=4
span=2
dist=500
k_ntLink=40
w_ntLink=250
rounds=6

command time -v -o time.goldrush-run.time goldrush run reads=${reads} G=3e9 t=$t z=$z tile=${tile} b=$b u=$u a=$a o=$o x=$x m=$m M=$M r=$r P=$P d=$d span=${span} dist=${dist} k_ntLink=${k_ntLink} w_ntLink=${w_ntLink} rounds=${rounds} > log.goldrush-run.log 2>&1


######################################
# README content 2 (set 2)
Goldrush parameters used for these experiments:

# set by Amirhossein
reads=
t=45
# optimization work
z=2250
tile=1000
b=9
u=8
a=1
o=0.05
x=7
m=20000
M=6
r=0.95
P=19
d=5
span=3
dist=750
k_ntLink=40
w_ntLink=250
rounds=7

command time -v -o time.goldrush-run.time goldrush run reads=${reads} G=3e9 t=$t z=$z tile=${tile} b=$b u=$u a=$a o=$o x=$x m=$m M=$M r=$r P=$P d=$d span=${span} dist=${dist} k_ntLink=${k_ntLink} w_ntLink=${w_ntLink} rounds=${rounds} > log.goldrush-run.log 2>&1
