library(tidyverse)
library(lubridate)

# Load the dataset
data <- read_csv("data/FatalityCrashData.csv")

# 1 Handle Missing Values (remove rows with missing date)
data_clean <- data %>% 
  filter(!is.na(CrashDateTime))

# 2 Convert CrashDateTime and extract time-based features
data_clean <- data_clean %>%
  mutate(
    Year = year(CrashDateTime),
    Month = month(CrashDateTime, label = TRUE, abbr = TRUE),
    DayOfWeek = wday(CrashDateTime, label = TRUE),
    Hour = hour(CrashDateTime)
  )

# 3 Save summary plots for time variables
# Crashes by Year
ggplot(data_clean, aes(x = factor(Year))) +
  geom_bar(fill = "darkgreen") +
  labs(title = "Number of Fatal Crashes by Year",
       x = "Year", y = "Number of Crashes")
ggsave("images/crashes_by_year.png", width = 8, height = 5)

# Crashes by Month
ggplot(data_clean, aes(x = Month)) +
  geom_bar(fill = "purple") +
  labs(title = "Number of Fatal Crashes by Month",
       x = "Month", y = "Number of Crashes")
ggsave("images/crashes_by_month.png", width = 8, height = 5)

# Crashes by Day of Week
ggplot(data_clean, aes(x = DayOfWeek)) +
  geom_bar(fill = "orange") +
  labs(title = "Crashes by Day of the Week",
       x = "Day", y = "Number of Crashes")
ggsave("images/crashes_by_dayofweek.png", width = 8, height = 5)

# Crashes by Hour
ggplot(data_clean, aes(x = Hour)) +
  geom_bar(fill = "skyblue") +
  labs(title = "Crashes by Hour of the Day",
       x = "Hour", y = "Number of Crashes")
ggsave("images/crashes_by_hour.png", width = 8, height = 5)

# 4 Save cleaned dataset
write_csv(data_clean, "data/FatalityCrashData_clean.csv")
