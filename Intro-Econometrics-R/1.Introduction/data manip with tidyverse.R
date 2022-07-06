#===================================================================================================
# 1.5 - Data Manipulation and Visualization: The Tidyverse 
#===================================================================================================
library(tidyverse)

# NOTE: just use this section as a brief review of using tidyverse functionality; I have better 
# and more thorough resources so this just covers enough to make use of the introductory econometrics
# textbook

#---------------------------------------------------------------------------------------------------
#1.5.1 - Data Viz: ggplot Basics:
# Generate a ggplot2 graph
p <- ggplot(data = mpg, mapping=aes(x=displ, y=hwy)) +
    geom_point() +
p


# Generate a second graph that shows a scatter plot with a nonparametric  regression function added
p <- ggplot(data=mpg, mapping=aes(x=displ, y=hwy)) +
  geom_point() +
  geom_smooth()
p

# this nonparametric regression line here represents the expected value for a given set of values 
# and the ribbon's width is representative of the amount of uncertainty of this mean 


# 1.5.2 - Colors and Shapes in ggplot Graphs
p <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point(color = gray(0.5)) +
  geom_smooth(color="red")
p

# visualize the data points from different classes as different colors, will automatically add a 
# legend
p <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(color=class)) +
  geom_smooth(color = "red") +
  labs(title = "Hwy vs. Displ")
p

# add shapes and colors to help visualization further 
p <- ggplot(mpg, aes(displ, hwy)) + 
  geom_point(aes(color = class, shape = class)) +
  geom_smooth(color = "red") +
  labs(title = "Hwy vs. Displ") + 
  scale_shape_manual(values=1:7)
p  

# NOTE: In order to make classes available for every geom, be sure to add the classes in the 
# ggplot() call instead of the specific geoms

# Create a graphic with some more fine grained tuning (just adding stuff)
p <- ggplot(mpg, aes(displ, hwy, color=class, shape=class)) +
  geom_point() + 
  geom_smooth(se=FALSE) +    # ignore shape
  scale_shape_manual(values=1:7) +
  theme_light() + 
  labs(title = "Displacement vs. Mileage", 
       subtitle = "Model years 1988 - 2008", 
       caption = "Source: EPA through the ggplot2 package",
       x = "Displacement [liters]", 
       y = "Miles/Gallon (Highway)",
       color = "Car type", 
       shape = "Car type",
  ) +
  coord_cartesian(xlim=c(0,7), ylim=c(0,45)) +     # adjust limits of ordinate and abscissa 
  theme(legend.position = c(0.15, 0.3)) 
p  

ggsave("crazy_plot.png", width=7, height=5)

#---------------------------------------------------------------------------------------------------
# Basic Data Manipulation with dplyr
# Use the WDI package to download WDI data to use for data manipulation examples 
library(WDI)

# Extract female life expectancy in the US data from the database
wdi_raw <- WDI(indicator=c("SP.DYN.LE00.FE.IN"), start = 1960, end = 2014)

head(wdi_raw)
tail(wdi_raw)

# Now that the data is loaded, let's demonstrate how to use dplyr to (i) filter only the rows for US
# data, (ii) sort by year in increasing order, (iii) generate a new variable
# general structure of dplyr commands: new_data_frame <- verb(old_data_frame, details)

# filter: only US data 
data <- filter(wdi_raw, iso2c=="US")
head(data)

# rename life expectancy variable to non-cryptic name 
data <- rename(data, LE_fem=SP.DYN.LE00.FE.IN)
head(data)

# select only the relevant variables 
data <- select(data, year, LE_fem)
head(data)

# order by year (increasing)
data <- arrange(data, year)
head(data)
tail(data)

# Now, our subset of the original dataset only contains the female life expectancy in the US

# Graph to visualize the trend 
p <- ggplot(data, aes(year, LE_fem)) + 
  geom_line(color='red') + 
  theme_light() + 
  labs(title = "Life Expectancy of Females in the US (1960-2014)",
       subtitle = "World Bank: World Development Indicators",
       x = "Year",
       y = "Life Expectancy (years)") +
  coord_cartesian(xlim=c(1960,2014))
p


# More data manipulation using pipes 
# goal of pipes is to eliminate constant repeated writing of the data frame and replace it with 
# a more concise notation that is also allegedly computationally efficient

# as an example, let's do the same thing as above, except with pipes only 
data2 <- wdi_raw %>%
  filter(iso2c=="US") %>%
  rename(LE_fem=SP.DYN.LE00.FE.IN) %>%
  select(year, LE_fem) %>%
  arrange(year)

head(data2)
tail(data)

# as you can see, this can be a useful alternative to the above, although tbh I'm comfortable with 
# how the above works so I don't particularly see the advantage 

# Now, I'm going to skip over the rest of this section as I'm not particularly interested in using
# the tidyverse, if I want to learn how to use it more in-depth, then I'll just go to the source.