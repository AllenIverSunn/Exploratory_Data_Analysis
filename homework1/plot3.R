data <- read.table('./household_power_consumption.txt', sep = ';',
                   header = TRUE)

#transform the date to class Date
data$date <- as.Date(strptime(data$Date, '%d/%m/%Y'))
data$Global_active_power <- as.numeric(data$Global_active_power) / 500

#extract the useful data
use_data <- subset(data, (data$Date == '1/2/2007') |
                       (data$Date == '2/2/2007'))

use_data$Weekdays <- weekdays(use_data$date, abbreviate = TRUE)

#convert data to numeric
use_data$Sub_metering_1 <- as.numeric(use_data$Sub_metering_1)
use_data$Sub_metering_2 <- as.numeric(use_data$Sub_metering_2)
use_data$Sub_metering_3 <- as.numeric(use_data$Sub_metering_3)

#draw pictures
png('plot3.png', width = 480, height = 480)

plot(use_data$Sub_metering_1, type = 'l', xaxt = 'n', yaxt = 'n',
     xlab = '', ylab = 'Energy sub metering')
lines(use_data$Sub_metering_2, col = 'red')
lines(use_data$Sub_metering_3, col = 'blue')
axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
axis(2, at = c(1, 10, 20, 30), labels = c('0', '10', '20', '30'))
legend <- c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3')
legend('topright',legend, col=c("black", "red", 'blue'), lty = 1)

dev.off()