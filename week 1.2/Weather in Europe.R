doc <- read_html("https://www.accuweather.com/en/de/berlin/10178/month/178087?monyr=6/01/2019")
doc %>% html_nodes(".actual .large-temp")
doc %>% html_nodes(".actual .large-temp") %>% html_text()
highest<- doc %>% html_nodes(".large-temp") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/de/berlin/10178/month/178087?monyr=6/01/2019")
doc %>% html_nodes(".small-temp")
doc %>% html_nodes(".small-temp") %>% html_text()
lowest<- doc %>% html_nodes(".small-temp") %>% html_text()
lowest<- substr(lowest,2,4)
View(lowest)
doc <- read_html("https://www.accuweather.com/en/de/berlin/10178/month/178087?monyr=6/01/2019")
doc %>% html_nodes(".date")
doc %>% html_nodes(".date") %>% html_text()
date<- doc %>% html_nodes(".date") %>% html_text()


d = cbind(date,highest,lowest)

doc <- read_html("https://www.accuweather.com/en/us/new-york-ny/10007/month/349727?monyr=6/01/2019")
doc %>% html_nodes(".date")
doc %>% html_nodes(".date") %>% html_text()
date<- doc %>% html_nodes(".date") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/us/new-york-ny/10007/month/349727?monyr=6/01/2019")
doc %>% html_nodes(".actual .large-temp")
doc %>% html_nodes(".actual .large-temp") %>% html_text()
highest<- doc %>% html_nodes(".large-temp") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/us/new-york-ny/10007/month/349727?monyr=6/01/2019")
doc %>% html_nodes(".small-temp")
doc %>% html_nodes(".small-temp") %>% html_text()
lowest<- doc %>% html_nodes(".small-temp") %>% html_text()
lowest<- substr(lowest,2,4)

n = cbind(date,highest,lowest)

doc <- read_html("https://www.accuweather.com/en/tw/taipei/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".date")
doc %>% html_nodes(".date") %>% html_text()
date<- doc %>% html_nodes(".date") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/tw/taipei/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".actual .large-temp")
doc %>% html_nodes(".actual .large-temp") %>% html_text()
highest<- doc %>% html_nodes(".actual .large-temp") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/tw/taipei/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".small-temp")
doc %>% html_nodes(".small-temp") %>% html_text()
lowest<- doc %>% html_nodes(".small-temp") %>% html_text()
lowest<- substr(lowest,2,4)

t = cbind(date,highest,lowest)

doc <- read_html("https://www.accuweather.com/en/jp/tokyo/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".date")
doc %>% html_nodes(".date") %>% html_text()
date<- doc %>% html_nodes(".date") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/jp/tokyo/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".actual .large-temp")
doc %>% html_nodes(".actual .large-temp") %>% html_text()
highest<- doc %>% html_nodes(".actual .large-temp") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/jp/tokyo/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".small-temp")
doc %>% html_nodes(".small-temp") %>% html_text()
lowest<- doc %>% html_nodes(".small-temp") %>% html_text()
lowest<- substr(lowest,2,4)

j = cbind(date,highest,lowest)

View(d)
