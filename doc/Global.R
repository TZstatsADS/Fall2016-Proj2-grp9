library(httr)
library(ggplot2)
library(ggmap)
library(leaflet)
library(devtools)
library(taRifx)
library(sp)
library(plyr)
library(reshape2)
library(taRifx.geo)
library(shiny)
library(RCurl)
library(RJSONIO)
library(dplyr)
library(stringr)
#Input Data
data_6am_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/6am.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_6am_whole$data$stations[[i]]$station_id
  vector2[i] <- data_6am_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_6am_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_6am_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_6am_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_6am_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_6am_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_6am_whole$data$stations[[i]]$is_returning
}
data_6am <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_6am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_6am_whole)

data_7am_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/7am.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_7am_whole$data$stations[[i]]$station_id
  vector2[i] <- data_7am_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_7am_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_7am_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_7am_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_7am_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_7am_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_7am_whole$data$stations[[i]]$is_returning
}
data_7am <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_7am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_7am_whole)


data_8am_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/8am.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_8am_whole$data$stations[[i]]$station_id
  vector2[i] <- data_8am_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_8am_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_8am_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_8am_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_8am_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_8am_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_8am_whole$data$stations[[i]]$is_returning
}
data_8am <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_8am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_8am_whole)

data_9am_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/9am.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_9am_whole$data$stations[[i]]$station_id
  vector2[i] <- data_9am_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_9am_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_9am_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_9am_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_9am_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_9am_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_9am_whole$data$stations[[i]]$is_returning
}
data_9am <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_9am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_9am_whole)

data_10am_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/10am.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_10am_whole$data$stations[[i]]$station_id
  vector2[i] <- data_10am_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_10am_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_10am_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_10am_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_10am_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_10am_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_10am_whole$data$stations[[i]]$is_returning
}
data_10am <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_10am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_10am_whole)

data_11am_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/11am.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_11am_whole$data$stations[[i]]$station_id
  vector2[i] <- data_11am_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_11am_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_11am_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_11am_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_11am_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_11am_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_11am_whole$data$stations[[i]]$is_returning
}
data_11am <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_11am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_11am_whole)

data_12pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/12pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_12pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_12pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_12pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_12pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_12pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_12pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_12pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_12pm_whole$data$stations[[i]]$is_returning
}
data_12pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_12pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_12pm_whole)

data_1pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/1pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_1pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_1pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_1pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_1pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_1pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_1pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_1pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_1pm_whole$data$stations[[i]]$is_returning
}
data_1pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_1pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_1pm_whole)

data_2pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/2pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_2pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_2pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_2pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_2pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_2pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_2pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_2pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_2pm_whole$data$stations[[i]]$is_returning
}
data_2pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_2pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_2pm_whole)

data_3pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/3pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_3pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_3pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_3pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_3pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_3pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_3pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_3pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_3pm_whole$data$stations[[i]]$is_returning
}
data_3pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_3pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_3pm_whole)

data_4pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/4pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_4pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_4pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_4pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_4pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_4pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_4pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_4pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_4pm_whole$data$stations[[i]]$is_returning
}
data_4pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_4pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_4pm_whole)

data_5pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/5pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_5pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_5pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_5pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_5pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_5pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_5pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_5pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_5pm_whole$data$stations[[i]]$is_returning
}
data_5pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_5pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_5pm_whole)

data_6pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/6pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_6pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_6pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_6pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_6pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_6pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_6pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_6pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_6pm_whole$data$stations[[i]]$is_returning
}
data_6pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_6pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_6pm_whole)

data_7pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/7pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_7pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_7pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_7pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_7pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_7pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_7pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_7pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_7pm_whole$data$stations[[i]]$is_returning
}
data_7pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_7pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_7pm_whole)

data_8pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/8pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_8pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_8pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_8pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_8pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_8pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_8pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_8pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_8pm_whole$data$stations[[i]]$is_returning
}
data_8pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_8pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_8pm_whole)

data_9pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/9pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_9pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_9pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_9pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_9pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_9pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_9pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_9pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_9pm_whole$data$stations[[i]]$is_returning
}
data_9pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_9pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_9pm_whole)

data_10pm_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/10pm.RData")
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)
vector5 <- vector(length = 664)
vector6 <- vector(length = 664)
vector7 <- vector(length = 664)
vector8 <- vector(length = 664)
for (i in 1:664){
  vector1[i] <- data_10pm_whole$data$stations[[i]]$station_id
  vector2[i] <- data_10pm_whole$data$stations[[i]]$num_bikes_available
  vector3[i] <- data_10pm_whole$data$stations[[i]]$num_bikes_disabled
  vector4[i] <- data_10pm_whole$data$stations[[i]]$num_docks_available
  vector5[i] <- data_10pm_whole$data$stations[[i]]$num_docks_disabled
  vector6[i] <- data_10pm_whole$data$stations[[i]]$is_installed
  vector7[i] <- data_10pm_whole$data$stations[[i]]$is_renting
  vector8[i] <- data_10pm_whole$data$stations[[i]]$is_returning
}
data_10pm <- data.frame(vector1, vector2, vector3, vector4, vector5, vector6, vector7, vector8, row.names = c(1:664))
colnames(data_10pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)
rm(vector5)
rm(vector6)
rm(vector7)
rm(vector8)
rm(data_10pm_whole)

data_Time <- vector("list", length = 17)
data_Time[[1]] <- data_6am
data_Time[[2]] <- data_7am
data_Time[[3]] <- data_8am
data_Time[[4]] <- data_9am
data_Time[[5]] <- data_10am
data_Time[[6]] <- data_11am
data_Time[[7]] <- data_12pm
data_Time[[8]] <- data_1pm
data_Time[[9]] <- data_2pm
data_Time[[10]] <- data_3pm
data_Time[[11]] <- data_4pm
data_Time[[12]] <- data_5pm
data_Time[[13]] <- data_6pm
data_Time[[14]] <- data_7pm
data_Time[[15]] <- data_8pm
data_Time[[16]] <- data_9pm
data_Time[[17]] <- data_10pm


data_information_whole <- readRDS("C:/Users/Owner/Desktop/ADS/Project2/info.RData")
#data_information <- matrix(0,nrow = 664, ncol = 4)
vector1 <- vector(length = 664)
vector2 <- vector(length = 664)
vector3 <- vector(length = 664)
vector4 <- vector(length = 664)

for (i in 1:664){
  vector1[i] <- data_information_whole$data$stations[[i]]$station_id
  vector2[i] <- data_information_whole$data$stations[[i]]$name
  vector3[i] <- data_information_whole$data$stations[[i]]$lat
  vector4[i] <- data_information_whole$data$stations[[i]]$lon
}
data_information <- data.frame(vector1, vector2, vector3, vector4, row.names = c(1:664))
colnames(data_information) = c("Station_NO.", "Station_Name", "Latitude", "longitude")
rm(data_information_whole)
rm(i)
rm(vector1)
rm(vector2)
rm(vector3)
rm(vector4)


#Station info#
slon <- data_information$longitude
slat <- data_information$Latitude
sname<-data_information$Station_Name
position<-data.frame(slon,slat)


#Api_key#
Api_key<-"AIzaSyA0UYIWqZLCE-IBl5x1mrhZJ8wdRh5yVcM"

#Bikeicon1#
Bikeicons1<-
  icons(
    iconUrl="C:/Users/Owner/Desktop/ADS/Project2/No.png",
    iconWidth=20,iconHeight=20)


#Bikeicon2#
Bikeicons2<-
  icons(
    iconUrl="C:/Users/Owner/Desktop/ADS/Project2/092-512.png",
    iconWidth=20,iconHeight=20)


#Create Function
library(RCurl)
library(RJSONIO)
library(dplyr)
library(stringr)
library(ggmap)
library(taRifx.geo)



# Data cleaning to get rid of records with no geo info

############### Code ##############

# Import toilet data (pt is short for public toilet)

decodeLine <- function(encoded){
  require(bitops)
  
  vlen <- nchar(encoded)
  vindex <- 0
  varray <- NULL
  vlat <- 0
  vlng <- 0
  
  while(vindex < vlen){
    vb <- NULL
    vshift <- 0
    vresult <- 0
    repeat{
      if(vindex + 1 <= vlen){
        vindex <- vindex + 1
        vb <- as.integer(charToRaw(substr(encoded, vindex, vindex))) - 63  
      }
      
      vresult <- bitOr(vresult, bitShiftL(bitAnd(vb, 31), vshift))
      vshift <- vshift + 5
      # print(vb)
      if(vb < 32) break
    }
    
    dlat <- ifelse(
      bitAnd(vresult, 1)
      , -(bitShiftR(vresult, 1)+1)
      , bitShiftR(vresult, 1)
    )
    vlat <- vlat + dlat
    
    vshift <- 0
    vresult <- 0
    repeat{
      if(vindex + 1 <= vlen) {
        vindex <- vindex+1
        vb <- as.integer(charToRaw(substr(encoded, vindex, vindex))) - 63        
      }
      
      vresult <- bitOr(vresult, bitShiftL(bitAnd(vb, 31), vshift))
      vshift <- vshift + 5
      if(vb < 32) break
    }
    
    dlng <- ifelse(
      bitAnd(vresult, 1)
      , -(bitShiftR(vresult, 1)+1)
      , bitShiftR(vresult, 1)
    )
    vlng <- vlng + dlng
    
    varray <- rbind(varray, c(vlat * 1e-5, vlng * 1e-5))
  }
  coords <- data.frame(varray)
  names(coords) <- c("lat", "lon")
  coords
}






url2 <- function(ori_lat,ori_lng,des_lat,des_lng,return.call = "json", sensor = "false") {
  root <- "http://maps.google.com/maps/api/directions/"
  u <- paste(root, return.call, "?origin=", ori_lat,"+",ori_lng,"&destination=",des_lat,"+",des_lng,"&sensor=", sensor, sep = "")
  return(URLencode(u))
}

geoRoute <- function(ori_lat,ori_lng,des_lat,des_lng) {
  #if(verbose) cat(address,"\n")
  u <- url2(ori_lat,ori_lng,des_lat,des_lng)
  doc <- getURL(u)
  x <- fromJSON(doc,simplify = FALSE)
  if(x$status=="OK") {
    route <- x$route[[1]]$overview_polyline$points
    return(route)
    Sys.sleep(0.5)
  } else {
    return(NA)
  }
}

Nearest3<-function(xlat,xlon,slat,slon,nuba,nuda)
{ 
  distance<-vector(length=length(slat))
  for(i in 1:length(slat))
  { if((nuba[i]!=0)&(nuda[i]!=0))
  {distance[i]<-sqrt((xlat-slat[i])^2+(xlon-slon[i])^2)}
    else
    {distance[i]<-1000000}}
  rdis<-rank(distance)
  p1<-c(slat[rdis==1],slon[rdis==1],nuba[rdis==1],nuda[rdis==1])
  p2<-c(slat[rdis==2],slon[rdis==2],nuba[rdis==2],nuda[rdis==2])
  p3<-c(slat[rdis==3],slon[rdis==3],nuba[rdis==3],nuda[rdis==3])
  return(list(p1=p1,p2=p2,p3=p3))
}
