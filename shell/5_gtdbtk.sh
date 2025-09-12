#!/bin/bash

cd /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/urban_farm_contigs
source /home/eharrels/scratch/applications/miniconda3/bin/activate gtdbtk-2.1.1 
gtdbtk classify_wf --genome_dir /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/urban_farm_contigs/MDR_contigs --out_dir MDR --skip_ani_screen --extension fasta --cpu 10
