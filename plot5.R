library(dplyr)
library(ggplot2)

source <- readRDS("Source_Classification_Code.rds")
summary0 <- readRDS("summarySCC_PM25.rds")
balt <- filter(summary0,summary0$fips=="24510")
merged <- merge(balt, source, by="SCC")
motorrelated <- filter(merged,grepl("highway vehicle",merged$SCC.Level.Two,ignore.case = TRUE))

aggrbyY <- aggregate(Emissions ~ year, motorrelated, sum)

barplot(height = aggrbyY$Emissions, names.arg = aggrbyY$year, xlab = "year", ylab = "Total PM25 Emissions in tons", main = "PM25 Emissions from motor vehicle sources in Baltimore, 1999-2008")

dev.copy(png,file="plot5.png")
dev.off()

