library(dplyr)

filename <- "femaleMiceWeights.csv" 
dat<-read.csv(filename)

View(dat)
#two basic commands: select and filter
controls <- filter(dat, Diet=="chow") #keep only the ones with chow diet
controls

View(controls)  

control_weights<-select(controls, Bodyweight) #keep only the Bodyweight column
control_weights
unlist(control_weights)
unlist(controls)

controls<-filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
controls

library(downloader)
library(ggplot2)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)
msleep <- read.csv(filename)
class(msleep)
colnames(msleep)
msleep%>%filter(order=="Primates")%>%class
msleep%>%filter(order=="Primates")%>%select(sleep_total)%>%class
msleep%>%filter(order=="Primates")%>%select(sleep_total)%>%unlist%>%mean
msleep%>%filter(order=="Primates")%>%summarise(mean_sleep=mean(sleep_total, na.rm=TRUE))


# Calculate mean sleep for each order and store in a list
mean_sleep_per_order <- msleep %>%
  group_by(order) %>%
  summarise(mean_sleep = mean(sleep_total, na.rm = TRUE))


 # Sort the data frame by mean_sleep
  mean_sleep_per_order <- mean_sleep_per_order %>%
    arrange(mean_sleep)
  ?arrange
  # Create cumulative distribution values
  mean_sleep_per_order$cdf <- cumsum(mean_sleep_per_order$mean_sleep) / sum(mean_sleep_per_order$mean_sleep)
  
  # Plot the cumulative distribution
  ggplot(mean_sleep_per_order, aes(x = mean_sleep, y = cdf)) +
    geom_line(color = "blue", size = 1) +
    geom_point(color = "red") +
    theme_minimal() +
    labs(title = "Cumulative Distribution of Average Sleep per Order",
         x = "Average Sleep (hours)",
         y = "Cumulative Distribution") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

# Calculate mean sleep for each order and store in a named list
mean_sleep_per_order <- msleep %>%
  group_by(order) %>%
  summarise(mean_sleep = mean(sleep_total, na.rm = TRUE)) %>%
  { setNames(.$mean_sleep, .$order) }

# Print the results
mean_sleep_per_order
?setNames
