world <- read.csv("world_small.csv")
summary(world)
dim(world)
head(world)

regionalMeans <- world %>% 
  group_by(region) %>% 
  summarise(countrynum = n(), meanGDP = mean(gdppcap08), medianGDP = median(gdppcap08), polityMean = mean(polityIV))
world <- mutate(world, democracy = ifelse(world$polityIV >= 15, "Democracy", "N. Democracy"))
