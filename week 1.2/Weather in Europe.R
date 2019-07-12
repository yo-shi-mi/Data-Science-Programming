read_html("https://www.accuweather.com/en/de/berlin/10178/july-weather/178087")

doc <- read_html("https://www.accuweather.com/en/de/berlin/10178/july-weather/178087")
doc %>% html_nodes(".temp span")
doc %>% html_nodes(".temp span") %>% html_text()
t <- doc %>% html_nodes(".temp span") %>% html_text()

t[2] <- substr(t[2], 11, 13)
