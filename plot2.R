plot2 <- function() {
    
    ## Load dplyr and tidyr for handling data.
    library(dplyr,tidyr)
    
    ## Load data corresponding to Feb. 1-2, 2007.  Row ranges were
    ## determined by manually looking at the data.
    col_class = c("character","character","numeric","numeric","numeric",
                  "numeric","numeric","numeric","numeric")
    data <- read.table("../household_power_consumption.txt", header=TRUE,
                        sep=";", skip=66636, nrows=2880, stringsAsFactors=FALSE)
    
    ## Need to read in the column names too since we skipped rows.
    header <- read.table("../household_power_consumption.txt", header=FALSE,
                         nrows=1, sep=";", stringsAsFactors=FALSE)
    colnames(data) <- unlist(header)
    
    ## Make into a nice table for ease of debugging.
    data <- tbl_df(data)
    
    ## Combine columns 1 and 2 into column 1 and convert to POSIXlt.
    ## Then delete column 2
    data$Date <- paste(data$Date,data$Time)
    data$Date <- strptime(data$Date, format="%d/%m/%Y %H:%M:%S")
    data <- data[,-2]
    
    ## Open PNG file device.
    png(file = "plot2.png")
    
    ## Open plot but don't add data.
    plot(data$Date,data$Global_active_power, type="n", xlab="",
         ylab="Global Active Power (kilowatts)")
    
    ## Add lines.
    lines(data$Date, data$Global_active_power)
    
    ## Close PNG file and don't print anything about
    ## the graphics device.
    invisible(dev.off())
    
    
}