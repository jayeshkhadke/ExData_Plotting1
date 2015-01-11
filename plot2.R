# Read the data file into variable hpc and take a subset of data in hpc for Date = Feb 1 and 2 2007
hpc <- read.table(file = "household_power_consumption.txt",header=TRUE,sep = ";",na.strings = c("?"),stringsAsFactors = FALSE)
hpc_subset <- hpc[hpc$Date == "1/2/2007"| hpc$Date == "2/2/2007",]

# Use paste and strptime to combine Date and Time fields and store the result as a DateTime variable in hpc_subset
hpc_subset$DateTime <- paste(hpc_subset$Date,hpc_subset$Time)
hpc_subset$DateTime <- strptime(hpc_subset$DateTime, format = "%d/%m/%Y %H:%M:%S")

# Open a png device
png(filename = "plot2.png",width = 480,height = 480)

# Use plot on hpc_subset with type = n to prepare the plotting area with the required labels
with(hpc_subset,plot(DateTime,Global_active_power,type = "n",ylab="Global Active Power (kilowatts)",xlab=""))

# Use lines to graph the Global_active_power against DateTime on the plot created
with(hpc_subset,lines(DateTime,Global_active_power))

# Close the png device
dev.off()
