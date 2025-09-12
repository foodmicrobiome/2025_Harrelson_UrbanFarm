#!/bin/bash

cd /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/urban_farm_contigs/MDR_contigs/contigs
source /home/eharrels/scratch/applications/miniconda3/bin/activate rgi

rgi load --card_json /home/eharrels/scratch/applications/references/card.json --local

for R1 in *fasta; do
  output=${R1/.contig.fasta/_card}
	rgi main -i "$R1" -n 16 -o /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/card_output/"$output" --local --clean -d wgs 
done
