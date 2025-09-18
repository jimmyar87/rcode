read.btb <- function(file) {
  btbdata <- read.table(file = file, skip = 16, header = FALSE)
  btbdata <- subset(btbdata, select = -c(2, 10, 11, 13, 14))
  colnames(btbdata) <- c("time", "vt", "ti", "te", "pico2", "peco2", "pio2", "peo2", "so2")
  btbdata$ve <- (btbdata$"vt" / 1000) * (60000 / (btbdata$"ti" + btbdata$"te"))
  btbdata$rr <- (60000 / (btbdata$"ti" + btbdata$"te"))
  btbdata$time <- as.POSIXct(btbdata$time, format = "%H:%M:%OS")
  btbdata <- btbdata[, c("time", "ve", "rr", "vt", "ti", "te", "pico2", "peco2", "pio2", "peo2", "so2")]
  return(btbdata)
}
