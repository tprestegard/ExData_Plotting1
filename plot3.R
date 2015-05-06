plot3 <- function() {
    
    ## Load dplyr and tidyr for handling data.
    library(dplyr,tidyr)
    
    ## Load data corresponding to Feb. 1-2, 2007.  Row ranges were
    ## determined by manually looking at the data.
    col_class = c("character","character","numeric","numeric","numeric",
                  "numeric","numeric","numeric","numeric")
    data <- read.table("household_power_consumption.txt", header=TRUE,
                        sep=";", skip=66636, nrows=2880, stringsAsFactors=FALSE)
    
    ## Need to read in the column names too since we skipped rows.
    header <- read.table("household_power_consumption.txt", header=FALSE,
                         nrows=1, sep=";", stringsAsFactors=FALSE)
    colnames(data) <- unlist(header)
    
    ## Make into a nice table for ease of debugging.
    data <- tbl_df(data)
    
    ## Combine columns 1 and 2 into column 1 and convert to POSIXlt.
    ## Then delete column 2.
    data$Date <- paste(data$Date,data$Time)
    data$Date <- strptime(data$Date, format="%d/%m/%Y %H:%M:%S")
    data <- data[,-2]

    ## Open PNG file device.
    png(file = "plot3.png")
    
    ## Open plot but don't add data.
    plot(data$Date,data$Sub_metering_1, type="n", xlab="",
         ylab="Energy sub metering")
    
    ## Add lines.
    lines(data$Date, data$Sub_metering_1, col="black")
    lines(data$Date, data$Sub_metering_2, col="red")
    lines(data$Date, data$Sub_metering_3, col="blue")
    
    ## Add legend.
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            col=c("black","red","blue"), lwd=1)
    
    ## Close PNG file and don't print anything about
    ## the graphics device.
    invisible(dev.off())
    
    
}