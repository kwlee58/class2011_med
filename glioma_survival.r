library(coin)
library(survival)
quartz(width=9, height=6, dpi=72)
layout(matrix(1:2, ncol = 2))

### Grade III glioma
g3 <- subset(glioma, histology == "Grade3")

### Plot Kaplan-Meier curves
plot(survfit(Surv(time, event) ~ group, data = g3), 
	main = "Grade III Glioma", lty = c(2,1), 
##     legend.text = c("Control", "Treated"),
##       legend.bty = 1, 
	ylab = "Probability", 
    xlab = "Survival Time in Month")
	legend("bottomleft", legend=c("Control","Treated"),lty=c(2,1))
	
### logrank test
surv_test(Surv(time, event) ~ group, data = g3, 
               distribution = "exact")

### Grade IV glioma
gbm <- subset(glioma, histology == "GBM")

### Plot Kaplan-Meier curves
plot(survfit(Surv(time, event) ~ group, data = gbm), 
    main = "Grade IV Glioma", lty = c(2,1), 
##       legend.text = c("Control", "Treated"),
##       legend.bty = 1, legend.pos = 1, 
	ylab = "Probability", 
    xlab = "Survival Time in Month")
    legend("topright", legend=c("Control","Treated"),lty=c(2,1))
   
### logrank test
surv_test(Surv(time, event) ~ group, data = gbm, 
            distribution = "exact")

### stratified logrank test
surv_test(Surv(time, event) ~ group | histology, data = glioma,
            distribution = approximate(B = 10000))
