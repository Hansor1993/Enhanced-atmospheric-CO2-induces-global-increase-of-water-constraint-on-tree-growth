######### BRT model  ###sm
## BRT for all tree-ring sites
library(gbm)
library(dismo)

slope_data1 <- read.csv("all_sm_res410_trend25_factors.csv")
head(slope_data1)
nrow(slope_data1)

slope_data1$res_trend <- scale(slope_data1$res_trend)
slope_data1$AWC <- factor(slope_data1$AWC)
slope_data1$CEC <- scale(slope_data1$CEC)
slope_data1$T_sand <- scale(slope_data1$T_sand)
slope_data1$ph <- scale(slope_data1$ph)
slope_data1$forest.canopy.height <- scale(slope_data1$forest.canopy.height)
slope_data1$iso <- scale(slope_data1$iso)
slope_data1$max.root.depth <- scale(slope_data1$max.root.depth)
slope_data1$LNM <- scale(slope_data1$LNM)
slope_data1$LPM <- scale(slope_data1$LPM)
slope_data1$SLA <- scale(slope_data1$SLA)
slope_data1$dswrf <- scale(slope_data1$dswrf)
slope_data1$co <- scale(slope_data1$co)
slope_data1$pre <- scale(slope_data1$pre)
slope_data1$tmp <- scale(slope_data1$tmp)
slope_data1$co_trend <- scale(slope_data1$co_trend)
slope_data1$dswrf_trend <- scale(slope_data1$dswrf_trend)
slope_data1$pre_trend <- scale(slope_data1$pre_trend)
slope_data1$tmp_trend <- scale(slope_data1$tmp_trend)


set.seed(1)
mod = gbm.step(data = slope_data1,
               gbm.y = 2,
               gbm.x=c(5:8, 10:11, 13:23),
               family="gaussian",
               tree.complexity = 5,
               learning.rate = 0.001,
               bag.fraction =0.5)

mod.simp <- gbm.simplify(mod, n.drops = 5)

##mod.simp1 <- gbm.step(data = slope_data,
gbm.y = 2,
gbm.x= mod.simp$pred.list[[0]],
family="gaussian",
tree.complexity = 5,
learning.rate = 0.001,
bag.fraction =0.5)

model_contribution <- mod$contributions
##model_contribution1 <- mod.simp1$contributions

write.csv(model_contribution, "BRT_contribution.csv")
##write.csv(model_contribution1, "BRT_contribution.csv")

