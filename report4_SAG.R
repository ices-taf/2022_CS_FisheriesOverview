
library(icesTAF)
library(icesFO)
library(sf)
library(ggplot2)
library(dplyr)

## Run utilies
source("bootstrap/utilities.r")

# set values for automatic naming of files:
cap_year <- 2022
cap_month <- "October"
ecoreg_code <- "CS"

##########
#Load data
##########

trends <- read.taf("model/trends.csv")
catch_current <- read.taf("model/catch_current.csv")
catch_trends <- read.taf("model/catch_trends.csv")

clean_status <- read.taf("data/clean_status.csv")


# set year for plot calculations

year = 2022


###########
## 3: SAG #
###########

#~~~~~~~~~~~~~~~#
# A. Trends by guild
#~~~~~~~~~~~~~~~#

unique(trends$FisheriesGuild)

# 1. Benthic
#~~~~~~~~~~~
plot_stock_trends(trends, guild="benthic", cap_year, cap_month , return_data = FALSE)
ggplot2::ggsave(file_name(cap_year,ecoreg_code,"SAG_Trends_benthic", ext = "png"), path = "report/", width = 178, height = 130, units = "mm", dpi = 300)

dat <- plot_stock_trends(trends, guild="benthic", cap_year , cap_month, return_data = TRUE)
write.taf(dat, file =file_name(cap_year,ecoreg_code,"SAG_Trends_benthic", ext = "csv"), dir = "report")

# 2. Demersal
#~~~~~~~~~~~
plot_stock_trends(trends, guild="demersal", cap_year, cap_month , return_data = FALSE)
ggplot2::ggsave(file_name(cap_year,ecoreg_code,"SAG_Trends_demersal", ext = "png"), path = "report/", width = 178, height = 130, units = "mm", dpi = 300)

dat <- plot_stock_trends(trends, guild="demersal", cap_year , cap_month, return_data = TRUE)
write.taf(dat, file =file_name(cap_year,ecoreg_code,"SAG_Trends_demersal", ext = "csv"), dir = "report")

# 3. Pelagic
#~~~~~~~~~~~
plot_stock_trends(trends, guild="pelagic", cap_year, cap_month , return_data = FALSE)
ggplot2::ggsave(file_name(cap_year,ecoreg_code,"SAG_Trends_pelagic", ext = "png"), path = "report/", width = 178, height = 130, units = "mm", dpi = 300)

dat <- plot_stock_trends(trends, guild="pelagic", cap_year, cap_month, return_data = TRUE)
write.taf(dat,file =file_name(cap_year,ecoreg_code,"SAG_Trends_pelagic", ext = "csv"), dir = "report")

# 4. Elasmobranchs
#~~~~~~~~~~~
# plot_stock_trends(trends, guild="elasmobranch", cap_year, cap_month ,return_data = FALSE )
# ggplot2::ggsave(file_name(cap_year,ecoreg_code,"SAG_Trends_elasmobranch", ext = "png"), path = "report/", width = 178, height = 130, units = "mm", dpi = 300)
# 
# dat <- plot_stock_trends(trends, guild="elasmobranch", cap_year , cap_month , return_data = TRUE)
# write.taf(dat, file =file_name(cap_year,ecoreg_code,"SAG_Trends_elasmobranch", ext = "csv"), dir = "report" )

# 5. Crustacean
#~~~~~~~~~~~
plot_stock_trends(trends, guild="crustacean", cap_year, cap_month ,return_data = FALSE )
ggplot2::ggsave(file_name(cap_year,ecoreg_code,"SAG_Trends_crustacean", ext = "png"), path = "report/", width = 178, height = 130, units = "mm", dpi = 300)

dat <- plot_stock_trends(trends, guild="crustacean", cap_year , cap_month , return_data = TRUE)
write.taf(dat, file =file_name(cap_year,ecoreg_code,"SAG_Trends_crustacean", ext = "csv"), dir = "report" )


#~~~~~~~~~~~~~~~~~~~~~~~~~#
# Ecosystem Overviews plot
#~~~~~~~~~~~~~~~~~~~~~~~~~#
guild <- read.taf("model/guild.csv")

# For this EO, they need separate plots with all info
#F
guild2 <- guild %>% filter(Metric == "F_FMSY")
<<<<<<< HEAD
plot_guild_trends(guild, cap_year, cap_month,return_data = FALSE )
ggplot2::ggsave(paste0(year_cap, "_", ecoreg, "_EO_GuildTrends.png"), dir = "report/", width = 178, height = 130, units = "mm", dpi = 300)
guild2 <- guild2 %>% filter(FisheriesGuild != "MEAN")
guild3 <- guild2 %>%filter(Year < 2021)
plot_guild_trends(guild3, cap_year = 2021, cap_month = "November",return_data = FALSE )
ggplot2::ggsave(paste0(year_cap, "_", ecoreg, "_EO_SAG_GuildTrends_F.png"), path = "report/", width = 178, height = 130, units = "mm", dpi = 300)
=======
plot_guild_trends(guild2, cap_year = 2021, cap_month = "October",return_data = FALSE )
ggplot2::ggsave("2021_CS_EO_GuildTrends_F.png", path = "report/", width = 178, height = 130, units = "mm", dpi = 300)
# make short version 1960-2020
guild2short <- guild2 %>% dplyr::filter(Year >= 1960)
plot_guild_trends(guild2short, cap_year = 2021, cap_month = "October",return_data = FALSE )
ggplot2::ggsave("2021_CS_EO_GuildTrends_F_SHORT1960.png", path = "report/", width = 178, height = 130, units = "mm", dpi = 300)

>>>>>>> 2ce21d959d49b160f462c007ca7111ce6f1ebc2c


guild2 <- guild2 %>% filter(FisheriesGuild != "MEAN")
plot_guild_trends(guild2, cap_year = 2021, cap_month = "October",return_data = FALSE )
ggplot2::ggsave("2021_CS_EO_GuildTrends_noMEAN_F.png", path = "report/", width = 178, height = 130, units = "mm", dpi = 300)
#SSB
guild2 <- guild %>% filter(Metric == "SSB_MSYBtrigger")
plot_guild_trends(guild2, cap_year = 2021, cap_month = "October",return_data = FALSE )
ggplot2::ggsave("2021_CS_EO_GuildTrends_SSB.png", path = "report/", width = 178, height = 130, units = "mm", dpi = 300)

guild2short <- guild2 %>% dplyr::filter(Year >= 1960)
plot_guild_trends(guild2short, cap_year = 2021, cap_month = "October",return_data = FALSE )
ggplot2::ggsave("2021_CS_EO_GuildTrends_SSB_SHORT1960.png", path = "report/", width = 178, height = 130, units = "mm", dpi = 300)


guild3 <- guild2 %>% dplyr::filter(FisheriesGuild != "MEAN")
<<<<<<< HEAD
guild4 <- guild3 %>%dplyr::filter(Year > 1960)
plot_guild_trends(guild4, cap_year = 2021, cap_month = "November",return_data = FALSE )
ggplot2::ggsave(paste0(year_cap, "_", ecoreg, "_EO_SAG_GuildTrends_SSB.png"), path = "report/", width = 178, height = 130, units = "mm", dpi = 300)
=======
plot_guild_trends(guild3, cap_year = 2021, cap_month = "October",return_data = FALSE )
ggplot2::ggsave("2021_CS_EO_GuildTrends_short_noMEAN_SSB.png", path = "report/", width = 178, height = 130, units = "mm", dpi = 300)

guild3short <- guild3 %>% dplyr::filter(Year >= 1960)
plot_guild_trends(guild3short, cap_year = 2021, cap_month = "October",return_data = FALSE )
ggplot2::ggsave("2021_CS_EO_GuildTrends_short_noMEAN_SSB_SHORT1960.png", path = "report/", width = 178, height = 130, units = "mm", dpi = 300)
>>>>>>> 2ce21d959d49b160f462c007ca7111ce6f1ebc2c

dat <- plot_guild_trends(guild, cap_year = 2021, cap_month = "October",return_data = TRUE)
write.taf(dat, file ="2021_CS_EO_GuildTrends.csv", dir = "report", quote = TRUE)

<<<<<<< HEAD
dat <- plot_guild_trends(guild, cap_year = 2021, cap_month = "November",return_data = TRUE)
write.taf(dat, file ="2021_CS_EO_GuildTrends.csv", dir = "report", quote = TRUE)
=======
guildshort <- guild %>% dplyr::filter(Year >= 1960)
datShort <- plot_guild_trends(guildshort, cap_year = 2021, cap_month = "October",return_data = TRUE)
write.taf(dat, file ="2021_CS_EO_GuildTrends_SHORT1960.csv", dir = "report", quote = TRUE)
>>>>>>> 2ce21d959d49b160f462c007ca7111ce6f1ebc2c

dat <- trends[,1:2]
dat <- unique(dat)
dat <- dat %>% filter(StockKeyLabel != "MEAN")
dat2 <- sid %>% select(c(StockKeyLabel, StockKeyDescription))
dat <- left_join(dat,dat2)
write.taf(dat, file ="2021_CS_EO_SpeciesGuild_list.csv", dir = "report", quote = TRUE)

#~~~~~~~~~~~~~~~#
# B.Current catches
#~~~~~~~~~~~~~~~#

# 1. Demersal
#~~~~~~~~~~~

bar <- plot_CLD_bar(catch_current, guild = "demersal", caption = TRUE, cap_year, cap_month, return_data = FALSE)
catch_current <- catch_current %>% filter(StockKeyLabel != "ele.2737.nea")
# catch_current <- catch_current %>% filter(StockKeyLabel != "pol.27.67")
bar <- plot_CLD_bar(catch_current, guild = "demersal", caption = TRUE, cap_year, cap_month, return_data = FALSE)
bar_dat <- plot_CLD_bar(catch_current, guild = "demersal", caption = TRUE, cap_year , cap_month , return_data = TRUE)
write.taf(bar_dat, file =file_name(cap_year,ecoreg_code,"SAG_Current_demersal", ext = "csv"), dir = "report" )

kobe <- plot_kobe(catch_current, guild = "demersal", caption = TRUE, cap_year , cap_month , return_data = FALSE)
#kobe_dat is just like bar_dat with one less variable
#kobe_dat <- plot_kobe(catch_current, guild = "Demersal", caption = T, cap_year , cap_month , return_data = TRUE)

#Check this file name

png(file_name(cap_year,ecoreg_code,"SAG_Current_demersal", ext = "png"),
    width = 131.32,
    height = 88.9,
    units = "mm",
    res = 300)
p1_plot<-gridExtra::grid.arrange(kobe,
                                 bar, ncol = 2,
                                 respect = TRUE, top = "demersal")
dev.off()

# 2. Pelagic
#~~~~~~~~~~~
bar <- plot_CLD_bar(catch_current, guild = "pelagic", caption = TRUE, cap_year, cap_month , return_data = FALSE)

bar_dat <- plot_CLD_bar(catch_current, guild = "pelagic", caption = TRUE, cap_year , cap_month , return_data = TRUE)
write.taf(bar_dat, file =file_name(cap_year,ecoreg_code,"SAG_Current_pelagic", ext = "csv"), dir = "report")

catch_current <- unique(catch_current)
kobe <- plot_kobe(catch_current, guild = "pelagic", caption = TRUE, cap_year , cap_month , return_data = FALSE)
#check this file name

png(file_name(cap_year,ecoreg_code,"SAG_Current_pelagic", ext = "png"),
    width = 131.32,
    height = 88.9,
    units = "mm",
    res = 300)
p1_plot<-gridExtra::grid.arrange(kobe,
                                 bar, ncol = 2,
                                 respect = TRUE, top = "pelagic")
dev.off()

# 3. Crustacean
#~~~~~~~~~~~
# catch_current$Status[which(catch_current$StockKeyLabel == "sol.27.20-24")] <- "GREEN"

bar <- plot_CLD_bar(catch_current, guild = "crustacean", caption = TRUE, cap_year , cap_month , return_data = FALSE)

bar_dat <- plot_CLD_bar(catch_current, guild = "crustacean", caption = TRUE, cap_year , cap_month , return_data = TRUE)
write.taf(bar_dat, file =file_name(cap_year,ecoreg_code,"SAG_Current_crustacean", ext = "csv"), dir = "report" )

kobe <- plot_kobe(catch_current, guild = "crustacean", caption = TRUE, cap_year , cap_month , return_data = FALSE)
#check this file name

png(file_name(cap_year,ecoreg_code,"SAG_Current_crustacean", ext = "png"),

    width = 131.32,
    height = 88.9,
    units = "mm",
    res = 300)
p1_plot<-gridExtra::grid.arrange(kobe,
                                 bar, ncol = 2,
                                 respect = TRUE, top = "crustacean")
dev.off()

# 4. benthic
#~~~~~~~~~~~
# catch_current$Status[which(catch_current$StockKeyLabel == "sol.27.20-24")] <- "GREEN"

bar <- plot_CLD_bar(catch_current, guild = "benthic", caption = TRUE, cap_year , cap_month , return_data = FALSE)

bar_dat <- plot_CLD_bar(catch_current, guild = "benthic", caption = TRUE, cap_year , cap_month , return_data = TRUE)
write.taf(bar_dat, file =file_name(cap_year,ecoreg_code,"SAG_Current_benthic", ext = "csv"), dir = "report" )

kobe <- plot_kobe(catch_current, guild = "benthic", caption = TRUE, cap_year , cap_month , return_data = FALSE)
#check this file name

png(file_name(cap_year,ecoreg_code,"SAG_Current_benthic", ext = "png"),
    width = 131.32,
    height = 88.9,
    units = "mm",
    res = 300)
p1_plot<-gridExtra::grid.arrange(kobe,
                                 bar, ncol = 2,
                                 respect = TRUE, top = "benthic")
dev.off()


# 4. All
#~~~~~~~~~~~
bar <- plot_CLD_bar(catch_current, guild = "All", caption = TRUE, cap_year , cap_month , return_data = FALSE)

bar_dat <- plot_CLD_bar(catch_current, guild = "All", caption = TRUE, cap_year, cap_month , return_data = TRUE)
write.taf(bar_dat, file =file_name(cap_year,ecoreg_code,"SAG_Current_all", ext = "csv"), dir = "report" )

top_10 <- bar_dat %>% top_n(10, total) # total calculation is not working
bar <- plot_CLD_bar(top_10, guild = "All", caption = TRUE, cap_year , cap_month , return_data = FALSE)

kobe <- plot_kobe(top_10, guild = "All", caption = TRUE, cap_year, cap_month , return_data = FALSE)
#check this file name
png(file_name(cap_year,ecoreg_code,"SAG_Current_all", ext = "png"),
    width = 131.32,
    height = 88.9,
    units = "mm",
    res = 300)
p1_plot<-gridExtra::grid.arrange(kobe,
                                 bar, ncol = 2,
                                 respect = TRUE, top = "All stocks top 10")
dev.off()


#~~~~~~~~~~~~~~~#
# C. Discards
#~~~~~~~~~~~~~~~#
discardsA <- plot_discard_trends(catch_trends, year, cap_year, cap_month )
catch_trends2 <- catch_trends %>% filter(FisheriesGuild != "elasmobranch")
discardsA <- plot_discard_trends(catch_trends2, year, cap_year, cap_month )

catch_trends3 <- catch_trends2 %>% filter(discards > 0)
df5 <- df %>% filter(discards >0)
df5 <- df
discardsB <- plot_discard_current(catch_trends3, year,position_letter = "b)", cap_year , cap_month , caption = FALSE)
# nothing comes out here, because no spurdog assessment

discardsC <- plot_discard_current(catch_trends2, year,position_letter = "c)", cap_year , cap_month, caption = TRUE )

#Need to change order?
dat <- plot_discard_current(catch_trends, year, cap_year, cap_month , return_data = TRUE)
write.taf(dat, file =file_name(cap_year,ecoreg_code,"SAG_Discards_current", ext = "csv"),dir = "report" )

cowplot::plot_grid(discardsA, discardsB, discardsC, align = "h",nrow = 1, rel_widths = 1, rel_heights = 1)
ggplot2::ggsave(file_name(cap_year,ecoreg_code,"_FO_SAG_Discards", ext = "png"),path = "report/", width = 220.32, height = 88.9, units = "mm", dpi = 300)


#~~~~~~~~~~~~~~~#
#D. ICES pies
#~~~~~~~~~~~~~~~#

plot_status_prop_pies(clean_status, cap_month, cap_year)

unique(clean_status$StockSize)
clean_status$StockSize <- gsub("qual_RED", "RED", clean_status$StockSize)

unique(clean_status$FishingPressure)
# clean_status$FishingPressure <- gsub("qual_GREEN", "GREEN", clean_status$FishingPressure)

# clean_status2 <- clean_status
# clean_status2$FishingPressure <- gsub("qual_GREEN", "GREEN", clean_status2$FishingPressure)
plot_status_prop_pies(clean_status, cap_month, cap_year)
ggplot2::ggsave(file_name(cap_year,ecoreg_code,"SAG_ICESpies", ext = "png"), path= "report/", width = 178, height = 178, units = "mm", dpi = 300)

dat <- plot_status_prop_pies(clean_status, cap_month, cap_year, return_data = TRUE)
write.taf(dat, file= file_name(cap_year,ecoreg_code,"SAG_ICESpies", ext = "csv"),dir ="report")

#~~~~~~~~~~~~~~~#
#E. GES pies
#~~~~~~~~~~~~~~~#

plot_GES_pies(clean_status, catch_current, cap_month, cap_year)
ggplot2::ggsave(file_name(cap_year,ecoreg_code,"SAG_GESpies", ext = "png"),path = "report",width = 178, height = 178, units = "mm",dpi = 300)

dat <- plot_GES_pies(clean_status, catch_current, cap_month, cap_year, return_data = TRUE)
write.taf(dat, file = file_name(cap_year,ecoreg_code,"SAG_GESpies", ext = "csv"),dir ="report")

#~~~~~~~~~~~~~~~#
#F. ANNEX TABLE
#~~~~~~~~~~~~~~~#


dat <- format_annex_table(clean_status, year)

dat <- read.taf("report/2022_CS_FO_annex_table.csv")

format_annex_table_html(dat, cap_year, ecoreg_code)
write.taf(dat, file = file_name(cap_year,ecoreg_code,"annex_table", ext = "csv"), dir = "report", quote=TRUE)

# This annex table has to be edited by hand,
# For SBL and GES only one values is reported,
# the one in PA for SBL and the one in MSY for GES


