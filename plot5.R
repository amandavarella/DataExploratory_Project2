
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 

##Transforms year in a factor variable
NEI <- transform(NEI, year= factor(year))

##Gets data from Baltimore
baltimore <- NEI[NEI$fips=="24510",]

##Merges NEI and SCC
mergedData = merge(baltimore, SCC, by.x="SCC", by.y="SCC", all=TRUE)

##Gets the motor vehicles data
motor <- mergedData[grep("Vehicles", mergedData$EI.Sector),]

##Plots a boxplot without the outliers
boxplot(Emissions ~ year, baltimore, xlab = "Year", ylab="Emissions", outline=FALSE)


dev.copy(png, file = "plot5.png")
dev.off()


