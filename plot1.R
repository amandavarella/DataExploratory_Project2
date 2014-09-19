##setwd("C:/Users/ur3s/Dados/coursera/DataExploratory/Project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Using the base plotting system, make a plot showing the total PM2.5 
##emission from all sources for each of the years 1999, 2002, 2005, and 2008.

##Transforms year in a factor variable
NEI <- transform(NEI, year= factor(year))

##Plots a boxplot without the outliers
boxplot(Emissions ~ year, NEI, xlab = "Year", ylab="Emissions", outline=FALSE)
dev.copy(png, file = "plot1.png")
dev.off()


