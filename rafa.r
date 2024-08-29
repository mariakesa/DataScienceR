
library(rafalib)
library(downloader)
library(ggplot2)

filename <- "femaleMiceWeights.csv"
dat <- read.csv(filename)
print(head(dat)) #In R Studio use View(dat)
print(dat)
library(dplyr) 
chow <- filter(dat, Diet=="chow") #keep only the ones with chow diet
hf <- filter(dat, Diet=="hf")
print(head(chow))
print(chow)
chowVals <- select(chow,Bodyweight)
hfVals <- select(hf,Bodyweight) 

# Add a group column to each dataset
chowVals <- chowVals %>% mutate(Group = "Chow")
print(chowVals)
hfVals <- hfVals %>% mutate(Group = "HF")

# Combine both datasets
df <- bind_rows(chowVals, hfVals)

# Create a histogram using ggplot2
ggplot(df, aes(x = Bodyweight, fill = Group)) +
  geom_histogram(binwidth = 1.5, color = "black", alpha = 0.7, position = "identity") +
  labs(x = "Bodyweight", y = "Frequency", title = "Histogram of Bodyweights for Chow and HF") +
  theme_minimal() +
  scale_fill_manual(values = c("Chow" = "blue", "HF" = "red"))

chowVals <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% mutate(Group = "Chow")
hfVals <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% mutate(Group = "HF")

ggplot(df, aes(x = Bodyweight, fill = Group)) +
  geom_histogram(binwidth = 1.5, color = "black", alpha = 0.7, position = "identity") +
  labs(x = "Bodyweight", y = "Frequency", title = "Histogram of Bodyweights for Chow and HF") +
  theme_minimal() +
  scale_fill_manual(values = c("Chow" = "blue", "HF" = "red"))

chowVals <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
chowVals
