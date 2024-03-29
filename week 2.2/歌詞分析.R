library(readr)
library(magrittr)
library(jiebaR)
library(readxl)
library(dplyr)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)
Sys.setlocale(category = "LC_ALL",locale = "cht")
cc=worker()
text<- "四季來臨 又離開我身邊
我將我的冬天 和我的夏天給了你
我會送那曾經是全世界的你離開的
我是真的愛過你嗎?
直到何時才是春天呢
沒錯 那時我們彼此有段時間
就像是莎士比亞的話劇般
就如同將會成為最後的愛情相視般
除了我們倆之外什麼都看不到吧
我想看看其他事物
I gave you the world
I gave you the world
只有你是我的一切
我給了你我的冬天 又給了我的夏天吧
在那炙熱又冰冷的季節裡
我是真的愛過你嗎?
我愛過你嗎?
曾經彼此思念
又對彼此感到厭倦吧
在那些漫長的白天和夜晚
老舊生鏽之前
我們再次閃耀吧
季節又會再次改變不是嗎
I gave you the world
I gave you the world
只有你是我的一切
我給了你我的冬天 又給了我的夏天吧
在那炙熱又冰冷的季節裡
我是真的愛過你嗎?
我愛過你嗎?
走也好 在回頭看時沒有我
我們曾相當美好
只要這樣就好了 離開時
四季來臨 又離開我身邊
我將我的冬天 和我的夏天給了你
我會送那曾經是全世界的你離開的
我是真的愛過你嗎?
我愛過你嗎?
我愛過你嗎?"
f<-table(cc[text])
data.frame(f)
#head(f[order(data.frame(f)$Freq,decreasing = TRUE)])
s<-filter(data.frame(f),Freq > 2 )
ggplot(data.frame(s), aes(x =Var1, y =Freq,fill_time)) +
  geom_bar(stat = "identity") 

wordcloud(s$Var1,s$Freq,random.order = F, ordered.colors = F,colors = rainbow(1000))