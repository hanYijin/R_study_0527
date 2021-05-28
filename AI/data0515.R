library(devtools)
#install_github('dkahle/ggmap')
library(ggmap)

apikey = 'AIzaSyD7gpTZYkQdVsLaSKNpS-70gGN0IYIYlck'

register_google(apikey)
ggDaegu <- get_googlemap('daegu', maptype='hybrid')
ggmap(ggDaegu)
