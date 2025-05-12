world <- read.csv("world_small.csv")
dim(world)
world[world$country == "United States" , ]
world[world$country == "Nigeria", ]
world[world$country == "China", "polityIV"]
min(world$gdppcap08)
world[world$gdppcap08 == min(world$gdppcap08), ]
