**한국어** | [English](README.en.md)

# 실전 단일세포 데이터 분석 - 실습 코드

책 **『실전 단일세포 데이터 분석: 예제 코드와 데이터로 배우는 생물정보 분석 기술』** 의 실습 코드 저장소입니다.

## 소개

책의 각 챕터에서 설명하는 코드를 그대로 실행해 볼 수 있도록 정리한 저장소입니다.
알츠하이머 환자와 일반인의 말초혈액 단핵세포(PBMC) 단일세포 RNA 시퀀싱 데이터를 이용해
원시 데이터 다운로드부터 세포 유형 주석, 차등 발현 유전자 분석, 추가 분석 툴까지 전 과정을 다룹니다.

## 실습 데이터

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
FASTQ 데이터와 참조서열은 용량이 크기 때문에 직접 내려받아야 합니다.

- FASTQ 데이터: `src/CH04_sra_download.sh` 로 내려받습니다.
- 셀 레인저와 참조서열: 10x Genomics 다운로드 센터에서 직접 내려받아야 합니다.
  로그인과 약관 동의가 필요해 자동 다운로드 명령어를 제공할 수 없습니다.
  받는 방법과 압축 해제 명령어는 `src/CH05_setup_cellranger.sh` 에 정리해두었습니다.
- 세포 유형 주석용 참조 데이터(`pbmc_multimodal_2023.rds`)는
  `src/singleCell_분석.Rmd` 의 [코드 10-6]이 R에서 자동으로 내려받습니다.

셀 레인저 `outs` 폴더의 다른 파일을 읽는 다음 코드는 챕터 05에서 셀 레인저를 직접 실행한
경우에만 따라 할 수 있습니다.

| 코드 | 필요한 파일 |
|------|-------------|
| [코드 6-2]의 두 번째 방법(MEX 폴더), [코드 6-3] | `outs/filtered_feature_bc_matrix/` |
| [코드 12-6], [코드 12-7] (SoupX) | `outs/raw_feature_bc_matrix/`, `outs/filtered_feature_bc_matrix/`, `outs/analysis/` |
| [코드 CH12_run_cellbender.sh] (CellBender) | `outs/raw_feature_bc_matrix.h5` |

h5 파일만 내려받았다면 [코드 6-2]는 첫 번째 방법으로 진행하고, 위 나머지 코드는 건너뛰어도
이후 분석 흐름에는 영향이 없습니다.

## 저장소 구조

```
.
├── data/                 # 샘플별 셀 레인저 결과(h5), 샘플 메타데이터
│   ├── count_SRR139119**/outs/filtered_feature_bc_matrix.h5
│   └── SraRunTable.csv
├── src/                  # 실습 코드
├── results/              # 분석 결과(CSV 등)가 저장되는 위치
├── README.md             # 한국어
└── README.en.md          # English
```

## 챕터별 코드 위치

| 책 챕터 | 파일 |
|---------|------|
| 챕터 02 단일세포 데이터 분석과 기본 코드 | `src/CH02_R.qmd` |
| 챕터 04 시퀀싱 데이터 다운로드 | `src/CH04_setup_sratoolkit.sh`, `src/CH04_sra_download.sh`, `src/CH04_sra_download_multithread.sh` |
| 챕터 05 셀 레인저 설치 및 실행 | `src/CH05_setup_cellranger.sh`, `src/CH05_change_fastq_name.sh`, `src/CH05_run_cellranger.sh` |
| 챕터 06 ~ 챕터 12 (R 분석 전 과정) | `src/singleCell_분석.Rmd` |
| 챕터 12 CellBender (배경 RNA 제거) | `src/CH12_run_cellbender.sh` |

## 시작하기

1. **데이터 준비** - 저장소에 포함된 `h5` 파일로 바로 챕터 06부터 시작할 수 있습니다.
   원시 데이터부터 직접 만들어 보려면 챕터 04, 05 순서대로 진행합니다.

   셸 스크립트는 자기 위치(`src/`)를 찾아 작업 디렉터리를 옮기므로 저장소 어디에서 실행해도 됩니다.

   ```bash
   cd src
   bash CH04_sra_download.sh          # FASTQ 내려받기 (수 시간 이상 걸릴 수 있습니다)
   bash CH05_change_fastq_name.sh     # 셀 레인저 형식으로 파일 이름 바꾸기
   bash CH05_run_cellranger.sh        # 셀 레인저 카운트 실행
   ```

2. **R 분석** - RStudio에서 `singleCell.Rproj` 를 열고 `src/singleCell_분석.Rmd` 를 실행합니다.
   코드 블록은 책의 챕터 순서대로 배치되어 있습니다. Rmd는 `../data/` 형태의 상대 경로를 쓰므로
   반드시 `src/` 위치에서 실행해야 합니다(첫 청크의 `knitr::opts_knit$set(root.dir = getwd())` 참고).

## 코드 번호 규칙

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

## 필요한 환경

- R, RStudio
- Seurat v5 (책 챕터 06의 [코드 6-1] 참고)
- 셀 레인저 10.1.0 (책 챕터 05 기준)
- SRA-Toolkit 3.2.1 (책 챕터 04 기준)
- 사람 참조서열 `refdata-gex-GRCh38-2024-A` (챕터 05)

## 참고할 만한 웹사이트

책 부록의 링크 목록을 챕터 순서로 정리했습니다. → [LINKS.md](LINKS.md)

추가하고 싶은 링크가 있다면 **pull request** 로 제안해 주세요.

## 문의

코드 실행에 문제가 있다면 GitHub의 **Issues** 탭 → **New issue** 로 남겨 주세요.
