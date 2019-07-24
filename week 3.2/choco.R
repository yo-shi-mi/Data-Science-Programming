library(tidyverse)
library(xml2)
library(rvest)
library(stringr)
library(jiebaRD)
library(jiebaR)
library(tmcn)
library(lubridate)

choco<-data.frame()

for (id in 3:1) {
  prefix<-"https://www.ptt.cc/bbs/Gossiping/search?page="
  url<-paste0(prefix,as.character(id),"&q=%E9%AB%92%E9%AB%92%E5%8C%85")
  session<-html_session(url = url)
  form<-session %>% html_node("form") %>% html_form()
  form
  
  gossiping<-submit_form(
    session = session,
    form = form,
    submit = "yes"
  )
  
  ptt<-read_html(gossiping)
  title<-ptt%>%html_nodes(".title a")%>%html_text()
  date<-ptt%>%html_nodes(".date")%>%html_text()
  
  choco<- rbind(choco,data.frame(title,date))
}
library(knitr)
kable(head(choco))

cutter<-worker("tag")
dic = c("髒髒包")
new_user_word(cutter,dic)
a = sapply(dic,grepl,choco$title)
b = apply(a,1,any)
kable(head(choco[b,]))

data<- choco[b,]%>%
  mutate(date=as.character(date))%>%
  mutate(month=month(as.POSIXlt(date,format = "%m/%d")))%>%
  count(month)

p<-data
colnames(p)<-c("month","posts")
p$month<-c("2019.01","2019.02","2019.05","2019.07","2018.12")

ggplot(p,aes(x=month,y=posts))+
  geom_bar(stat = "identity")+
  ggtitle("髒髒包正夯")
