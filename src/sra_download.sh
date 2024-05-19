#!/bin/bash

SRR=("SRR13911909" "SRR13911910" "SRR13911911" "SRR13911912" "SRR13911913" "SRR13911914")

for i in "${SRR[@]}"; do
    echo "Downloading Sample: $i" 
    prefetch --max-size 100g ${i}
    echo "The SRA file: ${i}/${i}.sra"
    fasterq-dump ${i}/${i}.sra 
done
