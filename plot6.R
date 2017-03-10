library(dplyr)
library(ggplot2)
library(plyr)

source <- readRDS("Source_Classification_Code.rds")
summary0 <- readRDS("summarySCC_PM25.rds")
bcla <- filter(summary0,summary0$fips=="24510" | summary0$fips=="06037")
merged <- merge(bcla, source, by="SCC")
motorrelated <- filter(merged,grepl("highway vehicle",merged$SCC.Level.Two,ignore.case = TRUE))
motorrelated$fips <- revalue(motorrelated$fips, c("06037"="Los Angeles","24510"="Baltimore"))

baltbyYandT <- aggregate(Emissions ~ year + fips, motorrelated, sum)
ggplot(baltbyYandT, aes(year, Emissions, color = fips)) + 
  geom_line () + 
  xlab ("year") + 
  ylab ("Total PM25 Emissions in tons") +
  ggtitle("PM 25 Emissions from motor vehicle sources, Baltimore vs LA, 1999 - 2008")

dev.copy(png,file="plot6.png")
dev.off()
