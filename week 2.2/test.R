library(rvest)
library(xml2)

doc <- read_html("https://www.instagram.com/p/B0AfYGShUhI/")
doc %>% html_nodes(".title")
doc %>% html_nodes(".X7jCj span") %>% html_attr("href")
doc %>% html_nodes(".X7jCj span") %>% html_text()
i<- doc %>% html_nodes(".X7jCj span") %>% html_text()
