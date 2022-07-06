#===================================================================================================
# 1.6 - Descriptive Statistics in R Review
#===================================================================================================
# Discrete Distributions: Frequencies and Contingency Tables 

# to demonstrate using frequency and contingency tables in R, we'll use use the affairs data from 
# the wooldridge package
data(affairs, package='wooldridge')

head(affairs)

# Generate factors such that we can map them to created labels
haskids <- factor(affairs$kids, labels=c("no", "yes"))
mlab <- c("very unhappy", "unhappy", "average", "happy", "very happy")
marriage <- factor(affairs$ratemarr, labels=mlab)

# Now, check out the vectors containing the labels based on the factors from the dataset 
table(haskids)    # simple frequency table 
prop.table(table(marriage))    # table with shares instead of counts

# View contingency table with counts (marriage vs. haskids)
countstab <- table(marriage, haskids)
countstab

# view shares within a row (marriage)
prop.table(countstab, margin=1)    # margin = 1 : shares across first-axis 

# view shares across columns 
prop.table(countstab, margin=2)

# use simple graphics to visualize: 

# (a) simple pie chart 
pie(table(marriage))

# (b) simple bar plot of happiness 
barplot(table(marriage),
        horiz = TRUE,
        las = 1,
        main = "Distribution of Happiness")

# (c) side by side bar plot (vertical)
barplot(table(haskids, marriage),
        beside = TRUE, las = 2, legend = TRUE,
        args.legend = c(x="top")
)


#---------------------------------------------------------------------------------------------------
# Continuous Distributions: Histogram and Density 
data(ceosal1, package = 'wooldridge')

# Generate histogram of ROE 
roe <- ceosal1$roe
hist(roe, col = 'red')

# generate histogram with 5 explicit breaks 
hist(roe, breaks=c(0, 5, 10, 20, 30, 60))

# generate kernel density plot of roe
plot(density(roe))

# generate kernel density plot of roe with overlay 
hist(roe, freq=F, ylim=c(0, 0.07))
lines(density(roe), lwd=3)


# test to see if the confidence intervals are the same 
data(audit, package='wooldridge')
y <- audit$y
y
confint(y, level = .95)



































