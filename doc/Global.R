#Input Data
data_6am_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/6am.RData")
data_6am <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_6am[i, 1] <- data_6am_whole$data$stations[[i]]$station_id
  data_6am[i, 2] <- data_6am_whole$data$stations[[i]]$num_bikes_available
  data_6am[i, 3] <- data_6am_whole$data$stations[[i]]$num_bikes_disabled
  data_6am[i, 4] <- data_6am_whole$data$stations[[i]]$num_docks_available
  data_6am[i, 5] <- data_6am_whole$data$stations[[i]]$num_docks_disabled
  data_6am[i, 6] <- data_6am_whole$data$stations[[i]]$is_installed
  data_6am[i, 7] <- data_6am_whole$data$stations[[i]]$is_renting
  data_6am[i, 8] <- data_6am_whole$data$stations[[i]]$is_returning
}
data_6am <- data.frame(data_6am, row.names = c(1:664))
colnames(data_6am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_7am_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/7am.RData")
data_7am <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_7am[i, 1] <- data_7am_whole$data$stations[[i]]$station_id
  data_7am[i, 2] <- data_7am_whole$data$stations[[i]]$num_bikes_available
  data_7am[i, 3] <- data_7am_whole$data$stations[[i]]$num_bikes_disabled
  data_7am[i, 4] <- data_7am_whole$data$stations[[i]]$num_docks_available
  data_7am[i, 5] <- data_7am_whole$data$stations[[i]]$num_docks_disabled
  data_7am[i, 6] <- data_7am_whole$data$stations[[i]]$is_installed
  data_7am[i, 7] <- data_7am_whole$data$stations[[i]]$is_renting
  data_7am[i, 8] <- data_7am_whole$data$stations[[i]]$is_returning
}
data_7am <- data.frame(data_7am, row.names = c(1:664))
colnames(data_7am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_8am_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/8am.RData")
data_8am <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_8am[i, 1] <- data_8am_whole$data$stations[[i]]$station_id
  data_8am[i, 2] <- data_8am_whole$data$stations[[i]]$num_bikes_available
  data_8am[i, 3] <- data_8am_whole$data$stations[[i]]$num_bikes_disabled
  data_8am[i, 4] <- data_8am_whole$data$stations[[i]]$num_docks_available
  data_8am[i, 5] <- data_8am_whole$data$stations[[i]]$num_docks_disabled
  data_8am[i, 6] <- data_8am_whole$data$stations[[i]]$is_installed
  data_8am[i, 7] <- data_8am_whole$data$stations[[i]]$is_renting
  data_8am[i, 8] <- data_8am_whole$data$stations[[i]]$is_returning
}
data_8am <- data.frame(data_8am, row.names = c(1:664))
colnames(data_8am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_9am_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/9am.RData")
data_9am <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_9am[i, 1] <- data_9am_whole$data$stations[[i]]$station_id
  data_9am[i, 2] <- data_9am_whole$data$stations[[i]]$num_bikes_available
  data_9am[i, 3] <- data_9am_whole$data$stations[[i]]$num_bikes_disabled
  data_9am[i, 4] <- data_9am_whole$data$stations[[i]]$num_docks_available
  data_9am[i, 5] <- data_9am_whole$data$stations[[i]]$num_docks_disabled
  data_9am[i, 6] <- data_9am_whole$data$stations[[i]]$is_installed
  data_9am[i, 7] <- data_9am_whole$data$stations[[i]]$is_renting
  data_9am[i, 8] <- data_9am_whole$data$stations[[i]]$is_returning
}
data_9am <- data.frame(data_9am, row.names = c(1:664))
colnames(data_9am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_10am_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/10am.RData")
data_10am <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_10am[i, 1] <- data_10am_whole$data$stations[[i]]$station_id
  data_10am[i, 2] <- data_10am_whole$data$stations[[i]]$num_bikes_available
  data_10am[i, 3] <- data_10am_whole$data$stations[[i]]$num_bikes_disabled
  data_10am[i, 4] <- data_10am_whole$data$stations[[i]]$num_docks_available
  data_10am[i, 5] <- data_10am_whole$data$stations[[i]]$num_docks_disabled
  data_10am[i, 6] <- data_10am_whole$data$stations[[i]]$is_installed
  data_10am[i, 7] <- data_10am_whole$data$stations[[i]]$is_renting
  data_10am[i, 8] <- data_10am_whole$data$stations[[i]]$is_returning
}
data_10am <- data.frame(data_10am, row.names = c(1:664))
colnames(data_10am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_11am_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/11am.RData")
data_11am <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_11am[i, 1] <- data_11am_whole$data$stations[[i]]$station_id
  data_11am[i, 2] <- data_11am_whole$data$stations[[i]]$num_bikes_available
  data_11am[i, 3] <- data_11am_whole$data$stations[[i]]$num_bikes_disabled
  data_11am[i, 4] <- data_11am_whole$data$stations[[i]]$num_docks_available
  data_11am[i, 5] <- data_11am_whole$data$stations[[i]]$num_docks_disabled
  data_11am[i, 6] <- data_11am_whole$data$stations[[i]]$is_installed
  data_11am[i, 7] <- data_11am_whole$data$stations[[i]]$is_renting
  data_11am[i, 8] <- data_11am_whole$data$stations[[i]]$is_returning
}
data_11am <- data.frame(data_11am, row.names = c(1:664))
colnames(data_11am) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_12pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/12pm.RData")
data_12pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_12pm[i, 1] <- data_12pm_whole$data$stations[[i]]$station_id
  data_12pm[i, 2] <- data_12pm_whole$data$stations[[i]]$num_bikes_available
  data_12pm[i, 3] <- data_12pm_whole$data$stations[[i]]$num_bikes_disabled
  data_12pm[i, 4] <- data_12pm_whole$data$stations[[i]]$num_docks_available
  data_12pm[i, 5] <- data_12pm_whole$data$stations[[i]]$num_docks_disabled
  data_12pm[i, 6] <- data_12pm_whole$data$stations[[i]]$is_installed
  data_12pm[i, 7] <- data_12pm_whole$data$stations[[i]]$is_renting
  data_12pm[i, 8] <- data_12pm_whole$data$stations[[i]]$is_returning
}
data_12pm <- data.frame(data_12pm, row.names = c(1:664))
colnames(data_12pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_1pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/1pm.RData")
data_1pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_1pm[i, 1] <- data_1pm_whole$data$stations[[i]]$station_id
  data_1pm[i, 2] <- data_1pm_whole$data$stations[[i]]$num_bikes_available
  data_1pm[i, 3] <- data_1pm_whole$data$stations[[i]]$num_bikes_disabled
  data_1pm[i, 4] <- data_1pm_whole$data$stations[[i]]$num_docks_available
  data_1pm[i, 5] <- data_1pm_whole$data$stations[[i]]$num_docks_disabled
  data_1pm[i, 6] <- data_1pm_whole$data$stations[[i]]$is_installed
  data_1pm[i, 7] <- data_1pm_whole$data$stations[[i]]$is_renting
  data_1pm[i, 8] <- data_1pm_whole$data$stations[[i]]$is_returning
}
data_1pm <- data.frame(data_1pm, row.names = c(1:664))
colnames(data_1pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_2pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/2pm.RData")
data_2pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_2pm[i, 1] <- data_2pm_whole$data$stations[[i]]$station_id
  data_2pm[i, 2] <- data_2pm_whole$data$stations[[i]]$num_bikes_available
  data_2pm[i, 3] <- data_2pm_whole$data$stations[[i]]$num_bikes_disabled
  data_2pm[i, 4] <- data_2pm_whole$data$stations[[i]]$num_docks_available
  data_2pm[i, 5] <- data_2pm_whole$data$stations[[i]]$num_docks_disabled
  data_2pm[i, 6] <- data_2pm_whole$data$stations[[i]]$is_installed
  data_2pm[i, 7] <- data_2pm_whole$data$stations[[i]]$is_renting
  data_2pm[i, 8] <- data_2pm_whole$data$stations[[i]]$is_returning
}
data_2pm <- data.frame(data_2pm, row.names = c(1:664))
colnames(data_2pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_3pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/3pm.RData")
data_3pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_3pm[i, 1] <- data_3pm_whole$data$stations[[i]]$station_id
  data_3pm[i, 2] <- data_3pm_whole$data$stations[[i]]$num_bikes_available
  data_3pm[i, 3] <- data_3pm_whole$data$stations[[i]]$num_bikes_disabled
  data_3pm[i, 4] <- data_3pm_whole$data$stations[[i]]$num_docks_available
  data_3pm[i, 5] <- data_3pm_whole$data$stations[[i]]$num_docks_disabled
  data_3pm[i, 6] <- data_3pm_whole$data$stations[[i]]$is_installed
  data_3pm[i, 7] <- data_3pm_whole$data$stations[[i]]$is_renting
  data_3pm[i, 8] <- data_3pm_whole$data$stations[[i]]$is_returning
}
data_3pm <- data.frame(data_3pm, row.names = c(1:664))
colnames(data_3pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_4pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/4pm.RData")
data_4pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_4pm[i, 1] <- data_4pm_whole$data$stations[[i]]$station_id
  data_4pm[i, 2] <- data_4pm_whole$data$stations[[i]]$num_bikes_available
  data_4pm[i, 3] <- data_4pm_whole$data$stations[[i]]$num_bikes_disabled
  data_4pm[i, 4] <- data_4pm_whole$data$stations[[i]]$num_docks_available
  data_4pm[i, 5] <- data_4pm_whole$data$stations[[i]]$num_docks_disabled
  data_4pm[i, 6] <- data_4pm_whole$data$stations[[i]]$is_installed
  data_4pm[i, 7] <- data_4pm_whole$data$stations[[i]]$is_renting
  data_4pm[i, 8] <- data_4pm_whole$data$stations[[i]]$is_returning
}
data_4pm <- data.frame(data_4pm, row.names = c(1:664))
colnames(data_4pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_5pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/5pm.RData")
data_5pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_5pm[i, 1] <- data_5pm_whole$data$stations[[i]]$station_id
  data_5pm[i, 2] <- data_5pm_whole$data$stations[[i]]$num_bikes_available
  data_5pm[i, 3] <- data_5pm_whole$data$stations[[i]]$num_bikes_disabled
  data_5pm[i, 4] <- data_5pm_whole$data$stations[[i]]$num_docks_available
  data_5pm[i, 5] <- data_5pm_whole$data$stations[[i]]$num_docks_disabled
  data_5pm[i, 6] <- data_5pm_whole$data$stations[[i]]$is_installed
  data_5pm[i, 7] <- data_5pm_whole$data$stations[[i]]$is_renting
  data_5pm[i, 8] <- data_5pm_whole$data$stations[[i]]$is_returning
}
data_5pm <- data.frame(data_5pm, row.names = c(1:664))
colnames(data_5pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_6pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/6pm.RData")
data_6pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_6pm[i, 1] <- data_6pm_whole$data$stations[[i]]$station_id
  data_6pm[i, 2] <- data_6pm_whole$data$stations[[i]]$num_bikes_available
  data_6pm[i, 3] <- data_6pm_whole$data$stations[[i]]$num_bikes_disabled
  data_6pm[i, 4] <- data_6pm_whole$data$stations[[i]]$num_docks_available
  data_6pm[i, 5] <- data_6pm_whole$data$stations[[i]]$num_docks_disabled
  data_6pm[i, 6] <- data_6pm_whole$data$stations[[i]]$is_installed
  data_6pm[i, 7] <- data_6pm_whole$data$stations[[i]]$is_renting
  data_6pm[i, 8] <- data_6pm_whole$data$stations[[i]]$is_returning
}
data_6pm <- data.frame(data_6pm, row.names = c(1:664))
colnames(data_6pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_7pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/7pm.RData")
data_7pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_7pm[i, 1] <- data_7pm_whole$data$stations[[i]]$station_id
  data_7pm[i, 2] <- data_7pm_whole$data$stations[[i]]$num_bikes_available
  data_7pm[i, 3] <- data_7pm_whole$data$stations[[i]]$num_bikes_disabled
  data_7pm[i, 4] <- data_7pm_whole$data$stations[[i]]$num_docks_available
  data_7pm[i, 5] <- data_7pm_whole$data$stations[[i]]$num_docks_disabled
  data_7pm[i, 6] <- data_7pm_whole$data$stations[[i]]$is_installed
  data_7pm[i, 7] <- data_7pm_whole$data$stations[[i]]$is_renting
  data_7pm[i, 8] <- data_7pm_whole$data$stations[[i]]$is_returning
}
data_7pm <- data.frame(data_7pm, row.names = c(1:664))
colnames(data_7pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_8pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/8pm.RData")
data_8pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_8pm[i, 1] <- data_8pm_whole$data$stations[[i]]$station_id
  data_8pm[i, 2] <- data_8pm_whole$data$stations[[i]]$num_bikes_available
  data_8pm[i, 3] <- data_8pm_whole$data$stations[[i]]$num_bikes_disabled
  data_8pm[i, 4] <- data_8pm_whole$data$stations[[i]]$num_docks_available
  data_8pm[i, 5] <- data_8pm_whole$data$stations[[i]]$num_docks_disabled
  data_8pm[i, 6] <- data_8pm_whole$data$stations[[i]]$is_installed
  data_8pm[i, 7] <- data_8pm_whole$data$stations[[i]]$is_renting
  data_8pm[i, 8] <- data_8pm_whole$data$stations[[i]]$is_returning
}
data_8pm <- data.frame(data_8pm, row.names = c(1:664))
colnames(data_8pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_9pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/9pm.RData")
data_9pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_9pm[i, 1] <- data_9pm_whole$data$stations[[i]]$station_id
  data_9pm[i, 2] <- data_9pm_whole$data$stations[[i]]$num_bikes_available
  data_9pm[i, 3] <- data_9pm_whole$data$stations[[i]]$num_bikes_disabled
  data_9pm[i, 4] <- data_9pm_whole$data$stations[[i]]$num_docks_available
  data_9pm[i, 5] <- data_9pm_whole$data$stations[[i]]$num_docks_disabled
  data_9pm[i, 6] <- data_9pm_whole$data$stations[[i]]$is_installed
  data_9pm[i, 7] <- data_9pm_whole$data$stations[[i]]$is_renting
  data_9pm[i, 8] <- data_9pm_whole$data$stations[[i]]$is_returning
}
data_9pm <- data.frame(data_9pm, row.names = c(1:664))
colnames(data_9pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")

data_10pm_whole <- readRDS("/Users/kaishengwang/Desktop/Applied\ Data\ Science\ Project/Project\ 2/Data/10pm.RData")
data_10pm <- matrix(nrow = 664, ncol = 8)
for (i in 1:644){
  data_10pm[i, 1] <- data_10pm_whole$data$stations[[i]]$station_id
  data_10pm[i, 2] <- data_10pm_whole$data$stations[[i]]$num_bikes_available
  data_10pm[i, 3] <- data_10pm_whole$data$stations[[i]]$num_bikes_disabled
  data_10pm[i, 4] <- data_10pm_whole$data$stations[[i]]$num_docks_available
  data_10pm[i, 5] <- data_10pm_whole$data$stations[[i]]$num_docks_disabled
  data_10pm[i, 6] <- data_10pm_whole$data$stations[[i]]$is_installed
  data_10pm[i, 7] <- data_10pm_whole$data$stations[[i]]$is_renting
  data_10pm[i, 8] <- data_10pm_whole$data$stations[[i]]$is_returning
}
data_10pm <- data.frame(data_10pm, row.names = c(1:664))
colnames(data_10pm) = c("Station_NO.", "Num_bikes_available", "Num_bike_disable", "Num_dock_available", "Num_dock_disable", "is_installed", "is_renting", "is_returning")
