# 실전 단일세포 데이터 분석 - 실습 코드 / Practice Code

책 **『실전 단일세포 데이터 분석: 예제 코드와 데이터로 배우는 생물정보 분석 기술』** 의 실습 코드 저장소입니다.

This repository holds the hands-on code for the book *Practical Single-Cell Data Analysis* (Korean).

---

## 한국어

### 소개

책의 각 챕터에서 설명하는 코드를 그대로 실행해 볼 수 있도록 정리한 저장소입니다.
알츠하이머 환자와 일반인의 말초혈액 단핵세포(PBMC) 단일세포 RNA 시퀀싱 데이터를 이용해
원시 데이터 다운로드부터 세포 유형 주석, 차등 발현 유전자 분석, 추가 분석 툴까지 전 과정을 다룹니다.

### 실습 데이터

SRA Study **SRP309935** 의 6개 샘플을 사용합니다. (출처: `data/SraRunTable.csv`)

| Run | GEO | 나이 | 그룹 | 조직 |
|-----|-----|------|------|------|
| SRR13911909 | GSM5145401 | 67 | normal individual | blood |
| SRR13911910 | GSM5145402 | 73 | normal individual | blood |
| SRR13911911 | GSM5145403 | 71 | patient with mild AD | blood |
| SRR13911912 | GSM5145404 | 73 | patient with mild AD | blood |
| SRR13911913 | GSM5145405 | 82 | patient with severe AD | blood |
| SRR13911914 | GSM5145406 | 90 | patient with severe AD | blood |

저장소에는 셀 레인저 결과 중 `filtered_feature_bc_matrix.h5` 파일만 포함되어 있습니다.
FASTQ 원시 데이터와 참조서열은 용량이 크기 때문에 직접 내려받아야 합니다.

### 저장소 구조

```
.
├── data/                 # 샘플별 셀 레인저 결과(h5), 샘플 메타데이터
│   ├── count_SRR139119**/outs/filtered_feature_bc_matrix.h5
│   └── SraRunTable.csv
├── src/                  # 실습 코드
├── results/              # 분석 결과(CSV 등)가 저장되는 위치
└── README.md
```

### 챕터별 코드 위치

| 책 챕터 | 파일 |
|---------|------|
| 챕터 02 단일세포 데이터 분석과 기본 코드 | `src/CH02_R.qmd`, `src/CH02_R.R` |
| 챕터 04 시퀀싱 데이터 다운로드 | `src/CH04_sra_download.sh`, `src/CH04_sra_download_multithread.sh` |
| 챕터 05 셀 레인저 설치 및 실행 | `src/CH04_change_fastq_name.sh`, `src/CH04_run_cellranger.sh` |
| 챕터 06 ~ 챕터 12 (R 분석 전 과정) | `src/singleCell_분석_기초편.Rmd` |
| 챕터 12 CellBender (배경 RNA 제거) | `src/CH12_run_cellbender.sh` |

> 챕터 05 스크립트 두 개는 파일 이름이 아직 `CH04_` 로 시작합니다. `CH05_` 로 정리할 예정입니다.

### 시작하기

1. **데이터 준비** - 저장소에 포함된 `h5` 파일로 바로 챕터 06부터 시작할 수 있습니다.
   원시 데이터부터 직접 만들어 보려면 챕터 04, 05 순서대로 진행합니다.

   ```bash
   cd src
   bash CH04_sra_download.sh          # FASTQ 내려받기 (수 시간 이상 걸릴 수 있습니다)
   bash CH04_change_fastq_name.sh     # 셀 레인저 형식으로 파일 이름 바꾸기
   bash CH04_run_cellranger.sh        # 셀 레인저 카운트 실행
   ```

2. **R 분석** - RStudio에서 `singleCell.Rproj` 를 열고 `src/singleCell_분석_기초편.Rmd` 를 실행합니다.
   코드 블록은 책의 챕터 순서대로 배치되어 있습니다.

### 코드 번호 규칙

`.Rmd` 의 코드 블록 이름과 그 위의 캡션은 책의 코드 번호와 1:1로 대응합니다.

````
[코드 6-2] 2가지 방법으로 슈랏 오브젝트 생성하기
```{r code6_2}
...
```
````

책에 실리지 않은 참고용/실험용 코드에는 다음 표시가 붙어 있습니다.

```
<!-- (책 수록 코드 아님: 참고/실험용) -->
```

### 필요한 환경

- R, RStudio
- Seurat v5 (책 챕터 06의 [코드 6-1] 참고)
- 셀 레인저 8.0.1 이상 (챕터 05)
- SRA-Toolkit 3.1.0 이상 (챕터 04)
- 사람 참조서열 `refdata-gex-GRCh38-2024-A` (챕터 05)

### 문의

코드 실행에 문제가 있다면 GitHub의 **Issues** 탭 → **New issue** 로 남겨 주세요.

---

## English

### About

Runnable companion code for the Korean book *Practical Single-Cell Data Analysis*.
It walks through a full single-cell RNA-seq workflow on PBMC samples from Alzheimer's disease
patients and healthy individuals: raw data download, Cell Ranger counting, quality control,
normalization, integration, clustering, cell type annotation, differential expression, and
a tour of additional analysis tools.

### Dataset

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

### Layout

```
.
├── data/                 # per-sample Cell Ranger h5 output, sample metadata
│   ├── count_SRR139119**/outs/filtered_feature_bc_matrix.h5
│   └── SraRunTable.csv
├── src/                  # practice code
├── results/              # analysis output (CSV, etc.)
└── README.md
```

### Chapter to file map

| Book chapter | File |
|--------------|------|
| Ch. 02 R basics | `src/CH02_R.qmd`, `src/CH02_R.R` |
| Ch. 04 Downloading sequencing data | `src/CH04_sra_download.sh`, `src/CH04_sra_download_multithread.sh` |
| Ch. 05 Cell Ranger | `src/CH04_change_fastq_name.sh`, `src/CH04_run_cellranger.sh` |
| Ch. 06 - Ch. 12 (the whole R workflow) | `src/singleCell_분석_기초편.Rmd` |
| Ch. 12 CellBender (ambient RNA removal) | `src/CH12_run_cellbender.sh` |

> The two Chapter 5 scripts are still named `CH04_*`; they will be renamed to `CH05_*`.

### Getting started

1. **Data** - the tracked `h5` files let you start straight at Chapter 6. To build them from raw
   reads instead, run Chapters 4 and 5 in order:

   ```bash
   cd src
   bash CH04_sra_download.sh          # fetch FASTQ (can take many hours)
   bash CH04_change_fastq_name.sh     # rename to the Cell Ranger convention
   bash CH04_run_cellranger.sh        # run cellranger count
   ```

2. **R analysis** - open `singleCell.Rproj` in RStudio and work through
   `src/singleCell_분석_기초편.Rmd`. Chunks follow the book's order.

### Code numbering

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

### Requirements

- R and RStudio
- Seurat v5 (see listing 6-1 in Chapter 6)
- Cell Ranger 8.0.1 or newer (Chapter 5)
- SRA-Toolkit 3.1.0 or newer (Chapter 4)
- Human reference `refdata-gex-GRCh38-2024-A` (Chapter 5)

### Questions

Open a GitHub issue: **Issues** tab → **New issue**.
