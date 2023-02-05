Data <-read.delim("household_power_consumption.txt", sep = ";")
Data01 <- subset(Data, Date == "1/2/2007")
Data02 <- subset(Data, Date == "2/2/2007")
DataSet <- rbind(Data01,Data02)
GAP <-as.numeric(DataSet$Global_active_power) 

png(filename = "./plot1.png",
    width = 480 ,
    height = 480,
    units = "px",
    bg = "white")

hist(GAP, 
     col = "red", 
     xlab ="Global Active Power (kilowatts)", 
     main = "Global Active Power")

dev.off()
