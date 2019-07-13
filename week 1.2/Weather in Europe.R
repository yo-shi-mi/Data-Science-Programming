t1 = read_html("https://www.accuweather.com/en/de/berlin/10178/july-weather/178087")

doc <- read_html("https://www.accuweather.com/en/de/berlin/10178/july-weather/178087")
doc %>% html_nodes(".large-temp")
doc %>% html_nodes(".large-temp") %>% html_text()
highest<- doc %>% html_nodes(".large-temp") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/de/berlin/10178/july-weather/178087")
doc %>% html_nodes(".small-temp")
doc %>% html_nodes(".small-temp") %>% html_text()
lowest<- doc %>% html_nodes(".small-temp") %>% html_text()

t = cbind(highest,lowest)
