#!/bin/bash

cd /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/mobileOG-db_workdir2
source /home/eharrels/scratch/applications/miniconda3/bin/activate mobileOG-db


for fasta in *fasta; do 
chmod +x mobileOGs-pl-kyanite.sh

./mobileOGs-pl-kyanite.sh -i $fasta -d mobileOG-db-beatrix-1.6.dmnd -m mobileOG-class_information.csv -k 15 -e 1e-20 -p 90 -q 90
done

