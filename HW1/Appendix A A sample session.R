#Appendix A A sample session
#Homework1 201503564 한민지
help.start()

#norm은 정규분포, rnorm은 난수 발생
x <- rnorm(50) 
y <- rnorm(x)

#그래픽 관련한 함수
#plot(y축 데이터 옵션), plot(x축 데이터 옵션, y축 데이터 옵션)
plot(x,y) 

ls()

#저장되어있는 변수 및 오브젝트 지우기
rm(x,y)

#1부터 20까지 integer vector 만들기
x <- 1:20

#sqrt(x) = x의 제곱근, 벡터로 저장 
w <- 1 + sqrt(x)/2

#dataframe
dummy <- data.frame(x=x, y= x + rnorm(x)*w)
dummy

#lm()- linear model(선형회귀 만들기), 리스트
#lm(formula, data)
#summary : 각 variable에 대한 요약된 데이터 정보 보기
fm <- lm(y ~ x, data=dummy)
summary(fm)가
fm1 <- lm(y ~ x, data=dummy, weight=1/w^2)
summary(fm1)

#attach : 데이터를 R 검색 경로에 데이터프레임 추가
attach(dummy)

#lowess : 지역 가중 다항식 회귀,  각 점을 그 주변 점들로 설명하는 다항식들이 연결된 모양
lrf <- lowess(x, y)

plot(x,y)

#ines(x, y = NULL, type = "l", ...)
lines(x, lrf$y)

#abline((a)x절편기울기, (b)y절편 기울기, (h)y값을 지나가는 수평인 직선, (v)x값을 지나가는 수직인 직선 ,
# (reg)회귀 직선 추가, (coef)절편과 기울기로 이루어진 직선 ..)
abline(0, 1, lty=3)

abline(coef(fm))
abline(coef(fm1), col="red") #col : 색깔

#검색경로에서 제거
detach()

plot(fitted(fm), resid(fm),
     xlab="Fitted values",
     ylab="Residuals",
     main="Residuals vs Fitted")

#qqnorm : 주어진 데이터와 정규 확률 분포를 비교하는 Q-Q도를 그린다.
qqnorm(resid(fm), main="Residuals Rankit Plot")

rm(fm, rm1, lrf, x, dummy)


#데이터 파일의 path를 갖고옴
filepath <- system.file("data", "morley.tab", package="datasets")
filepath

#dataframe으로 외부 데이터셋 파일 불러오기
mm <- read.table(filepath기)
mm
#factor요소로 바꿔서 저자
mm$Expt <- factor(mm$Expt)
mm$Run <- factor(mm$Run)장

attach(mm)

plot(Expt, Speed, main="Speed of Light Data", xlab="Experiment No.")

#aov : 일원 분산 분석(oneway ANOVA)
#aov(종속변수 ~ 그룹변수,data)
fm <- aov(Speed ~ Run + Expt, data=mm)
summary(fm)

fm0 <- update(fm, . ~ . - Run)
anova(fm0, fm)

detach()
rm(fm, fm0)

#seq(from, to) 일정한 구조/  순차데이터 생성
x <- seq(-pi, pi, len=50)
y <- x

#벡터의 외적 연산
#outer(x,y, 함수설정)
f <- outer(x, y, function(x,y) cos(y)/(1+x^2))

#par() : 그래프의 모양을 다양하게 조절할 수 있는 그래픽 인수들을 설정하고 조회하는 함수
oldpar <- par(no.readonly = TRUE)정
par(pty="s") #pty : plot의 type이랑 region의 모양을 지정

#contour : 등고선을 그려주는것 
contour(x,y,f)
contour(x,y,f,nlevels=15, add=TRUE)

fa <- (f-t(f))/2

contour(x,y,fa,nlevels=15)

par(oldpar)

image(x,y,f)
image(x,y,fa)

#objects() : 현재 저장해놓은 변수들이나 dataset을 보여주는 함수
objects(); rm(x,y,f,fa)

th <- seq(-pi, pi, len=100)
#exp() : 지수함수
z <- exp(1i*th)

par(pty="s")
plot(z, type="l") #type = "l" 은 좌표가 연결된 선

w <- rnorm(100) + rnorm(100)*1i

#ifelse() : 주어진 test 값에 따라 yes 또는 no 값을 반환한다
#mod() == %% (몫)
w <- ifelse(Mod(w) > 1, 1/w, w)

plot(w, xlim=c(-1,1), ylim=c(-1,1), pch="+",xlab="x", ylab="y")
lines(z)

#runif() : 난수만들기
w <- sqrt(runif(100))*exp(2*pi*runif(100)*1i)
plot(w, xlim=c(-1,1), ylim=c(-1,1), pch="+", xlab="x", ylab="y")
lines(z)

rm(th, w, z)

q()
