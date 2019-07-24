library(tidyverse)
library(xml2)
library(rvest)
library(stringr)
library(jiebaRD)
library(jiebaR)
library(tmcn)
library(lubridate)

fatdaddy<- data.frame()
for (id in 3:1) {
  prefix<-"https://www.ptt.cc/bbs/Gossiping/search?page="
  url<-paste0(prefix,as.character(id),"&q=%E8%83%96%E8%80%81%E7%88%B9")
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

  fatdaddy<- rbind(fatdaddy,data.frame(title,date))
 }
# library(knitr)
# kable(head(fatdaddy))

cutter<-worker("tag")
dic = c("­D¦Ñ¯R")
new_user_word(cutter,dic)
a = sapply(dic,grepl,fatdaddy$title)
b = apply(a,1,any)
kable(head(fatdaddy[b,]))

data<- fatdaddy[b,]%>%
  mutate(date=as.character(date))%>%
  mutate(month=month(as.POSIXlt(date,format = "%m/%d")))%>%
  count(month)

p<-data
colnames(p)<-c("month","posts")

p$month<-c("2019.01","2019.02","2019.03","2019.04","2019.05","2019.06","2018.08","2018.09","2018.10","2018.11","2018.12")

ggplot(p,aes(x=month,y=posts))+
  geom_bar(stat = "identity")+
  ggtitle("­D¦Ñ¯R±Æ¶¤¼é")
