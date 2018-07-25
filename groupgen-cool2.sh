#!/bin/bash

mkdir 5COOL2/
cd 5COOL2/

if [[ -e groupfile ]] ; then
  rm groupfile
fi

for ((i=0; i <=31; i++)) ; do
  ext=`printf "%03i" $i`
  echo -O -p ../str1.prmtop -c ../4COOL1/neb.r.$ext -i ./5cool2.in -x ./neb.x.$ext -o ./neb.out.$ext \
  -inf ./neb.info.$ext -r ./neb.r.$ext >> groupfile

done
cat > 5cool2.in <<EOF
50ps NEB ALA-ALA cool stage 2
 &cntrl
  imin = 0, irest = 1, ntx=5,
  ntc=1, ntf=1,
  ntpr=100, ntwx=10000,
  ntb = 0, cut = 999.0, rgbmax=999.0,
  igb = 1, saltcon=0.2,
  nstlim = 200000, nscm= 0,
  dt = 0.001,
  ntt = 3, gamma_ln=1000.0,
  temp0=0.0,
  ineb = 1,skmin = 50,skmax = 50,
  tgtfitmask=":1,2,3",
  tgtrmsmask=":1,2,3@N,CA,C",
  vv=1,vfac=0.1,ig=-1,
 /
EOF
cd ..
