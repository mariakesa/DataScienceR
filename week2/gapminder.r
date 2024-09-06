install.packages("gapminder")
library(gapminder)
data(gapminder)
head(gapminder)

x<-filter(gapminder,year==1952)%>%dplyr::select(country,lifeExp)
x
x[,2]
hist(x[,2],breaks=5)
length(x[,2]%>%unlist)
mean(40>=x[,2])
x<-filter(gapminder,year==1952)%>%dplyr::select(lifeExp)%>%unlist
prop = function(q) {
  mean(x <= q)
}
prop(40)

qs = seq(from=min(x), to=max(x), length=20)
qs

props = sapply(qs, prop)
props

plot(qs, props)

props = sapply(qs, function(q) mean(x <= q))
warnings()
plot(qs, props)

plot(ecdf(x))
