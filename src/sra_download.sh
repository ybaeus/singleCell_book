#!/bin/bash

SRR=("SRR13911910" "SRR13911911" "SRR13911912" "SRR13911913" "SRR13911914")

for i in "${SRR[@]}"; do
    echo "Downloading Sample: $i" 
    fasterq-dump ${i} -O ${i}/ 
done
