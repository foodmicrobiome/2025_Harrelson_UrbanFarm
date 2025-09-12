#!/bin/bash

cd /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/
#removes any existing checkm_results directory in the directory if it exists
rm -rf checkm_results

#makes a new one
mkdir checkm_results

#load checkm in conda
source /home/eharrels/scratch/applications/miniconda3/bin/activate checkm

#run checkM
checkm lineage_wf -t 12 -x fasta urban_farm_contigs checkm_results


