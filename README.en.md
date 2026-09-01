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

- FASTQ data: fetched by `src/CH04_sra_download.sh`.
- Cell Ranger and the genome reference: download them yourself from the 10x Genomics
  download center. It requires a login and license agreement, so no automated download
  command can be shipped. `src/CH05_setup_cellranger.sh` documents where to get them and
  how to unpack them.
- The cell type annotation reference (`pbmc_multimodal_2023.rds`) is downloaded from R by
  listing 10-6 in `src/singleCell_분석.Rmd`.

The listings below read other files from the Cell Ranger `outs` folder, so they can only be
followed if you ran Cell Ranger yourself in chapter 05.

| Listing | Files it needs |
|---------|----------------|
| Listing 6-2, second method (MEX folder); listing 6-3 | `outs/filtered_feature_bc_matrix/` |
| Listings 12-6 and 12-7 (SoupX) | `outs/raw_feature_bc_matrix/`, `outs/filtered_feature_bc_matrix/`, `outs/analysis/` |
| `CH12_run_cellbender.sh` (CellBender) | `outs/raw_feature_bc_matrix.h5` |

If you only downloaded the h5 files, use the first method in listing 6-2 and skip the rest. The
remaining analysis is unaffected.

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
| Ch. 02 R basics | `src/CH02_R.qmd` |
| Ch. 04 Downloading sequencing data | `src/CH04_setup_sratoolkit.sh`, `src/CH04_sra_download.sh`, `src/CH04_sra_download_multithread.sh` |
| Ch. 05 Cell Ranger | `src/CH05_setup_cellranger.sh`, `src/CH05_change_fastq_name.sh`, `src/CH05_run_cellranger.sh` |
| Ch. 06 - Ch. 12 (the whole R workflow) | `src/singleCell_분석.Rmd` |
| Ch. 12 CellBender (ambient RNA removal) | `src/CH12_run_cellbender.sh` |

## Environment setup

R and the tools the practice code needs can be set up in one go with pixi.
See the official docs (pixi.sh) for how to install pixi itself.

Create a `pixi.toml` at the top of the repository:

```toml
[project]
name = "singleCell_book"
channels = ["conda-forge", "bioconda"]
platforms = ["linux-64", "osx-arm64"]

[dependencies]
r-base = "*"
r-essentials = "*"
```

Then install the environment and start R inside it:

```bash
pixi install     # install the environment described in pixi.toml
pixi run R       # start R inside that environment
```

R packages such as Seurat are installed by the chapter code itself: listing 6-1 for the
core packages, and the install lines in each section of chapter 12 for the extra tools.

## Getting started

1. **Data** - the tracked `h5` files let you start straight at Chapter 6. To build them from raw
   reads instead, run Chapters 4 and 5 in order:

   The shell scripts locate themselves and switch to `src/`, so they work from anywhere in the repo.

   ```bash
   cd src
   bash CH04_sra_download.sh          # fetch FASTQ (can take many hours)
   bash CH05_change_fastq_name.sh     # rename to the Cell Ranger convention
   bash CH05_run_cellranger.sh        # run cellranger count
   ```

2. **R analysis** - open `singleCell.Rproj` in RStudio and work through
   `src/singleCell_분석.Rmd`. Chunks follow the book's order. The notebook uses relative paths
   like `../data/`, so knit it from `src/` (see `knitr::opts_knit$set(root.dir = getwd())` in the
   first chunk).

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
- Cell Ranger 10.1.0 (the version used in Chapter 5)
- SRA-Toolkit 3.2.1 (the version used in Chapter 4)
- Human reference `refdata-gex-GRCh38-2024-A` (Chapter 5)

## Further reading

The link list from the book's appendix, grouped by chapter. → [LINKS.md](LINKS.md)

Suggestions are welcome via **pull request**.

## Questions

Open a GitHub issue: **Issues** tab → **New issue**.
