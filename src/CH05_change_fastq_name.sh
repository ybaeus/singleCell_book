#!/bin/bash

# 저장소 어디에서 실행해도 되도록 스크립트 위치(src)로 이동합니다.
cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1

SAMPLE_PATH="../data/" # 각 샘플 폴더에 fastq 파일들이 존재해야 합니다. (샘플 폴더s: "SRR13911909" "SRR13911910" "SRR13911911" "SRR13911912" "SRR13911913" "SRR13911914")

for i in "${SAMPLE_PATH}"*; do
  # 디렉토리 경로만 이용
  if [ -d "$i" ]; then 

    # 샘플 이름 추출 
    sample_name=$(basename "$i")
    echo "Changing FASTQ name of sample: ${sample_name}"

    # FASTQ 이름 셀 레인저 INPUT 형식으로 변경 
    ## R1 (바코드 및 UMI 시퀀스) 
    mv ${SAMPLE_PATH}${sample_name}/${sample_name}_1.fastq.gz ${SAMPLE_PATH}${sample_name}/${sample_name}_S1_L001_R1_001.fastq.gz
    ## R2 (리드 시퀀스)
    mv ${SAMPLE_PATH}${sample_name}/${sample_name}_2.fastq.gz ${SAMPLE_PATH}${sample_name}/${sample_name}_S1_L001_R2_001.fastq.gz
  fi
done
