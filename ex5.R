df1 <- data.frame(
  name = c("Mary", "Thor", "Sven", "Jane", "Ake", "Stephan",
           "Bjorn", "Oden", "Dennis"),
  treatment_gr = c(rep(c(1, 2, 3), each = 3)),
  weight_p1 = round(runif(9, 100, 200), 0)
)
df2 <- data.frame(
  name = c("Sven", "Jane", "Ake", "Mary", "Thor", "Stephan",
           "Oden", "Bjorn"),
  weight_p2 = round(runif(8, 100, 200), 0)
)
df3 <- data.frame(
  treatment_gr = c(1, 2, 3),
  type = c("dog-lovers", "cat-lovers", "all-lovers")
)

df <- merge(df1, df2, by = "name")
df <- merge(df, df3, by = "treatment_gr")


