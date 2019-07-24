library(tidyverse)
library(xml2)
library(rvest)
library(stringr)
library(jiebaRD)
library(jiebaR)
library(tmcn)
library(lubridate)

iran<-data.frame()

for (id in 4:1) {
  prefix<-"https://www.ptt.cc/bbs/Gossiping/search?page="
  url<-paste0(prefix,as.character(id),"&q=%E4%B8%80%E8%98%AD")
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
  
  iran<- rbind(iran,data.frame(title,date))
  ichiran<-iran[-12,] 
}
library(knitr)
kable(head(ichiran))

cutter<-worker("tag")
dic = c("一蘭")
new_user_word(cutter,dic)
a = sapply(dic,grepl,ichiran$title)
b = apply(a,1,any)
kable(head(ichiran[b,]))

data<- ichiran[b,]%>%
  mutate(date=as.character(date))%>%
  mutate(month=month(as.POSIXlt(date,format = "%m/%d")))%>%
  count(month)

p<-data
colnames(p)<-c("month","posts")
p$month<-c("2019.01","2019.02","2019.03","2019.04","2019.05","2019.06","2019.07","2018.08","2018.09","2018.10","2018.11","2018.12")

ggplot(p,aes(x=month,y=posts))+
  geom_bar(stat = "identity")+
  ggtitle("一蘭拉麵剛開幕排隊超過一小時!?")