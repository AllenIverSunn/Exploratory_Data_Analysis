library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
B_data <- subset(NEI, fips == '24510')
motor <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Aggregate
motor_sum <- aggregate(motor$Emissions, by=list(motor$year), sum)
colnames(motor_sum) <- c('year', 'Emissions')
motor_sum$year <- factor(motor_sum$year,
                         levels = c('1999', '2002', '2005', '2008'))
png('plot5.png', width = 800, height = 800)
ggplot(motor_sum, aes(x = year, y = Emissions)) + 
    geom_histogram(stat = 'identity', aes(fill = year))
dev.off()