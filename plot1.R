# Read the data file into variable hpc and take a subset of data in hpc for Date = Feb 1 and 2 2007
hpc <- read.table(file = "household_power_consumption.txt",header=TRUE,sep = ";",na.strings = c("?"),stringsAsFactors = FALSE)
hpc_subset <- hpc[hpc$Date == "1/2/2007"| hpc$Date == "2/2/2007",]

# Open a png device
png(filename = "plot1.png",width = 480,height = 480)

# Use the base hist command on hpc_subset to generate the histogram in the required format
with(hpc_subset,hist(Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col="red"))

# Close the png device
dev.off()
