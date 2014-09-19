library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

##Transforms year in a factor variable
NEI <- transform(NEI, year= factor(year))

##Merges NEI and SCC
mergedData = merge(NEI, SCC, by.x="SCC", by.y="SCC", all=TRUE)

##coal combustion related sources
##grep("Alameda", cameraData$intersection) ##localiza os registros onde a palavra "Alameda" aparece
coal <- mergedData[grep("Coal", mergedData$Short.Name),]

##Sum emissions by year
library(plyr)
grouped <- ddply(coal, .(year), summarize, Emissions=sum(Emissions))

##Plot the total emissions by year
qplot(year, Emissions, data = grouped, cex=10)

##Prints in a file
dev.copy(png, file = "plot4.png")
dev.off()
