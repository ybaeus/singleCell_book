#!/bin/bash
# [코드 CH04_sra_download_multithread.sh] 멀티스레드를 이용한 실습 데이터 다운로드 스크립트
# 책 챕터 04 (실습) 데이터 다운로드

# 이 스크립트가 있는 위치(src)를 작업 디렉터리로 삼습니다.
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR"

SRR=("SRR13911909" "SRR13911910" "SRR13911911" "SRR13911912" "SRR13911913" "SRR13911914")

for i in "${SRR[@]}"; do
    echo "Downloading Sample: $i"
    fasterq-dump -e 4 ${i} -O ../data/${i}/

    # pigz를 사용하여 멀티스레드로 FASTQ 파일 압축하기
    pigz -p 4 ../data/${i}/*.fastq

done
