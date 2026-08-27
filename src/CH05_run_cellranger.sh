#!/bin/bash
# [코드 5-4], [코드 5-5] 셀 레인저 카운트 실행
# 책 챕터 05 (실습) 셀 레인저 카운트 실행

FASTQS=../data/ 
TRANSCRIPTOME=../data/refdata-gex-GRCh38-2024-A 

SAMPLE=("SRR13911909" "SRR13911910" "SRR13911911" "SRR13911912" "SRR13911913" "SRR13911914")

for i in "${SAMPLE[@]}"; do
    echo "--- Running Cellranger count for sample: $i -------" 
    cellranger count --id=count_${i} \
      --transcriptome=${TRANSCRIPTOME} \
      --fastqs="./" \
      --sample=${i} \
      --localcores=8 \
      --localmem=64 \
      --create-bam=false
done


