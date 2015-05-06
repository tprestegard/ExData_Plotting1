plot1 <- function() {
    
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
    
    ## Open PNG file device.
    png(file = "plot1.png")
    
    ## Make histogram.
    hist(data$Global_active_power, col="red", 
         xlab="Global Active Power (kilowatts)",
         main="Global Active Power")
    
    ## Close PNG file and don't print anything about
    ## the graphics device.
    invisible(dev.off())
    
    
}