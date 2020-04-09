###Read and Clean up the data###
household_power_consumption<-read.table('household_power_consumption.txt',sep=';',
                                        header=T,
                                        colClasses = rep('character',9)) #decide to set class in character because there might be '?' in the dataframe, representing missing values.
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
twoday_consumption<-subset(household_power_consumption,Date>="2007-02-01"&Date<="2007-02-02")
rm(household_power_consumption) #to remove the large dataframe from global env
################################
sum(twoday_consumption$Global_active_power=='?') #to check for missing values, note that the origninal data fills '?' for missing value, turns out no missing values

png(file = 'plot1.png', width=480, height=480, units = 'px')
hist(as.numeric(as.character(twoday_consumption$Global_active_power)),col='red',main = 'Global Active Power',xlab = 'Global Active Power (kilowatts)')
dev.off()