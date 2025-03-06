"
CHAPTER 2
02_02_기본 코드와 개념
"
##################
# 기본 코드 실행 #
##################
#코드 실행 예시 
a <- 3 + 4  # 해당 코드는 3 + 4 의 결과 값을 a 라는 변수에 저장하는 명령어 입니다. 


########
# 함수 #
########
# (코드 2-1) 두개의 숫자 x,y를 더하는 함수 만들 
add_numbers <- function(a, b) {
  result <- a + b
  return(result)
}

# 함수 실행 
add_numbers(10,7)


#####################
# R 패키지 설치하기 #
#####################
# -- 코드 2-2 -- #
# R 패키지 설치
# install.packages("ggplot2")
# 
# # BiocManger 패키지 설치
# install.packages("BiocManager")
# BiocManager::install("GenomicFeatures")
# 
# # BiocManger 업데이트
# BiocManager::install() 

##############################################################
# 기본 데이터 핸들링, 시각화 그리고 다양한 파일 읽기 및 저장 # 
##############################################################
# -- 코드 2-3 -- #
# 예시 데이터 생성 
set.seed(123)  # 재현 가능성을 위해 시드 설정
n <- 100  # 샘플 수

# 성별 데이터 생성 (50%의 확률로 'Male' 또는 'Female' 할당)
gender <- sample(c("Male", "Female"), size = n, replace = TRUE)

# 나이 데이터 생성 (10세부터 15세까지 정수값으로 할당)
age <- sample(10:15, size = n, replace = TRUE)

# 키 데이터 생성 (성별과 나이에 따라 다른 평균과 분산을 가지는 정규 분포에서 샘플링)
height <- ifelse(gender == "Male", rnorm(n, mean = 150 + 3 * (age - 10), sd = 10), rnorm(n, mean = 140 + 3 * (age - 10), sd = 8))

# 데이터프레임 생성
data <- data.frame(gender = gender, age = age, height = height)

# 데이터 저장 
# write.csv(data, "data.csv")

# -- 코드 2-4 -- # 
# 파일 읽기 
# data <- read.csv("data.csv") 

data[data$age < 13 , ] # 조건에 따른 row 추출 
data[data$age < 13 , c("gender","age") ] # 조건에 따른 row, column 추출

# 시각화
## Bar plot - 나이별 성별 키 평균
library(ggplot2)
bar_plot <- ggplot(data, aes(x = age, y = height, fill = gender)) +
  geom_bar(stat = "summary", fun = "mean", position = "dodge") +
  labs(x = "Age", y = "Height", fill = "Gender") +
  ggtitle("Mean Height by Age") +
  scale_fill_manual(values = c("Male" = "blue", "Female" = "pink"))

## Boxplot 그래프
ggplot(data, aes(x = gender, y = height)) +
  geom_boxplot() +
  labs(x = "Gender", y = "Height") +
  ggtitle("Comparison of Height by Gender")

## Scatter plot - 나이에 따른 키 분포
scatter_plot <- ggplot(data, aes(x = age, y = height, color = gender)) +
  geom_point() +
  labs(x = "Age", y = "Height", color = "Gender") +
  ggtitle("Height Distribution by Age")
scatter_plot

## Boxplot 그래프 - 나이별 성별 키 분포
boxplot_plot <- ggplot(data, aes(x = as.factor(age), y = height, fill = gender)) +
  geom_boxplot() +
  labs(x = "Age", y = "Height", fill = "Gender") +
  ggtitle("Height Distribution by Age and Gender")

boxplot_plot

##########
# 반복문 #
##########
# -- 코드 2-5 -- #
# 반복문 예시 
sum = 0
for (number in 1:100){
  sum = sum + number
}
print(sum)












