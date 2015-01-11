# Read the data file into variable hpc and take a subset of data in hpc for Date = Feb 1 and 2 2007
hpc <- read.table(file = "household_power_consumption.txt",header=TRUE,sep = ";",na.strings = c("?"),stringsAsFactors = FALSE)
hpc_subset <- hpc[hpc$Date == "1/2/2007"| hpc$Date == "2/2/2007",]

# Use paste and strptime to combine Date and Time fields and store the result as a DateTime variable in hpc_subset
hpc_subset$DateTime <- paste(hpc_subset$Date,hpc_subset$Time)
hpc_subset$DateTime <- strptime(hpc_subset$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Open a png device
png(filename = "plot4.png",width = 480,height = 480)

# Create 4 plots (2x2), column-first
par(mfcol = c(2,2))

# Create the same plot as created by plot2.R
with(hpc_subset,plot(DateTime,Global_active_power,type = "n",ylab="Global Active Power",xlab=""))
with(hpc_subset,lines(DateTime,Global_active_power))

# Create the same plot as created by plot3.R, except that bty=n is used in legend() to remove the border around the legend box
with(hpc_subset,plot(DateTime,Sub_metering_1,xlab="",ylab="Energy sub metering",type="n"))
with(hpc_subset,lines(DateTime,Sub_metering_1,col = "black"))
with(hpc_subset,lines(DateTime,Sub_metering_2,col = "red"))
with(hpc_subset,lines(DateTime,Sub_metering_3,col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

# Plot Voltage against DateTime as a line graph
with(hpc_subset,plot(DateTime,Voltage,xlab="datetime",ylab="Voltage",typ="n"))
with(hpc_subset,lines(DateTime,Voltage))

# Plot Global_reactive_power against DateTime as a line graph
with(hpc_subset,plot(DateTime,Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",typ="n"))
with(hpc_subset,lines(DateTime,Global_reactive_power))

# Close the png device
dev.off()
