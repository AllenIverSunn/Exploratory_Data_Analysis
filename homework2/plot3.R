library(ggplot2)
library(reshape2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
B_data <- subset(NEI, fips == '24510')
B_data$year <- factor(B_data$year,
                      levels = c('1999', '2002', '2005', '2008'))
png('plot3.png', width = 800, height = 800)
ggplot(data=B_data, aes(x=year, y=log(Emissions))) + 
    facet_grid(. ~ type) +
    geom_boxplot(aes(fill=type))  +
    ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + 
    xlab('Year') + 
    ggtitle('Emissions per Type in Baltimore City, Maryland')
dev.off()