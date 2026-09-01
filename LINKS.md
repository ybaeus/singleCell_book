# 참고할 만한 웹사이트

책 『실전 단일세포 데이터 분석』의 부록 "참고할 만한 웹사이트" 목록입니다.
책의 챕터 순서로 정리했습니다.

추가하고 싶은 링크가 있다면 **pull request** 로 자유롭게 제안해 주세요.
분석 도구는 계속 업데이트되므로 버전에 따라 코드가 실행되지 않거나 함수 이름과
사용법이 바뀔 수 있습니다. 이런 문제를 발견하시면 **Issues** 탭에 남겨 주세요.

모든 링크는 2026년 8월 기준으로 접속을 확인했습니다.

## 챕터 01 단일세포 데이터 분석 개요

| 내용 | 링크 |
|------|------|
| 10x Genomics 단일세포 시퀀싱 제품 소개 | https://www.10xgenomics.com/products |

## 챕터 04 시퀀싱 데이터 다운로드

| 내용 | 링크 |
|------|------|
| SRA-Toolkit 설치 및 사용법 위키 | https://github.com/ncbi/sra-tools/wiki |
| ENA 브라우저 | https://www.ebi.ac.uk/ena/browser/home |

## 챕터 06 ~ 09 슈랏 기본 분석

| 내용 | 링크 |
|------|------|
| 예제 데이터를 이용한 기본 분석 파이프라인 (PBMC 3k 튜토리얼) | https://satijalab.org/seurat/articles/pbmc3k_tutorial |
| 단일세포 분석 방법론 리뷰 논문 | https://www.nature.com/articles/s41576-023-00586-w |
| 슈랏 명령어 모음 | https://satijalab.org/seurat/articles/seurat5_essential_commands |
| 슈랏과 함께 쓰면 편리한 추가 패키지 모음 | https://satijalab.org/seurat/articles/extensions |
| SCTransform 정규화 (챕터 07) | https://satijalab.org/seurat/articles/sctransform_vignette |
| 데이터 통합 (챕터 07, 09) | https://satijalab.org/seurat/articles/seurat5_integration |
| 하모니를 이용한 배치 효과 교정 (챕터 09) | https://portals.broadinstitute.org/harmony/articles/quickstart.html |

## 챕터 10 세포 유형 주석

| 내용 | 링크 |
|------|------|
| 참조 데이터 기반 매핑 | https://satijalab.org/seurat/articles/integration_mapping |
| Azimuth | https://azimuth.hubmapconsortium.org |
| SingleR (온라인 서적) | https://bioconductor.org/books/release/SingleRBook |
| scType | https://github.com/IanevskiAleksandr/sc-type |

## 챕터 11 단일세포 데이터 후속 분석

| 내용 | 링크 |
|------|------|
| fgsea 튜토리얼 (GSEA) | https://bioconductor.org/packages/release/bioc/vignettes/fgsea/inst/doc/fgsea-tutorial.html |

## 챕터 12 추가 분석 툴

### 품질관리 - 두세포 방울

| 내용 | 링크 |
|------|------|
| DoubletFinder | https://github.com/chris-mcginnis-ucsf/DoubletFinder |
| scDblFinder | https://bioconductor.org/packages/release/bioc/vignettes/scDblFinder/inst/doc/scDblFinder.html |

### 품질관리 - 배경 RNA

| 내용 | 링크 |
|------|------|
| 배경 RNA(ambient RNA) 설명 | https://www.10xgenomics.com/analysis-guides/introduction-to-ambient-rna-correction |
| SoupX | https://cran.r-project.org/web/packages/SoupX/vignettes/pbmcTutorial.html |
| CellBender | https://cellbender.readthedocs.io/en/latest |
| DecontX | https://bioconductor.org/packages/release/bioc/vignettes/decontX/inst/doc/decontX.html |

### 클러스터링·네트워크·궤적·세포 간 소통

| 내용 | 링크 |
|------|------|
| clustree (해상도 선택) | https://cran.r-project.org/web/packages/clustree/vignettes/clustree.html |
| hdWGCNA (공동 발현 네트워크) | https://smorabit.github.io/hdWGCNA |
| Slingshot (궤적 분석) | https://bioconductor.org/packages/release/bioc/vignettes/slingshot/inst/doc/vignette.html |
| Monocle3 (궤적 분석) | https://cole-trapnell-lab.github.io/monocle3 |
| LIANA (세포 간 소통) | https://saezlab.github.io/liana/articles/liana_tutorial.html |

## 더 공부하고 싶다면

| 내용 | 링크 |
|------|------|
| 단일세포 데이터와 관련된 모든 툴을 모아둔 웹사이트 | https://www.scrna-tools.org/tools |
| Single-cell best practices (방법론 중심, 파이썬 기반) | https://www.sc-best-practices.org |
| Orchestrating Single-Cell Analysis with Bioconductor | https://bioconductor.org/books/release/OSCA |
