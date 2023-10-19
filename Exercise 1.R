# Perform a two-sample t-test by testing the hypothesis:
#   H0 : µ1 = µ2
#   H1 : µ1 6= µ2
#   Generate the data in the following way:
#   • Sample 1: normal distributed values with: µ1 = 0.3 and σ1 = 0.5
#   • Sample 2: normal distributed values with: µ1 = 0.7 and σ1 = 0.9
#   Sample size for each sample is n. Repeat the analysis for n= 10, 50, 100 and discuss
#   the results.

sample1 <- rnorm(10, 0.3, 0.5)
sample2 <- rnorm(10, 0.7, 0.9)
t.test(sample1, sample2, paired=TRUE, alternative = "two", mu=0) #paired
t.test(sample1, sample2, paired=FALSE, alternative = "two", mu=0) #unpaired

sample1 <- rnorm(50, 0.3, 0.5)
sample2 <- rnorm(50, 0.7, 0.9)
t.test(sample1, sample2, paired=TRUE, alternative = "two", mu=0) #paired
t.test(sample1, sample2, paired=FALSE, alternative = "two", mu=0) #unpaired

sample1 <- rnorm(100, 0.3, 0.5)
sample2 <- rnorm(100, 0.7, 0.9)
t.test(sample1, sample2, paired=TRUE, alternative = "two", mu=0) #paired
t.test(sample1, sample2, paired=FALSE, alternative = "two", mu=0) #unpaired
