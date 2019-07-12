test1 = read.csv("GitHub\\hw\\week 1.2\\weather_data_nyc_centralpark_2016(1).csv")
test2 = read.csv("GitHub\\hw\\week 1.2\\history_export_2018-11-08T20_48_56.csv")


dplyr::filter(test1, date == "1-1-2016")
merged_test = merge(test1,test2)
View(merged_test)
