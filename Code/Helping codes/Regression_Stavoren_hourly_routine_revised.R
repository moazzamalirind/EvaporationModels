##################
##################
#### Stavoren ####
##################
##################

#################
# Getting started 
#################

# Remove everything from R's memory.
rm(list=ls())

#Set working directory
mypath = "...."
setwd(mypath)

# Import packages
library(leaps)

######################
#### Read dataset ####
######################

summer = read.table("Stavoren_hourly_2019_routine_revised.txt", sep="\t", header=TRUE)
summer_2020 = read.table("Stavoren_hourly_2020_routine_revised.txt", sep="\t", header=TRUE)

######################################################
#### Simple and multiple Linear regression models ####
######################################################
#### Variable names:
# LE = latent heat flux
# Kin = global radiation
# u = wind speed
# De = vapour pressure gradient
# VPD = vapour pressure deficit
# Twater = sub-skin water temperature (obtained from Meteosat satellite)

## Explanation ##
# The dataframe "models" provides an overview of all considered combinations to make a linear regression model.
# Every row represents a linear regression model, where "1" means the variable is included in the model,
# whereas "0" means the variable is not included. 
# Simple linear regression models were considered (Y = b0 + b1*X1), in which X1 can be a single variable, or a multiplication of variables. 
# Multiple linear regression models were considered as well (Y = b0 + b1*X1 + b2*X2 + ... + bi*Xi), in which Xi can be a single variable.

# The resulting fit of the model can be determined through the
# metrics "adjR2" (= adjusted R^2) and "RMSE" (= Root Mean Squared Error).

# In the case of summation of variables:
# Where nvar = 1 in the dataframe "models", we are looking at a simple linear regression model.
# Where nvar > 1 in the dataframe "models", we are looking at a multiple linear regression model.

# In the case of multiplication of variables: 
# Here we are only considering simple linear regression models where X1 is a multiplication of a multitude of variables.

for(i in c("sums","mult")){
  
  ############ Choose between summation and multiplication:
  combi = i
  
  if (combi == "sums") {
    # Check all combinations of variables - summation --> used to produce the Venn diagram
    leaps<-regsubsets(LE~Kin+u+De+VPD+Twater,data=summer,nbest=10)
  } else {
    # Check all combinations of variables - multiplication --> used to produce the Venn diagram
    leaps<-regsubsets(LE~Kin+u+De+VPD+Twater+Kin_u+Kin_De+Kin_VPD+Kin_Twater+u_De+u_VPD+u_Twater+De_VPD+De_Twater+
                        VPD_Twater+Kin_u_De+Kin_u_VPD+Kin_u_Twater+Kin_De_VPD+
                        Kin_De_Twater+Kin_VPD_Twater+u_De_VPD+u_De_Twater+u_VPD_Twater+
                        De_VPD_Twater+Kin_u_De_VPD+Kin_u_De_Twater+Kin_u_VPD_Twater+
                        Kin_De_VPD_Twater+u_De_VPD_Twater+Kin_u_De_VPD_Twater,
                      data=summer,nbest=35)
  }
  ############
  
  
  # view results
  res_leaps = summary(leaps)
  
  # # Provide a list of the coefficients related to each model
  RMSE = sqrt(res_leaps$rss/res_leaps$obj$nn)
  
  # Find the elements that are in each model
  models = data.frame(matrix(0, nrow = length(res_leaps$rsq), ncol = leaps$np))
  for(i in 1:length(res_leaps$rsq))
  {
    m = res_leaps$which[i,2:leaps$np] # Matrix that indicates which predictors/elements are included in the models
    a = which(m, arr.ind=T)           # Find which predictors are included (= TRUE)
    models[i,a] = 1                   # Make those predictors 1 in the new dataframe (models)
    models[i,leaps$np] = sum(models[i,]) # Indicate how many predictors are included in each model
  }
  # Add colnames
  colnames(models) = c(leaps$xnames[2:length(leaps$xnames)],"nvar")  
  # The r-squared for each model
  models$adjr2 = round(res_leaps$adjr2, 2)
  # Add RMSE as column
  models$RMSE = round(RMSE, 2)
  # Sort on adjusted r2
  models <- models[order(-models$adjr2),]
  
  
  if (combi == "mult") {
    # !!!Only run the following lines in the case where variables are multiplied (so not the summation):
    # Remove all rows that have more than 1 variable (we discard all 'combinations of combinations' of products)
    models<-models[!models$nvar >1,]
  }
  
  ## Store the results
  if (combi == "sums") {
    models_sum = models
  } else {
    models_mult = models
  }
  
}


############################################
#### Quadratic linear regression models ####
############################################
# Find the regression models which have a quadratic form (Y = b0 + b1*X1 + b2*X1^2)
# X1 can be a single variable, or the multiplication of multiple variables

# Create empty dataframe to store R^2 values of each quadratic linear regression model.
quadr = data.frame(matrix(ncol = (ncol(summer)-1), nrow = 4))
colnames(quadr) <- colnames(summer)[2:ncol(summer)]
rownames(quadr) <- c("R2","RMSE","R2_sim","RMSE_sim")

# Loop through all combinations
for(i in 2:32){
  fit <- lm(LE ~ poly(summer[,i], 2, raw = TRUE), data = summer)
  res_leaps = summary(fit)
  quadr[1,(i-1)] = round(res_leaps$adj.r.squared,2) # Write R^2 to dataframe 'quadr'
  quadr[2,(i-1)] = sqrt(mean(fit$residuals^2))      # Write RMSE to dataframe

  # Check R2 between simulated LE (using the found regression model) and observed LE
  coeff=coefficients(fit)
  summer$LE_sim = coeff[2]*summer[,i] + coeff[3]*(summer[,i]^2) + coeff[1]
  corr = lm(LE~LE_sim, data=summer)
  quadr[3,(i-1)] = round(summary(corr)$r.squared, 2)                   # Write R^2 to dataframe 'quadr'
  quadr[4,(i-1)] = sqrt(mean((summer$LE - summer$LE_sim)^2, na.rm=T))  # Write RMSE to dataframe 'quadr'
}

# Find the model with the best fit (according to adjusted R^2)
which.max(quadr[1,]) # R2 of model fit
which.max(quadr[3,]) # R2 of LE~LE_sim


##########################
#### Choosing a model ####
##########################
## Check within the dataframes 'models_sum', 'models_mult', and 'quadr'
## which regression model is (1) the best, and (2) the best simple model

# Simple or multiple linear regression model
models_sum$adjr2[1]                            # Find best model with unlimited number of variables
models_sum$adjr2[which(models_sum$nvar<=2)[1]] # And the best model with max two variables

models_mult$adjr2[1]                           # Find best model with unlimited number of variables
findlocation = which(models_mult[1:15] == 1, arr.ind=TRUE) # columns 1:15 represent single variables or combination of 2 variables
models_mult$adjr2[min(findlocation[,1])]       # And the best model with max two variables

# Quadratic linear regression
quadr[1,which.max(quadr[1,])]                  

## Now determine which is the best model, 
## and which the simplest (= max 2 variables) best model. 

####################
#### Validation ####
####################
# Validate the regression model with the data of the year 2020


#### Hourly - simple model ####
fit <- lm(LE ~ u_De, data = summer)
res_leaps = summary(fit)
coeff=coefficients(fit)

# R2 - calibration (LE~LE_sim)
summer$LE_sim = coeff[2]*summer$u_De + coeff[1]
corr = lm(LE~LE_sim, data=summer)
round(summary(corr)$r.squared, 2)

# Calculate simulated LE in 2020 using the regression model developed with data from 2019
summer_2020$LE_sim = coeff[2]*summer_2020$u_De + coeff[1]
corr = lm(LE~LE_sim, data=summer_2020)
round(summary(corr)$r.squared, 2)


#### Hourly - best model ####
# Find again the regression model (using the data of 2019)
fit_best <- lm(LE ~ u_De_Twater, data = summer)
res_leaps_best = summary(fit_best)
coeff=coefficients(fit_best)

# R2 - calibration (LE~LE_sim)
summer$LE_sim = coeff[2]*summer$u_De_Twater + coeff[1]
corr = lm(LE~LE_sim, data=summer)
round(summary(corr)$r.squared, 2)

# Calculate simulated LE in 2020 using the regression model developed with data from 2019
summer_2020$LE_sim_best = coeff[2]*summer_2020$u_De_Twater + coeff[1]
corr_best = lm(LE~LE_sim_best, data=summer_2020)
round(summary(corr_best)$r.squared, 2)



