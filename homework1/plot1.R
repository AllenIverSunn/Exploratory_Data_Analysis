data <- read.table('./household_power_consumption.txt', sep = ';',
                   header = TRUE)

#transform the date to class Date
data$date <- as.Date(strptime(data$Date, '%d/%m/%Y'))
data$Global_active_power <- as.numeric(data$Global_active_power) / 500

#extract the useful data
use_data <- subset(data, (data$Date == '1/2/2007') | (data$Date == '2/2/2007'))

#draw the picture
png('plot1.png', width = 480, height = 480)
hist(use_data$Global_active_power, col = 'red',
     xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency',
     main = 'Global Avtive Power')
dev.off()