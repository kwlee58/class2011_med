###################################################
### code chunk number 14: CI-Lanza-data
###################################################
data("Lanza", package = "HSAUR2")
xtabs(~ treatment + classification + study, data = Lanza)


###################################################
### code chunk number 15: CI-width
###################################################
options(width = 65)


###################################################
### code chunk number 16: CI-Lanza-singleI
###################################################
library("coin")
cmh_test(classification ~ treatment, data = Lanza,
         scores = list(classification = c(0, 1, 6, 17, 30)),
         subset = Lanza$study == "I")


###################################################
### code chunk number 17: CI-Lanza-singleII
###################################################
cmh_test(classification ~ treatment, data = Lanza,
         scores = list(classification = c(0, 1, 6, 17, 30)),
         subset = Lanza$study == "II")


###################################################
### code chunk number 18: CI-Lanza-singleIIa
###################################################
p <- cmh_test(classification ~ treatment, data = Lanza,
         scores = list(classification = c(0, 1, 6, 17, 30)),
         subset = Lanza$study == "II", distribution =
         approximate(B = 19999))
pvalue(p)


###################################################
### code chunk number 19: CI-Lanza-singleIII-IV
###################################################
cmh_test(classification ~ treatment, data = Lanza,
         scores = list(classification = c(0, 1, 6, 17, 30)),
         subset = Lanza$study == "III")
cmh_test(classification ~ treatment, data = Lanza,
         scores = list(classification = c(0, 1, 6, 17, 30)),
         subset = Lanza$study == "IV")


###################################################
### code chunk number 20: CI-Lanza-all
###################################################
cmh_test(classification ~ treatment | study, data = Lanza,
         scores = list(classification = c(0, 1, 6, 17, 30)))


