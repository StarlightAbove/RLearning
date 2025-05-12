world <- read.csv("world_small.csv")
world$region <- revalue(world$region, c(
  "C&E Europe" = "Europe", "Scandinavia" = "Europe", "W. Europe" = "Europe", "N. America" = "North America", "S. America" = "South America"))
europe <- world %>% filter(region == "Europe") %>% 
  mutate(polityIV = polityIV - 10) %>% 
  mutate(Rich_Poor = (ifelse(gdppcap08 > 17000, "Rich", "Poor"))) %>% 
  select(-region) %>% 
  arrange(polityIV)

mean(world$gdppcap08)
mean(world$polityIV)
africa <- world %>% filter(region == "Africa")
mean(africa$polityIV)
mean(africa$gdppcap08)
richest <- filter(world, gdppcap08 == max(world$gdppcap08))
poorest <- filter(world, gdppcap08 == min(world$gdppcap08))
percentageRichEU <- nrow(filter(europe, Rich_Poor == "Rich"))/nrow(europe)
percentagePoorEU <- nrow(filter(europe, Rich_Poor == "Poor"))/nrow(europe)
percentagePolityEU <- nrow(filter(europe, polityIV >= 8))/nrow(europe)
