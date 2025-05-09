# Step 1: Data Understanding

library(tidyverse)

# Load the data
data <- read_csv("data/FatalityCrashData.csv")

# Summary statistics
glimpse(data)
summary(data)
colSums(is.na(data))

# Plot 1: Fatalities by State
ggplot(data, aes(x = fct_infreq(StateName))) +
  geom_bar(fill = "steelblue") +
  coord_flip() +
  labs(title = "Number of Fatal Crashes by State (2015–2022)",
       x = "State", y = "Number of Records")
ggsave("images/fatalities_by_state.png", width = 10, height = 6)

# Plot 2: Distribution of Fatalities per Crash
ggplot(data, aes(x = Fatals)) +
  geom_histogram(binwidth = 1, fill = "darkred", color = "white") +
  labs(title = "Distribution of Fatalities per Crash",
       x = "Number of Fatalities", y = "Frequency")
ggsave("images/fatalities_per_crash.png", width = 10, height = 6)

