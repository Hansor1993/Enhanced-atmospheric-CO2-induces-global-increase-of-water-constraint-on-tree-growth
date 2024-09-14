library(dplyr)
library(tidyr)

data1 <- read.csv("data for analysis at the grid.csv", header = TRUE)
data2 <- data1 %>% 
  select("area","latitude", "longitude", "res_trend","co","dswrf","tmp","co_trend","CEC")

####The 4°×4° spatial unit was used to group all tree-ring sites into different grids. Furthermore, the 4°×4° grid was moved at 1° intervals along the longitudinal and latitudinal directions
######
# 划分经纬度范围
data_lon0_lat0 <- data2 %>%
  mutate(lat_grid = cut(latitude, breaks = seq(-90, 90, by = 4)),
         lon_grid = cut(longitude, breaks = seq(-180, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)

##data_lon0_lat1 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-89, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-180, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)

##data_lon0_lat2 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-88, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-180, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)

##data_lon0_lat3 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-87, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-180, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)


##data_lon1_lat0 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-90, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-179, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)

##data_lon1_lat1 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-89, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-179, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)

##data_lon1_lat2 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-88, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-179, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)

##data_lon1_lat3 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-87, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-179, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)


##data_lon2_lat0 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-90, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-178, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)

##data_lon2_lat1<- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-89, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-178, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)

##data_lon2_lat2 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-88, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-178, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)

##data_lon2_lat3 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-87, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-178, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)



##data_lon3_lat0 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-90, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-177, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)
##data_lon3_lat1 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-89, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-177, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)
##data_lon3_lat2<- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-88, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-177, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)
##data_lon3_lat3 <- data2 %>%
mutate(lat_grid = cut(latitude, breaks = seq(-87, 90, by = 4)),
       lon_grid = cut(longitude, breaks = seq(-177, 180, by = 4))) %>%
  group_by(lat_grid, lon_grid) %>%
  mutate(latitude = as.numeric(gsub("\\((.*),.*\\)", "\\1", lat_grid)) + 2,
         longitude = as.numeric(gsub("\\(.*,(.*)\\)", "\\1", lon_grid)) + 2)


# Counting the number of sample points in each grid
grid_counts <-data_lon0_lat0 %>%
  group_by(lat_grid, lon_grid) %>%
  summarize(count = n())

# Filtering out the grids with sample points greater than 10
significant_grids <- grid_counts %>%
  filter(count >= 10)
print(significant_grids)


output <- significant_grids %>%
  left_join(data_lon0_lat0, by = c("lat_grid", "lon_grid")) %>%
  group_by(lat_grid, lon_grid) %>%
  summarize(area = list(area)) %>%
  unnest(cols = c(area)) %>% 
  as.data.frame()

output$new = seq(1,2813,1)

###Adding labels to the grid
lab<-seq(1,100,1)
grid_id<-unique(output[,c(1:2)])
lab_grid_id <- cbind(grid_id, lab)
output_factors <- output %>% 
  left_join(lab_grid_id, by=c("lat_grid", "lon_grid")) 



########partial correlation regression
library("ppcor")

result <- list()
for (i in unique(output_factors$lab)) {
  regre_slope <- output_factors %>%
    filter(num == i) 
  # 回归
  lmi <- ppcor::pcor.test(regre_slope$res_trend, regre_slope$co, regre_slope[,c("dswrf","CEC","tmp","co_trend")])
  lmi1 <- ppcor::pcor.test(regre_slope$res_trend, regre_slope$dswrf, regre_slope[,c("co","CEC","tmp","co_trend")])
  lmi2 <- ppcor::pcor.test(regre_slope$res_trend, regre_slope$CEC, regre_slope[,c("co","dswrf","tmp","co_trend")])
  lmi3 <- ppcor::pcor.test(regre_slope$res_trend, regre_slope$tmp, regre_slope[,c("co","dswrf","CEC","co_trend")])
  lmi4 <- ppcor::pcor.test(regre_slope$res_trend, regre_slope$co_trend, regre_slope[,c("co","dswrf","CEC","tmp")])
  lmisum <- cbind(lmi$estimate,lmi$p.value,
                  lmi1$estimate,lmi1$p.value,
                  lmi2$estimate,lmi2$p.value,
                  lmi3$estimate,lmi3$p.value,
                  lmi4$estimate,lmi4$p.value
  )
  # Extracting partial correlation coefficient
  resulti <- lmisum %>%
    as.data.frame() %>%
    rename("co_parcor"="V1",
           "co_p.value" = "V2",
           "dswrf_parcor"="V3",
           "dswrf_p.value" = "V4",
           "CEC_parcor"="V5",
           "CEC_p.value" = "V6",
           "tmp_parcor"="V7",
           "tmp_p.value" = "V8",
           "co_trend_parcor"="V9",
           "co_trend_p.value" = "V10"
    ) %>%
    mutate(area = i)
  result[[i]] <- resulti
}
print(result)
result2 <- bind_rows(result)

unique(result2$area)
write.csv(result2, "partial correlation coefficient.csv")

