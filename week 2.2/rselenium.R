library(RSelenium)
rs.test<- remoteDriver(remoteServerAddr = "localhost",port=4444,browserName = "chrome")
rs.test$open()
