#!/bin/bash
#PBS -l select=1:ncpus=1:mem=64gb
#PBS -l walltime=8:30:00 
#PBS -N cellranger_count
#PBS -j oe
#PBS -o logs/
#PBS -M Yeji.Bae@seattlechildrens.org 
#PBS -m be 

PROJ=/active/taylor_s/people/ybae/RSC/singleCell/
FASTQS=/active/taylor_s/people/ybae/RSC/singleCell/PBMC_Alz/
# SAMPLE_SHEET=${PROJ}/src/sample_sheet.csv

CELLR=${PROJ}/results/
# Make the results directory if it doesn't exist
mkdir -p $CELLR
cd $CELLR

# module load cellranger/7.1.0

# perform alignments and counts
cellranger count --id=run_count_pbmc_alz_ybae \
   --transcriptome=/gpfs/shared_data/10X/cellranger-7.0.0/refdata-gex-GRCh38-2020-A \
   --fastqs=${FASTQS} \
   --sample=SRR13911909 \
   --localcores=8 \
   --localmem=64
# removed to maximize storage size 


# cellranger count --id=run_count_pbmc_alz2 \
#   --transcriptome=/gpfs/shared_data/10X/cellranger-7.0.0/refdata-gex-GRCh38-2020-A \
#   --fastqs=${FASTQS} \
#   --sample=SRR13911909,SRR13911910,SRR13911911,SRR13911912,SRR13911913,SRR13911914 \
#   --localcores=8 \
#   --localmem=64

SAMPLE=("SRR13911909" "SRR13911910" "SRR13911911" "SRR13911912" "SRR13911913" "SRR13911914")

for i in "${SAMPLE[@]}"; do
    echo "--- Running Cellranger count for sample: $i -------" 
    cellranger count --id=count_${i} \
      --transcriptome=/gpfs/shared_data/10X/cellranger-7.0.0/refdata-gex-GRCh38-2020-A \
      --fastqs=${FASTQS} \
      --sample=${i} \
      --localcores=8 \
      --localmem=64
done


