# Suppose from a microarray analysis aiming to identify differentially expressed genes
# the following p-values for genes were obtained:
#   p = (0.001, 0.01, 0.02, 0.03, 0.06, 0.08)
# Conduct the following analysis:
#   • (I) Apply a Bonferroni correction and identify which gene is significant. Discuss different values of α.
# • (II) Apply a Benjamini-Hochberg correction and identify which gene is significant. Discuss different values of α.

# Apply a two-sample t-test to the following data.
# X1 = (−0.008178497, 0.004405896, −0.010696539, −0.027684961, 0.087134834)
# X2 = (0.5873832, 0.4127324, 0.5617457, 0.3830783, 0.5128472)
# Perform a two-side, left-sided and right-sided test and discuss differences.
# Provide the R script.


p <- c(0.001, 0.01, 0.02, 0.03, 0.06, 0.08)
round(p.adjust(p, "bonferroni"), 6)

p <- c(0.001, 0.01, 0.02, 0.03, 0.06, 0.08)
round(p.adjust(p, "hochberg"), 6)


x1<-c(-0.008178497, 0.004405896, -0.010696539, -0.027684961, 0.087134834)
x2 <- c(0.5873832, 0.4127324, 0.5617457, 0.3830783, 0.5128472)

t.test(x1, x2, paired=TRUE, alternative="greater", mu=0) #right
t.test(x1, x2, paired=TRUE,alternative="less", mu=0) #left
t.test(x1, x2,  alternative="greater", mu=0) #right
t.test(x1, x2,  alternative="less", mu=0) #left

t.test(x1,x2, paired=TRUE, alternative="two", mu=0)
t.test(x1,x2, paired=FALSE, alternative="two", mu=0)
