#!/bin/bash

mkdir 4COOL1/
cd 4COOL1/

if [[ -e groupfile ]] ; then
  rm groupfile
fi

for ((i=0; i <=31; i++)) ; do
  ext=`printf "%03i" $i`
  echo -O -p ../ALA_dipeptide.prmtop -c ../3ANNEAL/neb.r.$ext -i ./4cool1.in -x ./neb.x.$ext -o ./neb.out.$ext \
 -inf ./neb.info.$ext -r ./neb.r.$ext >> groupfile
done
cat > 4cool1.in <<EOF
120ps NEB ALA-ALA cool stage 1
 &cntrl
  imin = 0, irest = 1, ntx=5,
  ntc=1, ntf=1,
  ntpr=500, ntwx=10000,
  ntb = 0, cut = 999.0, rgbmax=999.0,
  igb = 1, saltcon=0.2,
  nstlim = 120000, nscm= 0,
  dt = 0.001,
  ntt = 3, gamma_ln=1000.0,
  temp0=300,
  ineb = 1,skmin = 50,skmax = 50,
  tgtfitmask=":1,2,3",
  tgtrmsmask=":1,2,3@N,CA,C",
  nmropt=1,ig=-1,
 /
 &wt type='TEMP0', istep1=0,istep2=10000,
   value1=300.0, value2=250.0
 /
 &wt type='TEMP0', istep1=10001,istep2=20000,
   value1=250.0, value2=250.0
 /
 &wt type='TEMP0', istep1=20001,istep2=30000,
   value1=250.0, value2=200.0
 /
 &wt type='TEMP0', istep1=30001,istep2=40000,
   value1=200.0, value2=200.0
 /
 &wt type='TEMP0', istep1=40001,istep2=50000,
   value1=200.0, value2=150.0
 /
 &wt type='TEMP0', istep1=50001,istep2=60000,
   value1=150.0, value2=150.0
 /
 &wt type='TEMP0', istep1=60001,istep2=70000,
   value1=150.0, value2=100.0
 /
 &wt type='TEMP0', istep1=70001,istep2=80000,
   value1=100.0, value2=100.0
 /
 &wt type='TEMP0', istep1=80001,istep2=90000,
   value1=100.0, value2=50.0
 /
 &wt type='TEMP0', istep1=90001,istep2=100000,
   value1=50.0, value2=50.0
 /
 &wt type='TEMP0', istep1=100001,istep2=110000,
   value1=50.0, value2=0.0
 /
 &wt type='TEMP0', istep1=110001,istep2=120000,
   value1=0.0, value2=0.0
 /
 &wt type='END'
 /

EOF
cd ..
