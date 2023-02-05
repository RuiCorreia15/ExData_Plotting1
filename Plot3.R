library(lubridate)

Sys.setlocale("LC_TIME", "English")

Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") 
DataSet <- Data %>% 
  mutate(Time = strptime(paste(Date, " " ,Time), "%d/%m/%Y %H:%M:%S")) %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename = "./plot3.png",
    width = 480 ,
    height = 480,
    units = "px",
    bg = "white")

plot(DataSet$Time,
     DataSet$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering",
     col="black")

lines(DataSet$Time,
     DataSet$Sub_metering_2,
     type="l",
     col="red")

lines(DataSet$Time,
      DataSet$Sub_metering_3,
      type="l",
      col="blue")

legend(x = "topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col=c("black", "red", "blue"))


dev.off()