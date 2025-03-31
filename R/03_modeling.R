# -----------------------------
# Step 3: Modeling
# Includes:
# 1. Clustering of states
# 2. Correlation matrix
# 3. Linear regression
# -----------------------------

# Load libraries
library(tidyverse)
library(ggcorrplot)

# Load cleaned dataset
data_clean <- read_csv("data/FatalityCrashData_clean.csv")

# PART 1: K-MEANS CLUSTERING OF STATES

# 1.1. Group by state and calculate features
state_summary <- data_clean %>%
  group_by(StateName) %>%
  summarise(
    Total_Crashes = n(),
    Total_Fatalities = sum(Fatals),
    Avg_Persons = mean(Persons),
    Avg_Vehicles = mean(TotalVehicles)
  )

# 1.2. Scale features
state_scaled <- state_summary %>%
  select(-StateName) %>%
  scale()

# 1.3. Run K-means clustering
set.seed(42)
kmeans_model <- kmeans(state_scaled, centers = 3, nstart = 25)

# 1.4. Add cluster label back to summary
state_summary$Cluster <- as.factor(kmeans_model$cluster)

# 1.5. Plot clustering result
ggplot(state_summary, aes(x = Total_Crashes, y = Total_Fatalities, color = Cluster)) +
  geom_point(size = 4, alpha = 0.7) +
  labs(title = "Clustering of States Based on Fatal Crash Statistics",
       x = "Total Crashes (2015–2022)",
       y = "Total Fatalities") +
  theme_minimal()
ggsave("images/state_clustering.png", width = 10, height = 6)

#  PART 2: CORRELATION MATRIX

# 2.1. Select numeric variables
numeric_vars <- data_clean %>%
  select(Fatals, Persons, Peds, TotalVehicles)

# 2.2. Compute correlation matrix
cor_matrix <- cor(numeric_vars)

# 2.3. Plot and save correlation heatmap
ggcorrplot(cor_matrix, 
           method = "circle", 
           type = "lower", 
           lab = TRUE,
           title = "Correlation Matrix: Fatalities vs. Crash Factors")
ggsave("images/correlation_matrix.png", width = 7, height = 6)

# PART 3: LINEAR REGRESSION

# 3.1. Build model to predict fatalities
model <- lm(Fatals ~ Persons + Peds + TotalVehicles, data = data_clean)

# 3.2. Print model summary
summary(model)

# 3.3. Predict and compare
data_clean$Predicted_Fatals <- predict(model)

# 3.4. Plot actual vs predicted
ggplot(data_clean, aes(x = Fatals, y = Predicted_Fatals)) +
  geom_point(alpha = 0.3, color = "blue") +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
  labs(title = "Actual vs Predicted Fatalities",
       x = "Actual Fatalities", y = "Predicted Fatalities")
ggsave("images/actual_vs_predicted_fatals.png", width = 8, height = 5)
