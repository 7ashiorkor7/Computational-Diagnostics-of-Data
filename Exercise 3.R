# Estimate the percentage of unique samples in a resampled data set generated with
# replacement.
# • Estimate the percentage of unique samples if the original data set contains
# N = 10 different data points and you sample N data points with replacement.
# • Repeat the same analysis for N = (100, 1000, 10000).
# • Plot the percentage of unique samples as a function of N.

#  Draw n = 10000 samples from a normal distribution with a mean of 0.6 and a
# standard deviation of 1. Plot a histogram of the obtained values and add to the
# histogram a vertical line at 0.6. Save the figure in a pdf format
 
# Draw n = 100 samples from a normal distribution with a mean of 0.6 and a
# standard deviation of 1. From this data set, generate B = 1000 Boostrap data sets
# by sampling with replacement and estimate for each of these data sets the sample
# mean of the data points. Plot a histogram of the resulting mean values and save it
# in pdf format.

set.seed(300)


# Function to estimate percentage of unique samples in a resampled data set
estimate_unique_percentage <- function(N) {
  original_data <- 1:N  # Create original data set with N unique data points
  resampled_data <- sample(original_data, N, replace = TRUE)  # Resample N data points with replacement
  unique_percentage <- length(unique(resampled_data)) / N * 100  # Calculate percentage of unique samples
  return(unique_percentage)
}

# Values of N to analyze
Ns <- c(10, 100, 1000, 10000)

# Vector to store percentage of unique samples for each N
unique_percentages <- numeric(length(Ns))

# Loop through each N and estimate percentage of unique samples
for (i in 1:length(Ns)) {
  unique_percentages[i] <- estimate_unique_percentage(Ns[i])
}

# Plot the results
plot(Ns, unique_percentages, type = "b", pch = 16, col = "blue", xlab = "N", ylab = "Percentage of Unique Samples",
     main = "Percentage of Unique Samples in Resampled Data (with Replacement)",
     xlim = c(min(Ns), max(Ns)), ylim = c(0, 100), lwd = 2)




n <- 1000
rn <- rnorm(n, mean=0.6, sd=1)
hist(rn)
abline(v=0.6)

#question5
sample.size <- 100
rn <- rnorm(sample.size, mean=0.6, sd=1)
n.samples <- 1000
bootstrap.results <- c()

for (i in 1:n.samples)
{
  obs <- sample(1:sample.size, replace = TRUE)
  bootstrap.results[i] <- mean(rn[obs])
}

length(bootstrap.results)
bootstrap.results
hist(bootstrap.results)
