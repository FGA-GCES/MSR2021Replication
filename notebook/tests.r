# Imports
library(PMCMRplus)
library(ggplot2)
library(reshape2)
library(nortest)

# Load data
so = read.csv("/app/data/processed/so_test_data.csv", header = TRUE)
gh = read.csv("/app/data/processed/gh_test_data.csv", header = TRUE)

# Extract relevant columns from dataframes 
so_data = matrix(c(so$time_topic_2, so$time_topic_5, so$time_topic_1, so$time_topic_11, so$time_topic_4, so$time_topic_13,
                   so$time_topic_10, so$time_topic_3, so$time_topic_6, so$time_topic_12, so$time_topic_14, so$time_topic_9, 
                   so$time_topic_8), ncol=13, 
          dimnames = list(1 : 3806, c("User\ninterface", "Build &\ndeploy", "Platform\nintegration", "File\nmanipulation", "Dependencies",
                                      "Page\ncontents", "App \narchitecture", "Testing", "Client-server", "Databases", "Inter-process\ncommunication",
                                      "Developer\ntools", "Errors")))

so_data_plot <- so_data[so_data[, 1] > 0, ] # drop rows with 0 alive time

gh_data = matrix(c(gh$time_topic_7, gh$time_topic_2, gh$time_topic_5, gh$time_topic_4, gh$time_topic_6,
                   gh$time_topic_10, gh$time_topic_3, gh$time_topic_1, gh$time_topic_13, gh$time_topic_9,
                   gh$time_topic_12, gh$time_topic_11
                   ), ncol=12, 
                   dimnames = list(1 : 71611, c("Feature\nrequest", "Platform\nintegration", "Account", 
                                                "Messaging", "File\nmanipulation", "Testing", "User\ninterface", 
                                                "Build &\ndeploy", "Input", "Text\nmanipulation",
                                                "Cryptocurrencies", "Errors")))

gh_data_plot <- gh_data[gh_data[, 1] > 0, ] # drop rows with 0 alive time

# Descriptive statistics
summary(so_data / 3600)
summary(gh_data / 3600)

# Anderson-Darling test (Normality test)
ad.test(so_data)
ad.test(gh_data)

# QQ Plot
for(i in 1:13){
  qqnorm(so_data[, i], pch = 1, frame = FALSE)
  qqline(so_data[, i], col = "steelblue", lwd = 2)
}

for(i in 1:12){
  qqnorm(gh_data[, i], pch = 1, frame = FALSE)
  qqline(gh_data[, i], col = "steelblue", lwd = 2)
}


# Friedman test ( non-parametric & independent ANOVA)
friedmanTest(so_data) 
friedmanTest(gh_data)

# Nemenyi Post-hoc tests to compare all the pairs  
frdAllPairsNemenyiTest(so_data, alternative='greater')
frdAllPairsNemenyiTest(gh_data, alternative='greater')

# Single Pairs comparisons with Nemenyi
for(i in 1:13) {
  test_data = so_data[,c(i, 1:i-1, i:ncol(so_data))]
  print(frdManyOneNemenyiTest(test_data, alternative='greater'))
  }

for(i in 1:12) {
  test_data = gh_data[,c(i, 1:i-1, i:ncol(gh_data))]
  print(frdManyOneNemenyiTest(test_data, alternative='greater'))
}

# Descriptive statistics
apply(so_data, 2, mean)/(60)
apply(so_data, 2, sd)/(60)
apply(so_data, 2, median)/(60) 
round(apply(so_data, 2, quantile)/(60), 2)

apply(gh_data, 2, mean)/(60 * 60 * 24)
apply(gh_data, 2, sd)/(60 * 60 * 24)
apply(gh_data, 2, median)/(60 * 60 * 24)
round(apply(gh_data, 2, quantile)/(60 * 60 * 24), 2)


# Plot data
pdf("../../paper/figures/so_boxplot.pdf", height=4.5)
par(mar=c(7.5,4.5,0,0)+.1)
yticks = c(1/1440, 1/144, 1/24, 1/4, 1, 7, 30, 90, 365, 1095)
ytickslabels = c('1 m', '10 m', '1 h', '6 h', '1 d', '1 w', '1 m', '3 m', '1 y', '3 y')
boxplot(so_data_plot / (60 * 60 * 24) ,log = 'y', las=2, , yaxt="n")
axis(2, cex.axis=1, at=yticks, labels = ytickslabels, las=2)
title(ylab="Difficulty", line=3.5, cex.lab=1.5)
title(xlab="Topic", line=6, cex.lab=1.5)
abline(h=yticks, col=alpha(rgb(0,0,0), 0.3), lty=3)
dev.off()

pdf("../../paper/figures/gh_boxplot.pdf", height=5.25)
par(mar=c(7.5,4.5,0,0)+.1)
yticks = c(1/1440, 1/144, 1/24, 1/4, 1, 7, 30, 90, 365, 1095)
ytickslabels = c('1 m', '10 m', '1 h', '6 h', '1 d', '1 w', '1 m', '3 m', '1 y', '3 y')
boxplot(gh_data_plot / (60 * 60 * 24) ,log = 'y', las=2, yaxt='n')
axis(2, cex.axis=1, at=yticks, labels = ytickslabels, las=2)
title(ylab="Difficulty", line=3.5, cex.lab=1.5)
title(xlab="Topic", line=6, cex.lab=1.5)
abline(h=yticks, col=alpha(rgb(0,0,0), 0.3), lty=3)
dev.off()

#so_long <- melt(so_data)
#colnames(so_long) <- c("ID","Topic","Value") 

#ggplot(so_long, aes(x=factor(Topic),y=Value/(60 * 60 * 24),fill=factor(Topic)))+
#  geom_boxplot() + scale_y_continuous(trans='log10')
  
