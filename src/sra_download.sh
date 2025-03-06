#!/bin/bash

SRR=("SRR13911910" "SRR13911911" "SRR13911912" "SRR13911913" "SRR13911914")

for i in "${SRR[@]}"; do
   echo "Downloading Sample: $i" 
   fasterq-dump ${i} -O ../data/${i}/

   # Compress the FASTQ files using pigz (faster) or gzip (slower)
   pigz -p 4 ../data/${i}/*.fastq  # Use 4 CPU threads
done 
