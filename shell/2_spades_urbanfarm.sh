#!/bin/bash

cd /home/eharrels/scratch/applications/spades/SPAdes-4.0.0-Linux/bin
export PATH=$PATH:/home/eharrels/scratch/applications/miniconda3/bin

# Iterate over R1 files
for file1 in /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/trimmed/*R1_PE.fastq.gz; do
  file2=${file1/R1_PE.fastq.gz/R2_PE.fastq.gz}   # Find corresponding R2 file
  out=spades_${file1##*/}   # Get basename and prefix for output
  out=${out/_R1_PE.fastq.gz}  # Strip R1_PE part
  python spades.py -1 $file1 -2 $file2 -o /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/spade_outputs/$out &
done

wait

