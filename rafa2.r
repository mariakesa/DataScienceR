library(ggplot2)
data(msleep)
class(msleep)
print(head(msleep))
ggplot(msleep, aes(x = bodywt, y = sleep_total)) +
  geom_point() +
  labs(x = "Body weight (kg)", y = "Total sleep (hours)", title = "Body weight vs. Total sleep") +
  theme_minimal()
geni<-msleep %>% select(genus)%>%distinct()%>%unlist
print(geni)
orders<-msleep %>% select(order)%>%distinct()%>%unlist
print(orders)
primates<-msleep %>% filter(order=="Primates")
print(primates)
print(nrow(primates))
print(class(primates))
print(head(primates))
primate_sleep<-primates%>%select(sleep_total)%>%unlist%>%mean
#print(mean(primate_sleep))
primate_sleep
primate_sleep_sum <- msleep %>% 
  filter(order == "Primates") %>% 
  summarise(total_sleep = mean(sleep_total, na.rm = TRUE))

primate_sleep_sum


