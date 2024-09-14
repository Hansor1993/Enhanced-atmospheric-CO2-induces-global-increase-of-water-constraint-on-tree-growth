########################生长季温度计算slope过程

# 加载包
library(tidyverse)
library(zoo)
library(conflicted)

###################################################################
###################################################################
#################循环回归###############################

######sm_410#####25-year moving window####
alldata2 <- read.csv("\\alldata_cross_data.csv")

result <- list()
ij <- 1
for (i in unique(alldata2$area)) {
  areadata <- alldata2 %>%
    filter(area == i)
  minyear <- min(areadata$Year)
  maxyear <- max(areadata$Year)
  for (j in minyear:(maxyear-24)) {
    areayeardata <- areadata %>%
      filter(Year >= j, Year <= j+24)
    areayeardata$res <- scale(areayeardata$res_410)
    areayeardata$sm <- scale(areayeardata$sm_410)
    areayeardata$tmp <- scale(areayeardata$tmp_410)
    areayeardata$co <- scale(areayeardata$co_410)
    areayeardata$pre <- scale(areayeardata$pre_410)
    areayeardata$dswrf <- scale(areayeardata$dswrf_410)
    # 回归
    lmij <- lm(res~sm, data = areayeardata)
    #lmij <- lm(res~sm+tmp+co+dswrf, data = areayeardata)
    #lmij <- lm(res~sm+tmp+co+dswrf+sm:tmp+sm:co+sm:dswrf, data = areayeardata)
    lmijsum <- summary(lmij)
    # 提取系数结果
    resultij <- lmijsum$coefficients %>%
      as.data.frame() %>%
      rownames_to_column("X") %>%
      mutate(
        area = i,
        Yearstart = j,
        Yearend = j+24
      )
    result[[ij]] <- resultij
    ij <- ij + 1
  }
  print(paste(ij, i, j+24, Sys.time()))
}
result2 <- bind_rows(result) %>%
  select(area, Yearstart, Yearend, everything())
unique(result2$area)
write.csv(result2, "global24-sm-410-multi.csv")

