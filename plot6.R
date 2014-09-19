##setwd("C:/Users/ur3s/Dados/coursera/DataExploratory/Project2")

library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
##in Los Angeles County, California (fips == 06037). 
##Which city has seen greater changes over time in motor vehicle emissions?

##Transforms year in a factor variable
NEI <- transform(NEI, year= factor(year))

##extracts data from Baltimore and Los Angeles
baltlos <- NEI[NEI$fips=="24510" | NEI$fips=="06037",]

baltlos$fips[baltlos$fips=="24510"] <- "Baltimore"
baltlos$fips[baltlos$fips=="06037"] <- "Los Angeles"


##First part of the plot
g<-ggplot(baltlos, aes(year, Emissions))

##Plots without the outliers
g + geom_point() + facet_grid(.~fips) + geom_smooth(aes(group = 1),method = "lm") + coord_cartesian (ylim = c(0,500))


dev.copy(png, file = "plot6.png")
dev.off()


