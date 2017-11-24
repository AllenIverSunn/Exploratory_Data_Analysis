NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
B_data <- subset(NEI, fips == '24510')
total <- tapply(B_data$Emissions, B_data$year, sum)
png('plot1.png')
plot(c(1999, 2002, 2005, 2008), total, main = 'total emission',
     type = 'l', xlab = 'year', ylab = 'Total Emission', xaxt = 'n')
points(c(1999, 2002, 2005, 2008), total)
axis(1, at = c(1999, 2002, 2005, 2008),
     labels = c('1999', '2002', '2005', '2008'))
dev.off()