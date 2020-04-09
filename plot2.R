###To Read and Clean up the data###
household_power_consumption<-read.table('household_power_consumption.txt',sep=';',
                                        header=T,
                                        colClasses = rep('character',9)) #decide to set class in character because there might be '?' in the dataframe, representing missing values.
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
twoday_consumption<-subset(household_power_consumption,Date>="2007-02-01"&Date<="2007-02-02")
rm(household_power_consumption) #to remove the large dataframe from global env
################################
datetime<-with(twoday_consumption, paste(Date,Time,sep=" "))
datetime<-strptime(datetime,'%F %T') #to convert datetime to format POSIXlt

png(file = 'plot2.png', width=480, height=480, units = 'px')
plot(datetime,twoday_consumption$Global_active_power,type = 'l',
     xlab = '',ylab = 'Global Active Power (kilowatts)')
dev.off()
