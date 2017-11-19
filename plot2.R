data <- read.table('./household_power_consumption.txt', sep = ';',
                   header = TRUE)

#transform the date to class Date
data$date <- as.Date(strptime(data$Date, '%d/%m/%Y'))
data$Global_active_power <- as.numeric(data$Global_active_power) / 500

#extract the useful data
use_data <- subset(data, (data$Date == '1/2/2007') |
                       (data$Date == '2/2/2007'))

use_data$Weekdays <- weekdays(use_data$date, abbreviate = TRUE)

#draw picture
png('plot2.png', width = 480, height = 480)
plot(1:length(use_data$Time), use_data$Global_active_power,
     type = 'l', xaxt = 'n', xlab = '',
     ylab = 'Gloabal Active Power (kilowatts)')
axis(side = 1, at = c(1, 1440, 2880), 
     labels = c('Thu', 'Fri', 'Sat'))
dev.off()