#!/bin/bash

cd /home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/urban_farm_contigs
source /home/eharrels/scratch/applications/miniconda3/bin/activate amrfinder
for file in *fasta; do
  out=${file/.contig.fasta/_amr}

  # Ensure  file exists before running amrfinder
  if [[ -f "$file" ]]; then
    # Extract the base name for output
    base_name=$(basename "$out")
    output_path="/home/eharrels/scratch/MDR_Urbanfarm/Urban_Farm/amrfinder/${base_name}"

    # Run amrfinder
    amrfinder -n "$file" --plus -o "$output_path"
  else
    echo "fasta file not found: $file"
  fi
done

