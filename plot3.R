##setwd("C:/Users/ur3s/Dados/coursera/DataExploratory/Project2")

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Of the four types of sources indicated by the 
##type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases 
##in emissions from 1999-2008 for Baltimore City? 
##Which have seen increases in emissions from 1999-2008? 
##Use the ggplot2 plotting system to make a plot answer this question.

##Transforms year in a factor variable
NEI <- transform(NEI, year= factor(year))

##extracts data from Baltimore
baltimore <- NEI[NEI$fips=="24510",]

##First part of the plot
g<-ggplot(baltimore, aes(year, Emissions))

##Plots without the outliers
g + geom_point() + facet_grid(.~type) + geom_smooth(aes(group = 1),method = "lm") + coord_cartesian (ylim = c(0,500))


dev.copy(png, file = "plot3.png")
dev.off()


