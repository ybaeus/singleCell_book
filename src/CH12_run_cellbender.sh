#!/bin/bash
# [코드 CH12_run_cellbender.sh] CellBender로 배경 RNA 제거하기
# 책 챕터 12.1.2 배경 RNA 제거

cellbender remove-background \
  --input raw_feature_bc_matrix.h5 \
  --output output.h5 \
  --fpr 0.01 \
  --epochs 150
