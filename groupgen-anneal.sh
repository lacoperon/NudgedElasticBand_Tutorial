#!/bin/bash

mkdir 3ANNEAL/
cd 3ANNEAL/

if [[ -e groupfile ]] ; then
  rm groupfile
fi

for ((i=0; i <= 31; i++)) ; do
  ext=`printf "%03i" $i`
  echo -O -p ../ALA_dipeptide.prmtop -c ../2EQUIL/neb.r.$ext -i ./3anneal.in -x ./neb.x.$ext -o ./neb.out.$ext -inf ./neb.info.$ext -r ./neb.r.$ext >> groupfile
done

cat > 3anneal.in <<EOF

300ps NEB ALA-ALA simulated annealing
 &cntrl
  imin = 0, irest = 1, ntx=5,
  ntc=1, ntf=1,
  ntpr=500, ntwx=10000,
  ntb = 0, cut = 999.0, rgbmax=999.0,
  igb = 1, saltcon=0.2,
  nstlim = 600000, nscm= 0,
  dt = 0.0005,
  ntt = 3, gamma_ln=1000.0,
  temp0=300,
  ineb = 1,skmin = 50,skmax = 50,
  tgtfitmask=":1,2,3",
  tgtrmsmask=":1,2,3@N,CA,C",
  nmropt=1, ig=-1,
 /
 &wt type='TEMP0', istep1=0,istep2=100000,
   value1=300.0, value2=400.0
 /
 &wt type='TEMP0', istep1=100001,istep2=200000,
   value1=400.0, value2=400.0
 /
 &wt type='TEMP0', istep1=200001,istep2=300000,
   value1=400.0, value2=500.0
 /
 &wt type='TEMP0', istep1=300001,istep2=400000,
   value1=500.0, value2=500.0
 /
 &wt type='TEMP0', istep1=400001,istep2=500000,
   value1=500.0, value2=300.0
 /
 &wt type='TEMP0', istep1=500001,istep2=600000,
   value1=300.0, value2=300.0
 /
 &wt type='END'
 /

EOF

cd ..

