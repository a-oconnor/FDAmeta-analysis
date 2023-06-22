------------------------------------------------------------
# Exercise 1: Setting things up: Part 1 : loading the software
#---------------------------------------------------------
# Look in packages window and notice the packages (lower RHS-3rd tab)
# The package "meta" is not listed (It will be on the instructors list)
# Install the package we will use onto your computer
# This is only needed once but no harm if you do it every time  once
install.packages("meta")
# Look in packages window again (lower RHS-3rd tab)
# The package "meta" is listed but no check box
# Load the package we will use - for this working session
# This is needed every time you start again
library(meta)
# Look in packages window again (lower RHS-3rd tab)
# The package "meta" is listed but box is checked
#-----------------------------------------------------------------
#This code will show you the folder you are working in
# $350getwd()
# we want to be working in a folder with this code and dataset
#setwd(dirname(file.choose()))
# Look at the global environment window (top RHS) there is not data there
# load the dataset we would like to use
dat1 <- read.csv("dat1.csv")
# Now look at the global environment window (top RHS)
# lets look at the dataset
# Use mouse to hover over dataset name and click
#-----------------------------------------------------------------
# Lets look at the structure of the data
str(dat1)
#########################
# Lets look at a summary of the data
summary(dat1) 
#########################
# Lets make randomized, blinded, days into categorical variables
labels(dat1)
dat1$observational<- as.factor(dat1$observational)
dat1$leafy_green <- as.factor(dat1$leafy_green)
#########################
# Lets look at a summary of the data
summary(dat1) 
#########################
dat0 <- read.csv("dat0.csv")
meta0<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = T, byvar = observational, data=dat0)
summary(meta0)
##
forest(meta0)
#dev.off()
#print(plot(meta0))
#----------------------------------------------------------------
# Exercise 2: Running a simple meta-analysis and looking at the direction and magnitude of summary effect
#----------------------------------------------------
cat("\014")  # this just clears the  console- it has no other purpose
dat1 <- read.csv("dat1.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = F, data=dat1)
summary(meta1)
forest.meta(meta1, col.diamond = "blue", overall.hetstat=F)

dat2 <- read.csv("dat2.csv")
meta2<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = F, data=dat2)
summary(meta2)
forest.meta(meta2, col.diamond ="red", overall.hetstat=F)

dat3 <- read.csv("dat3.csv")
meta3<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = F, data=dat3)
summary(meta3)
forest.meta(meta3,col.diamond = "green", overall.hetstat=F)

#----------------------------------------------------------------
# Exercise 2b: Continuous Running a simple meta-analysis and looking at the direction and magnitude of summary effect
#----------------------------------------------------
cat("\014")  # this just clears the  console- it has no other purpose
dat_cfu <- read.csv("CFU.csv")
meta_cfu<-metacont(n.e, mean.e, sd.e , n.c, mean.c, sd.c, studlab=trial, sm="MD", comb.fixed = T, comb.random = F, data=dat_cfu)
summary(meta_cfu)
forest.meta(meta_cfu, col.diamond = "blue", overall.hetstat=F)


#----------------------------------------------------------------
# Exercise 3: The effect of OR compared to RR
#----------------------------------------------------
#cat("\014") 
#dat1 <- read.csv("dat1.csv")
#meta1OR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat1)
#forest.meta(meta1OR, col.study="blue", col.square = "blue", overall.hetstat=F)

#meta1RR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = F, data=dat1)
#forest.meta(meta1RR, col.study="red", col.square = "red", overall.hetstat=F, xlim=c(0.01,100))

#-------------------------------------------------------------
# Now for a rarer binary outcome and comparing the OR to RR
#----------------------------------------------------
cat("\014") 
#dat2 <- read.csv("dat2.csv")
#meta2OR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat2)
#summary(meta2OR)
#forest.meta(meta2OR, col.study="blue",col.square = "blue" , overall.hetstat=F)

#meta2RR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = F, data=dat2)
#forest.meta(meta2RR, col.study="red", col.square = "red", overall.hetstat=F)

#----------------------------------------------------------------
# Exercise 4: The effect of sample size on fixed effect model
#----------------------------------------------------
cat("\014") 
dat1 <- read.csv("dat1.csv")
meta1OR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = F, data=dat1)
forest.meta(meta1OR, col.square = "red", col.square.lines = "red", overall.hetstat=F)
# lets import dat4 and look at those data
dat4 <- read.csv("dat4.csv")
# lets run a meta-analysis for dat4
meta4RR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = F, data=dat4)
forest.meta(meta4RR, col.square = "blue",col.square.lines = "blue", overall.hetstat=F)

#----------------------------------------------------------------
# Exercise 4b: Continuous The effect of sample size on fixed effect model
#----------------------------------------------------
cat("\014")  # this just clears the  console- it has no other purpose
dat_cfu <- read.csv("CFU.csv")
meta_cfu<-metacont(n.e, mean.e, sd.e , n.c, mean.c, sd.c, studlab=trial, sm="MD", comb.fixed = T, comb.random = F, data=dat_cfu)
forest.meta(meta_cfu, col.square = "blue",col.square.lines = "blue", overall.hetstat=F)

--------------------------------------------
  # Exercise 5: Random effects model - impact of between study variation - tau^2
  #----------------------------------------------------
cat("\014") 
dat5 <- read.csv("dat5.csv")
metaRR5<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = F, comb.random = T, data=dat5)
summary(metaRR5)
forest.meta(metaRR5,col.square = "red", print.tau2=T, print.I2 = F, print.pval.Q=F, digits.tau2=10)

dat4RR <- read.csv("dat4.csv")
meta4RR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = F, comb.random = T, data=dat4RR)
summary(meta4RR)
forest.meta(meta4RR, col.square = "blue", print.tau2=T, print.I2 = F, print.pval.Q=F, digits.tau2=6)

# How much variation is there in effect sizes between studies
dat6 <- read.csv("dat6.csv")
metaRR6<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = F, comb.random = T, data=dat6)
summary(metaRR6)
forest.meta(metaRR6, print.tau2=T, print.I2 = F, print.pval.Q=F)

#----------------------------------------------------------------
# Exercise 5b: Continuous :impact of between study variation - tau^2
#----------------------------------------------------
cat("\014")  # this just clears the  console- it has no other purpose
dat_cfu <- read.csv("CFU.csv")
meta_cfu<-metacont(n.e, mean.e, sd.e , n.c, mean.c, sd.c, studlab=trial, sm="MD", comb.fixed = T, comb.random = F, data=dat_cfu)
forest.meta(meta_cfu, print.tau2=T, print.I2 = F, print.pval.Q=F)

-------------------------------------------
  # Exercise 6: Describe the amount of heterogenity
  #----------------------------------------------------
cat("\014") 
dat1 <- read.csv("dat1.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = F, comb.random = T, data=dat1, title="Dat1")
summary(meta1)
forest.meta(meta1, print.tau2=T, print.I2 = T, print.pval.Q=F, col.fixed = "red", col.random = "blue")

dat2 <- read.csv("dat2.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = F, comb.random = T, data=dat2, title="Dat2")
summary(meta1)
forest.meta(meta1, print.tau2=T, print.I2 = T, print.pval.Q=F, col.fixed = "red", col.random = "blue")


#----------------------------------------------------------------
# Exercise 6b: Continuous :impact of between study variation - tau^2
#----------------------------------------------------
cat("\014")  # this just clears the  console- it has no other purpose
dat_cfu <- read.csv("CFU.csv")
meta_cfu<-metacont(n.e, mean.e, sd.e , n.c, mean.c, sd.c, studlab=trial, sm="MD", comb.fixed = T, comb.random = F, data=dat_cfu)
forest.meta(meta_cfu, print.tau2=T, print.I2 = T, print.pval.Q=F)

--------------------------------------------
  # Exercise 7: Testing the amount of heterogenity : Chisquare test
  #----------------------------------------------------
cat("\014") 

dat1 <- read.csv("dat1.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = T, data=dat1, title="Dat1")
summary(meta1)
forest.meta(meta1, print.tau2=T, print.I2 = T, print.pval.Q=T, print.Q=T)

dat2 <- read.csv("dat2.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = T, data=dat2, title="Dat2")
summary(meta1)
forest.meta(meta1, print.tau2=T, print.I2 = T, print.pval.Q=T, print.Q =T)
cat("\014") 


#----------------------------------------------------------------
# Exercise 7b: Continuous :impact of between study variation - tau^2
#----------------------------------------------------
cat("\014")  # this just clears the  console- it has no other purpose
dat_cfu <- read.csv("CFU.csv")
meta_cfu<-metacont(n.e, mean.e, sd.e , n.c, mean.c, sd.c, studlab=trial, sm="MD", comb.fixed = T, comb.random = F, data=dat_cfu)
forest.meta(meta_cfu, print.tau2=T, print.I2 = T, print.pval.Q=T, print.Q =T)

--------------------------------------------
  # Exercise 8: Looking at subgroups
  #----------------------------------------------------
# Lets look at a summary of the data
dat2 <- read.csv("dat2.csv")
labels(dat2)
summary(dat2) 
#########################
# Lets make observational, Leafy_green, days into categorical variables
labels(dat2)
dat2$observational <- as.factor(dat2$observational)
dat2$leafy_green <- as.factor(dat2$leafy_green)
summary(dat2) 

dat2 <- read.csv("dat2.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = T, data=dat2, byvar = observational, title="Dat2")
summary(meta1)
forest.meta(meta1, test.subgroup=T)

dat2 <- read.csv("dat2.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = T, data=dat2, byvar = leafy_green, print.byvar= F, title="Dat2")
summary(meta1)
forest.meta(meta1, test.subgroup=T)

#----------------------------------------------------------------
# Exercise 8b: Continuous :impact of between study variation - tau^2
#----------------------------------------------------
#MAKE hydroponic growth a factor 
dat_cfu <- read.csv("CFU.csv")
labels(dat_cfu)
dat_cfu$temperature.25C <- as.factor(dat_cfu$temperature.25C)
dat_cfu$hydroponic.growth <- as.factor(dat_cfu$hydroponic.growth)
summary(dat_cfu)
cat("\014")  # this just clears the  console- it has no other purpose
meta_cfu<-metacont(n.e, mean.e, sd.e , n.c, mean.c, sd.c, studlab=trial, sm="MD", comb.fixed = T, comb.random = F, byvar = hydroponic.growth, print.byvar= F, data=dat_cfu)
forest.meta(meta_cfu, print.tau2=T, print.I2 = T, print.pval.Q=T, print.Q =T)

meta_cfu<-metacont(n.e, mean.e, sd.e , n.c, mean.c, sd.c, studlab=trial, sm="MD", comb.fixed = T, comb.random = F, byvar = temperature.25C, print.byvar= F, data=dat_cfu)
forest.meta(meta_cfu, print.tau2=T, print.I2 = T, print.pval.Q=T, print.Q =T)


--------------------------------------------
  # Exercise 9: Meta-regression for catagorical variable
  #----------------------------------------------------
cat("\014") 
dat2 <- read.csv("dat2.csv")
meta<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = T, data=dat2, title="Dat2")
summary(meta)
forest.meta(meta)
meta_rg<-metareg(meta, ~randomization)
summary(meta_rg)



ls()
--------------------------------------------
  # Exercise 10: Assessing small study effects 
  
funnel(meta)
  #----------------------------------------------------
cat("\014") 

--------------------------------------------
  # Exercise 11: influence metainf(meta1)
  #----------------------------------------------------

metainf(meta1)

#-------------
#  Exercise 12: Making the forest plot pretty
#---------------
dat0 <- read.csv("dat0.csv")
meta_pretty<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = T, byvar = observational, data=dat0)

forest.meta(meta_pretty, lab.e = "Treated", lab.c = "Untreated", col.diamond = "red", col.square = "blue", col.square.lines = "green", col.fixed = "#FFEC33", col.random = "#D133FF", fs.random=18)


#-------------
#  Exercise 13: Creating a traffic light risk of bias plot 
install.packages("robvis")
library(robvis)
# making a dataset 
datarob <- read.csv("robvis.csv")
rob_traffic_light(datarob, "ROB2")


