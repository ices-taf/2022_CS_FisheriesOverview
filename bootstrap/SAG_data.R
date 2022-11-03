library(icesTAF)
library(icesFO)
library(dplyr)


out <- load_sag(2022, "Celtic Seas")

#I rescue ank as it has "Replaced" as Purpose (I modify the function)
ank <- load_sag(2022, "Celtic Seas")
ank <- ank %>% filter(FishStock == "ank.27.78abd")

out <- out %>% filter(FishStock != "ank.27.78abd")
out <- rbind(out, ank)

sag_complete <- out

write.taf(out, file = "SAG_complete_CS.csv", quote = TRUE)


status <- load_sag_status(2022)

write.taf(status, file = "SAG_status_CS.csv", quote = TRUE)
