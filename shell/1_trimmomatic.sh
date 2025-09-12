#!/bin/bash

# directory of Raw Fastq files from 
cd /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/raw

#run trimmomatic on all files
for R1 in *_R1_001.fastq.gz;do
  R2="${R1/_R1_001.fastq.gz/_R2_001.fastq.gz}"
  java -jar /home/eharrels/scratch/applications/trimmomatic/Trimmomatic/dist/jar/trimmomatic-0.40-rc1.jar PE -threads 16 "$R1" "$R2" \
    "/home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/trimmed/${R1/_R1_001.fastq.gz/_R1_PE.fastq.gz}" \
    "/home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/trimmed/${R1/_R1_001.fastq.gz/_R1_SR.fastq.gz}" \
    "/home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/trimmed/${R1/_R1_001.fastq.gz/_R2_PE.fastq.gz}" \
    "/home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/trimmed/${R1/_R1_001.fastq.gz/_R2_SR.fastq.gz}" \
    ILLUMINACLIP:/home/eharrels/scratch/applications/trimmomatic/Trimmomatic/adapters/TruSeq3-PE.fa:2:15:10:1 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:20 MINLEN:36
done

