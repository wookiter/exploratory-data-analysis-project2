library(dplyr)
library(ggplot2)

source <- readRDS("Source_Classification_Code.rds")
summary0 <- readRDS("summarySCC_PM25.rds")
merged <- merge(summary0, source, by="SCC")
coalrelated <- filter(merged,grepl("coal",merged$Short.Name, ignore.case=TRUE))
aggrbyY <- aggregate(Emissions ~ year, coalrelated, sum)
barplot(height = aggrbyY$Emissions, names.arg = aggrbyY$year, xlab = "year", ylab = "Total PM25 Emissions in tons", main = "Emissions from coal combustion-related sources in US, 1999-2008")
dev.copy(png,file="plot4.png")
dev.off()

