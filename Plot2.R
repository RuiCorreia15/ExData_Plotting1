library(lubridate)

Sys.setlocale("LC_TIME", "English")

Data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";") 
DataSet <- Data %>% 
  mutate(Time = strptime(paste(Date, " " ,Time), "%d/%m/%Y %H:%M:%S")) %>%
  mutate(Date = as.Date(Date, "%d/%m/%Y")) %>%
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename = "./plot2.png",
    width = 480 ,
    height = 480,
    units = "px",
    bg = "white")

plot(DataSet$Time,
     DataSet$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kW)")

dev.off()