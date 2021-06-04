install.packages("devtools")
library(devtools)
#install_github('dkahle/ggmap')
library('ggmap')
apikey= 'AIzaSyD2gUodnZWtOt7jEimuwuHyHQ2g9SgbXOE'
register_google(apikey)
ggDaegu <- get_googlemap('daegu', maptype = 'hybrid')
ggmap(ggDaegu)
library(readxl)
covide<-read.csv('res/covid.csv',header=T,sep='|',encoding = 'UTF-8')
View(covide)

write.csv(covide,'D:/MysecondRepository_20210402/python/info/Scovide.csv')
