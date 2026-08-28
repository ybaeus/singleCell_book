#!/bin/bash
# [코드 5-4], [코드 5-5] 셀 레인저 카운트 실행
# 책 챕터 05 (실습) 셀 레인저 카운트 실행

# 저장소 어디에서 실행해도 되도록 스크립트 위치(src)로 이동합니다.
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

FASTQS=../data/ 
TRANSCRIPTOME=../data/refdata-gex-GRCh38-2024-A 

# 셀 레인저는 --id 이름의 폴더를 "현재 작업 디렉터리"에 만듭니다.
# 결과가 data/ 아래에 생기도록 data 디렉터리로 이동합니다.
cd ../data/

SAMPLE=("SRR13911909" "SRR13911910" "SRR13911911" "SRR13911912" "SRR13911913" "SRR13911914")

for i in "${SAMPLE[@]}"; do
    echo "--- Running Cellranger count for sample: $i -------" 
    cellranger count --id=count_${i} \
      --transcriptome=${TRANSCRIPTOME} \
      --fastqs=${FASTQS} \
      --sample=${i} \
      --localcores=8 \
      --localmem=64 \
      --create-bam=false
done


