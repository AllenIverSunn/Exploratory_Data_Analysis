library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#extract only the motor emissions
B_data <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
L_data <- subset(NEI, fips == '06037' & type == 'ON-ROAD')
B_sum <- aggregate(B_data$Emissions, by = list(B_data$year), sum)
L_sum <- aggregate(L_data$Emissions, by = list(L_data$year), sum)
colnames(B_sum) <- c('year', 'Emissions')
colnames(L_sum) <- c('year', 'Emissions')
B_sum$city <- 'Boltimore'
L_sum$city <- 'LA'
sum_data <- rbind(B_sum, L_sum)
png('plot6.png')
ggplot(sum_data, aes(year, Emissions)) +
    geom_line(aes(color = city)) +
    geom_point(aes(color = city))
dev.off()