#!/bin/bash 
#####PTT INITIALIZATION VARIABLES### 
#BSUB -q mwgpu 
#BSUB -n 4 
#BSUB -J GPU_NudgedElasticBand_Example
#BSUB -o out 
#BSUB -e err


cd 4COOL1/
mpirun -np 32 $AMBERHOME/bin/sander.MPI -ng 32 -groupfile groupfile 


