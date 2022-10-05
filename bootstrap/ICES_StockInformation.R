
library(icesTAF)
library(icesFO)

sid <- load_sid(2022)

write.taf(sid, dir = "bootstrap/initial/data/ICES_StockInformation", quote = TRUE)
