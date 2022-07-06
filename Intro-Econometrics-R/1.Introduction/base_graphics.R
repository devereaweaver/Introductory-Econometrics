#===================================================================================================
# Base Graphics
#===================================================================================================

# Basic Graphics 
# a function plot example 
curve(x^2, -2, 2)
curve(dnorm(x), -3, 3)

# overlaying several plots can be created in base by calling curve or plot sequentially, to 
# override default behavior and overlay plots, use the add=TRUE option 
curve(dnorm(x, 0, 1), -10, 10, lwd=1, lty=1)
curve(dnorm(x, 0, 2), add=TRUE, lwd=2, lty=2)
curve(dnorm(x, 0, 3), add=TRUE, lwd=3, lty=3)

# demonstrate matplot to provide convenient alternative for specifying plots separately
year <- c(2008:2013)
product1 <- c(0, 3, 6, 9, 7, 8)
product2 <- c(1, 2, 3, 5, 9, 6)
product3 <- c(2, 4, 4, 2, 3, 2)
sales <- cbind(product1, product2, product3)

# plot years/sales in one function call 
matplot(year, sales, type='b', lwd=c(1, 2, 3), col='blue', main="Sales vs. Year")

# an example of adding a legend to a plot 
curve(dnorm(x, 0, 1), -10, 10, lwd=1, lty=1)
curve(dnorm(x, 0, 2), add=T, lwd=2, lty=2)
curve(dnorm(x, 0, 3), add=T, lwd=3, lty=3)
legend("topright", c("sigma=1", "sigma=2", "sigma=3"), lwd=1:3, lty=1:3)

# an example of using expression() function to add Greek letters, equations, etc. 
curve(dnorm(x, 0, 1), -10, 10, lwd=1, lty=1)
curve(dnorm(x, 0, 2), add=T, lwd=2, lty=2)
curve(dnorm(x, 0, 3), add=T, lwd=3, lty=3)
legend("topleft", expression(sigma==1, sigma==2, sigma==3), lwd=1:3, lty=1:3)
# add text with formula centered at x=6 and y=.3
text(6, .3,
     expression(f(x)==frac(1, sqrt(2*pi)*sigma)*e^{-frac(x^2,2*sigma^2)})
)

# NOTE: Look into using this expression() function more often for my figures. 