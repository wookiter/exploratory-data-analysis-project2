library(dplyr)

summary0 <- readRDS("summarySCC_PM25.rds")

sumagg <- aggregate(Emissions ~ year, summary0, sum)
sumagg <- mutate(sumagg, Emissions_M = Emissions/1000000)

barplot(height = sumagg$Emissions_M, names.arg = sumagg$year, xlab = "year", ylab = "Total PM25 Emissions in M tons", main = "Emissions of PM25 in US 1999-2008")

dev.copy(png,file="plot1.png")
dev.off()

