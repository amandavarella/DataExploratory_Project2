##setwd("C:/Users/ur3s/Dados/coursera/DataExploratory/Project2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the Baltimore City, 
##Maryland (fips == "24510") from 1999 to 2008? 
##Use the base plotting system to make a plot answering this question.

##Transforms year in a factor variable
NEI <- transform(NEI, year= factor(year))

##extracts data from Baltimore
baltimore <- NEI[NEI$fips=="24510",]

##Plots a boxplot without the outliers
boxplot(Emissions ~ year, baltimore, xlab = "Year", ylab="Emissions", outline=FALSE)

dev.copy(png, file = "plot2.png")
dev.off()


