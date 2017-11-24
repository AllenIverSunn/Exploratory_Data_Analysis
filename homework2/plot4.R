library(ggplot2)
library(reshape2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coal <- SCC[grep('coal', SCC$Short.Name, ignore.case = TRUE),]
use_data <- merge(x = NEI, y = coal, by = 'SCC')
merge_sum <- aggregate(use_data$Emissions, by = list(use_data$year),
                       sum)
png('plot4.png')
g + geom_point() + geom_line() + ylab('Emissions') + xlab('year')
dev.off()