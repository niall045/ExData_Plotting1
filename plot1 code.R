household_power_consumption <- read.csv("~/Documents/RWork/household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
household_power_consumption$Time2<-paste(household_power_consumption$Date, household_power_consumption$Time)
household_power_consumption$Date <- as.Date(household_power_consumption$Date, format = "%d/%m/%Y")

dat1 <- subset(household_power_consumption, Date == "2007-02-01")
dat2 <- subset(household_power_consumption, Date == "2007-02-02")
dat <- rbind(dat1, dat2)
dat$Time2 <- strptime(dat$Time2, "%d/%m/%Y %H:%M:%S") 
dat$Global_active_power <- as.numeric(dat$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(dat$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim = c(0,1200))
dev.off()
