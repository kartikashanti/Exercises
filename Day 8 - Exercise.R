data <- read.csv('Dataset/house_price_clean.csv')
summary(data)
head(data)
train <- data[!is.na(data$SalePrice),]
summary(train)

linearMod <- lm(SalePrice~TotalSqFeet + TotBathroom + OverallQual + GarageCars + Age, data = train)
#fungsi di R studio, untuk mencari linear model
linearMod

summary(linearMod)
