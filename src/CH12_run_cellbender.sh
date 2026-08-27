#!/bin/bash
# [코드 12-10] CellBender를 이용하여 배경 RNA 제거하기
# 책 챕터 12.1.2 배경 RNA 제거
# (value) 부분은 샘플에 맞는 값으로 바꿔서 실행하세요.

cellbender remove-background \
  --input raw_feature_bc_matrix.h5 \
  --output output.h5 \
  --expected-cells (value) \
  --total-droplets-included (value) \
  --fpr 0.01 \
  --epochs 150
