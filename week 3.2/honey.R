library(tidyverse)
library(xml2)
library(rvest)
library(stringr)
library(jiebaRD)
library(jiebaR)
library(tmcn)
library(lubridate)

honey<-data.frame()

for (id in 3:1) {
  prefix<-"https://www.ptt.cc/bbs/Gossiping/search?page="
  url<-paste0(prefix,as.character(id),"&q=%E8%9C%82%E8%9C%9C%E6%AA%B8%E6%AA%AC")
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
  
  honey<- rbind(honey,data.frame(title,date))
}
library(knitr)
kable(head(honey))

cutter<-worker("tag")
dic = c("蜂蜜檸檬")
new_user_word(cutter,dic)
a = sapply(dic,grepl,honey$title)
b = apply(a,1,any)
kable(head(honey[b,]))

data<- honey[b,]%>%
  mutate(date=as.character(date))%>%
  mutate(month=month(as.POSIXlt(date,format = "%m/%d")))%>%
  count(month)

p<-data
colnames(p)<-c("month","posts")
p$month<-c("2019.01","2019.02","2019.03","2019.04","2019.06","2018.11","2018.12")

ggplot(p,aes(x=month,y=posts))+
  geom_bar(stat = "identity")+
  ggtitle("蜂蜜檸檬爆紅")
