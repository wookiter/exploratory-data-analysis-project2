library(dplyr)
library(ggplot2)

summary0 <- readRDS("summarySCC_PM25.rds")
balt <- filter(summary0,summary0$fips=="24510")
baltbyYandT <- aggregate(Emissions ~ year + type, balt, sum)
ggplot(baltbyYandT, aes(year, Emissions, color = type)) +
geom_line () +
xlab ("year") +
ylab ("Total PM 25 Emissions in tons") +
ggtitle("Total PM 25 Emissions, Baltimore, 1999 - 2008")


dev.copy(png,file="plot3.png")
dev.off()

