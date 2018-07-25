#!/bin/bash

rm ptraj.in

top='../ALA_dipeptide.prmtop'
for ((i=0; i<=31; i++)); do
  ext=`printf "%03i" $i`
  echo "trajin ./neb.r.$ext" >> ptraj.in
done
echo "trajout ./heat.restarts.mdcrd" >> ptraj.in
echo "go" >> ptraj.in
$AMBERHOME/bin/ptraj $top ptraj.in