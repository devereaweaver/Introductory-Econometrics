# 1.3 - Data Frames and Data Files

# Data Frames - object that collects several variables and can be thought of a rectangular shape; 
# of course data frames can have mulitple data types 
product1 <- c(0, 3, 6, 9, 7, 8)
product2 <- c(1, 2, 3, 5, 9, 6)
product3 <- c(2, 4, 4, 2, 3, 2)
year <- c(2008, 2009, 2010, 2011, 2012, 2013)

sales_mat <- cbind(product1, product2, product3)
rownames(sales_mat) <- year
sales_mat

# create data frame and display 
sales <- as.data.frame(sales_mat)
sales


#===================================================================================================
# Subsets of Data
#===================================================================================================
# Subset: all years in which sales of product were >= 3
subset(sales, product3 >= 3)

#===================================================================================================
# R Data Files 
#===================================================================================================
# .RData is the extension of the file name for R data file format
# these files can contain one ore more objects of arbitrary type
save(sales_mat, file = "sales_mat.RData")
load("sales_mat.RData")


#===================================================================================================
# Basic Information on a Data Set 
#===================================================================================================














































































































































