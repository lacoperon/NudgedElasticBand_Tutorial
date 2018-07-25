#!/bin/bash 
#####PTT INITIALIZATION VARIABLES### 
#BSUB -q mwgpu 
#BSUB -n 4 
#BSUB -J GPU_NudgedElasticBand_ExampleAnneal
#BSUB -o out 
#BSUB -e err


cd 3ANNEAL/
mpirun -np 32 $AMBERHOME/bin/sander.MPI -ng 32 -groupfile groupfile 


