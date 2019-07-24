library(httr)
library(tm)
library(rvest)
library(xml2)
library(NLP)
library(tmcn)
library(jiebaR)
library(jiebaRD)
library(stringr)

g<- data.frame()
for (id in 1:3) {
  url<-paste0("https://www.ptt.cc/bbs/Gossiping/search?page=",as.character(id),"&q=胖老爹")
  f<-read_html(url)
  title<- f%>%
    html_nodes(".title")%>%
    html_text()
  date<-f%>%
    html_nodes(".title a")%>%
    html_text()
  g <- rbind(g,data.frame(title,date))
}
library(knitr)
kable(head(g))
