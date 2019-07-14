doc <- read_html("https://www.accuweather.com/en/de/berlin/10178/month/178087?monyr=6/01/2019")
doc %>% html_nodes(".actual .large-temp")
doc %>% html_nodes(".actual .large-temp") %>% html_text()
h.t.Berlin<- doc %>% html_nodes(".actual .large-temp") %>% html_text()


doc <- read_html("https://www.accuweather.com/en/de/berlin/10178/month/178087?monyr=6/01/2019")
doc %>% html_nodes(".small-temp")
doc %>% html_nodes(".small-temp") %>% html_text()
l.t.Berlin<- doc %>% html_nodes(".small-temp") %>% html_text()
l.t.Berlin<- substr(l.t.Berlin,2,4)


doc <- read_html("https://www.accuweather.com/en/de/berlin/10178/month/178087?monyr=6/01/2019")
doc %>% html_nodes(".date")
doc %>% html_nodes(".date") %>% html_text()
date<- doc %>% html_nodes(".date") %>% html_text()
date<- substr(date,4,8) 
date[7]<- " 6/01"
date[8]<- " 6/02"
date[9]<- " 6/03"
date[10]<- " 6/04"
date[11]<- " 6/05"
date[12]<- " 6/06"
date[13]<- " 6/07"
date[14]<- " 6/08"
date[15]<- " 6/09"

d = cbind(date,h.t.Berlin,l.t.Berlin)

doc <- read_html("https://www.accuweather.com/en/ca/ottawa/k1p/month/55487?monyr=6/01/2019")
doc %>% html_nodes(".date")
doc %>% html_nodes(".date") %>% html_text()
date<- doc %>% html_nodes(".date") %>% html_text()
date<- substr(date,4,8)
date[7]<- " 6/01"
date[8]<- " 6/02"
date[9]<- " 6/03"
date[10]<- " 6/04"
date[11]<- " 6/05"
date[12]<- " 6/06"
date[13]<- " 6/07"
date[14]<- " 6/08"
date[15]<- " 6/09"

doc <- read_html("https://www.accuweather.com/en/ca/ottawa/k1p/month/55487?monyr=6/01/2019")
doc %>% html_nodes(".actual .large-temp")
doc %>% html_nodes(".actual .large-temp") %>% html_text()
h.t.Ottawa<- doc %>% html_nodes(".actual .large-temp") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/ca/ottawa/k1p/month/55487?monyr=6/01/2019")
doc %>% html_nodes(".small-temp")
doc %>% html_nodes(".small-temp") %>% html_text()
l.t.Ottawa<- doc %>% html_nodes(".small-temp") %>% html_text()
l.t.Ottawa<- substr(l.t.Ottawa,2,4)

c = cbind(date,h.t.Ottawa,l.t.Ottawa)

doc <- read_html("https://www.accuweather.com/en/tw/taipei/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".date")
doc %>% html_nodes(".date") %>% html_text()
date<- doc %>% html_nodes(".date") %>% html_text()
date<- substr(date,4,8)
date[7]<- " 6/01"
date[8]<- " 6/02"
date[9]<- " 6/03"
date[10]<- " 6/04"
date[11]<- " 6/05"
date[12]<- " 6/06"
date[13]<- " 6/07"
date[14]<- " 6/08"
date[15]<- " 6/09"

doc <- read_html("https://www.accuweather.com/en/tw/taipei/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".actual .large-temp")
doc %>% html_nodes(".actual .large-temp") %>% html_text()
h.t.Taipei<- doc %>% html_nodes(".actual .large-temp") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/tw/taipei/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".small-temp")
doc %>% html_nodes(".small-temp") %>% html_text()
l.t.Taipei<- doc %>% html_nodes(".small-temp") %>% html_text()
l.t.Taipei<- substr(l.t.Taipei,2,4)

t = cbind(date,h.t.Taipei,l.t.Taipei)

doc <- read_html("https://www.accuweather.com/en/jp/tokyo/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".date")
doc %>% html_nodes(".date") %>% html_text()
date<- doc %>% html_nodes(".date") %>% html_text()
date<- substr(date,4,8)
date[7]<- " 6/01"
date[8]<- " 6/02"
date[9]<- " 6/03"
date[10]<- " 6/04"
date[11]<- " 6/05"
date[12]<- " 6/06"
date[13]<- " 6/07"
date[14]<- " 6/08"
date[15]<- " 6/09"

doc <- read_html("https://www.accuweather.com/en/jp/tokyo/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".actual .large-temp")
doc %>% html_nodes(".actual .large-temp") %>% html_text()
h.t.Tokyo<- doc %>% html_nodes(".actual .large-temp") %>% html_text()

doc <- read_html("https://www.accuweather.com/en/jp/tokyo/226396/month/226396?monyr=6/01/2019")
doc %>% html_nodes(".small-temp")
doc %>% html_nodes(".small-temp") %>% html_text()
l.t.Tokyo<- doc %>% html_nodes(".small-temp") %>% html_text()
l.t.Tokyo<- substr(l.t.Tokyo,2,4)

j = cbind(date,h.t.Tokyo,l.t.Tokyo)


merge(t, j, by = "date")
e = merge(t, j, by = "date")

merge(d, c, by = "date")
w = merge(d, c, by = "date")

merge(e, w, by = "date")
A = merge(e, w, by = "date")

