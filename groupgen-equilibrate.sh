#!/bin/bash



mkdir 2EQUIL/
cd 2EQUIL/

if [[ -e groupfile ]] ; then

  rm groupfile

fi

for ((i=0; i <=31 ; i++)) ; do

  ext=`printf "%03i" $i`

  echo -O -p ../ALA_dipeptide.prmtop -c ../1HEAT/neb.r.$ext -i ./2equil.in -x ./neb.x.$ext \
  -o ./neb.out.$ext -inf ./neb.info.$ext -r ./neb.r.$ext >> groupfile

done



cat > 2equil.in <<EOF

100ps NEB ALA-ALA equilibration

 &cntrl

  imin = 0, irest = 1, ntx=5,
  ntc=1, ntf=1,
  ntpr=1000, ntwx=5000,
  ntb = 0, cut = 999.0, rgbmax=999.0,
  igb = 1, saltcon=0.2,
  nstlim = 100000, nscm= 0,
  dt = 0.001,
  ntt = 3, gamma_ln=1000.0,
  temp0=300,
  ineb = 1,skmin = 50,skmax = 50
  tgtfitmask=":1,2,3",
  tgtrmsmask=":1,2,3@N,CA,C",
  ig=-1,
 /

EOF



cd ..

