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

#split the graph to 2*2
par(mfrow = c(2, 2))
#first
plot(use_data$Global_active_power, type = 'l', xaxt = 'n',
     ylab = 'Global Active Power')
axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
#second
use_data$Voltage <- as.numeric(use_data$Voltage)
plot(use_data$Voltage, type = 'l', xaxt = 'n', ylab = 'Voltage')
axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
#third
plot(use_data$Sub_metering_1, type = 'l', xaxt = 'n', yaxt = 'n',
     xlab = '', ylab = 'Energy sub metering')
lines(use_data$Sub_metering_2, col = 'red')
lines(use_data$Sub_metering_3, col = 'blue')
axis(1, at = c(1, 1440, 2880), labels = c('Thu', 'Fri', 'Sat'))
axis(2, at = c(1, 10, 20, 30), labels = c('0', '10', '20', '30'))
legend <- c("Sub_metering_1", "Sub_metering_2", 'Sub_metering_3')
legend('topright',legend, col=c("black", "red", 'blue'), lty = 1)
#fourth
use_data$Global_reactive_power <- as.numeric(
                                    use_data$Global_reactive_power)
plot(use_data$Global_reactive_power / 400, type = 'l',
     ylab = 'Global_reactive_power', xlab = 'datetime', xaxt = 'n')
axis(1, c(1, 1440, 2880), c('Thu', 'Fri', 'Sat'))

dev.off()