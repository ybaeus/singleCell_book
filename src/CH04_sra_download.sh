#!/bin/bash

SRR=("SRR13911910" "SRR13911911" "SRR13911912" "SRR13911913" "SRR13911914")

for i in "${SRR[@]}"; do
   echo "Downloading Sample: $i" 
   fasterq-dump ${i} -O ../data/${i}/

   # gzip을 사용하여 FASTQ 파일 압축하기
   gzip ../data/${i}/*.fastq
   # (멀티스레드로 더 빠르게 압축하려면 CH04_sra_download_multithread.sh 를 사용하세요)
done 
