require(tidyr)
require(plyr)
require(dplyr)
require(readxl)
u5mr <- read.csv("u5mr.csv")
dim(u5mr)
names(u5mr)
u5mr_long <- u5mr %>%
  gather(year, u5mr, U5MR.1950:U5MR.2015) %>%
  mutate(year = as.numeric(gsub("U5MR.", "", year)))
u5mr_long <- filter(u5mr_long, !is.na(u5mr_long$u5mr))


xl <- read_excel("RatesDeaths_AllIndicators.xlsx")
xl <- xl[-c(1:5), ]
colnames(xl) <- c(xl[1, ])
xl <- xl[-c(1), ]
mediansXL <- xl %>% filter(xl[ ,3] == "Median") %>% rename(country = CountryName)
mediansXL <- mediansXL[ ,-c(1)]
mediansXL <- mediansXL[ ,-c(2)]
mediansXL <- mediansXL %>% gather(Year, Value, U5MR.1950:Neonatal.Deaths.2015)
mediansXL <- mediansXL %>% rename(Country = country) 
mediansXL$Type <- ifelse(grepl("U5MR", mediansXL$Year, fixed = TRUE), "U5MR", 
                         ifelse(grepl("IMR", mediansXL$Year, fixed = TRUE), "IMR", 
                                ifelse(grepl("NMR", mediansXL$Year, fixed = TRUE), "NMR", 
                                       ifelse(grepl("Infant.Deaths", mediansXL$Year, fixed = TRUE), "Infant Deaths", 
                                              ifelse(grepl("Under.five.Deaths", mediansXL$Year, fixed = TRUE), "Under Five Deaths", 
                                                     ifelse(grepl("Neonatal.Deaths", mediansXL$Year, fixed = TRUE), "Neonatal Deaths", 
                                                            "NA"))))))
mediansXL$Year <- gsub(mediansXL$Type, "", mediansXL$Year)
mediansXL$Year <- gsub("[^0-9]","", mediansXL$Year)
mediansXL <- mediansXL[, c(1, 2, 4, 3)]
mediansXL <- mediansXL[-c(is.na(mediansXL$Value)), ]
