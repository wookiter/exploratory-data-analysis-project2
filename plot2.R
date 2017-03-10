library(dplyr)
library(ggplot2)
summary0 <- readRDS("summarySCC_PM25.rds")
balt <- filter(summary0,summary0$fips=="24510")

sumagg <- aggregate(Emissions ~ year, balt, sum)

barplot(height = sumagg$Emissions, names.arg = sumagg$year, ylim = c(0,3500), xlab = "year", ylab = "Total PM25 Emissions in tons", main = "Emissions of PM25 in Baltimore 1999-2008")

dev.copy(png,file="plot2.png")
dev.off()

