v <- c(9, 18, 40, 74)
m <- mean(v)
m2 <- sum(v)/length(v)
youngest <- min(v)
age_gap <- max(v) - min(v)
above_25 <- v[v > 25]

m
m2
youngest
age_gap
above_25

v[v == max(v)] <- 50
v_10 <- v + 10
v_100 <- 100 - v
v_samp <- sample(v, size = 3)

v_10
v_100
v_samp
v
