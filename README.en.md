[한국어](README.md) | **English**

# Practical Single-Cell Data Analysis - Practice Code

Companion code for the Korean book *실전 단일세포 데이터 분석: 예제 코드와 데이터로 배우는 생물정보 분석 기술*
(*Practical Single-Cell Data Analysis*).

## About

It walks through a full single-cell RNA-seq workflow on PBMC samples from Alzheimer's disease
patients and healthy individuals: raw data download, Cell Ranger counting, quality control,
normalization, integration, clustering, cell type annotation, differential expression, and
a tour of additional analysis tools.

## Dataset

Six samples from SRA study **SRP309935** (source: `data/SraRunTable.csv`):

| Run | GEO | Age | Group | Tissue |
|-----|-----|-----|-------|--------|
| SRR13911909 | GSM5145401 | 67 | normal individual | blood |
| SRR13911910 | GSM5145402 | 73 | normal individual | blood |
| SRR13911911 | GSM5145403 | 71 | patient with mild AD | blood |
| SRR13911912 | GSM5145404 | 73 | patient with mild AD | blood |
| SRR13911913 | GSM5145405 | 82 | patient with severe AD | blood |
| SRR13911914 | GSM5145406 | 90 | patient with severe AD | blood |

Only the `filtered_feature_bc_matrix.h5` output of each sample is tracked here. FASTQ files and
the genome reference are too large to ship and must be downloaded.

## Layout

```
.
├── data/                 # per-sample Cell Ranger h5 output, sample metadata
│   ├── count_SRR139119**/outs/filtered_feature_bc_matrix.h5
│   └── SraRunTable.csv
├── src/                  # practice code
├── results/              # analysis output (CSV, etc.)
├── README.md             # Korean
└── README.en.md          # English
```

## Chapter to file map

| Book chapter | File |
|--------------|------|
| Ch. 02 R basics | `src/CH02_R.qmd`, `src/CH02_R.R` |
| Ch. 04 Downloading sequencing data | `src/CH04_sra_download.sh`, `src/CH04_sra_download_multithread.sh` |
| Ch. 05 Cell Ranger | `src/CH05_change_fastq_name.sh`, `src/CH05_run_cellranger.sh` |
| Ch. 06 - Ch. 12 (the whole R workflow) | `src/singleCell_분석_기초편.Rmd` |
| Ch. 12 CellBender (ambient RNA removal) | `src/CH12_run_cellbender.sh` |

## Getting started

1. **Data** - the tracked `h5` files let you start straight at Chapter 6. To build them from raw
   reads instead, run Chapters 4 and 5 in order:

   ```bash
   cd src
   bash CH04_sra_download.sh          # fetch FASTQ (can take many hours)
   bash CH05_change_fastq_name.sh     # rename to the Cell Ranger convention
   bash CH05_run_cellranger.sh        # run cellranger count
   ```

2. **R analysis** - open `singleCell.Rproj` in RStudio and work through
   `src/singleCell_분석_기초편.Rmd`. Chunks follow the book's order.

## Code numbering

Each chunk label and the caption above it map 1:1 to a numbered listing in the book.

````
[코드 6-2] 2가지 방법으로 슈랏 오브젝트 생성하기
```{r code6_2}
...
```
````

Code that is *not* in the book (scratch or reference material) is marked:

```
<!-- (책 수록 코드 아님: 참고/실험용) -->
```

## Requirements

- R and RStudio
- Seurat v5 (see listing 6-1 in Chapter 6)
- Cell Ranger 8.0.1 or newer (Chapter 5)
- SRA-Toolkit 3.1.0 or newer (Chapter 4)
- Human reference `refdata-gex-GRCh38-2024-A` (Chapter 5)

## Questions

Open a GitHub issue: **Issues** tab → **New issue**.
