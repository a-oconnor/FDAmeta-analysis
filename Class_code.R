------------------------------------------------------------
# Exercise 1: Setting things up: Part 1 : loading the software
#---------------------------------------------------------
# Look in packages window and notice the packages (lower RHS-3rd tab)
# The package "meta" is not listed
# Install the package we will use onto your computer
# This is only needed once but no harm if you do it every time  once
install.packages("knitr")
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
getwd()
# we want to be working in a folder with this code and dataset
setwd(dirname(file.choose()))
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
dat1$randomization <- as.factor(dat1$randomization)
dat1$blinding <- as.factor(dat1$blinding)
#########################
# Lets look at a summary of the data
summary(dat1) 
#########################
dat0 <- read.csv("dat0.csv")
meta0<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = T, byvar = randomization, data=dat0)
summary(meta0)
##
forest(meta0)
#----------------------------------------------------------------
# Exercise 2: Running a simple meta-analysis and looking at the direction and magnitude of summary effect
#----------------------------------------------------
cat("\014") 
dat1 <- read.csv("dat1.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat1)
summary(meta1)
forest.meta(meta1, col.diamond = "blue", overall.hetstat=F)

dat2 <- read.csv("dat2.csv")
meta2<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat2)
summary(meta2)
forest.meta(meta2, col.diamond ="red", overall.hetstat=F)

dat3 <- read.csv("dat3.csv")
meta3<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat3)
summary(meta3)
forest.meta(meta3,col.diamond = "green", overall.hetstat=F)

#----------------------------------------------------------------
# Exercise 3: The effect of OR compared to RR
#----------------------------------------------------
cat("\014") 
dat1 <- read.csv("dat1.csv")
meta1OR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat1)
forest.meta(meta1OR, col.study="blue", col.square = "blue", overall.hetstat=F)

meta1RR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = F, data=dat1)
forest.meta(meta1RR, col.study="red", col.square = "red", overall.hetstat=F, xlim=c(0.01,100))

#-------------------------------------------------------------
# Now for a rarer binary outcome and comparing the OR to RR
#----------------------------------------------------
cat("\014") 
dat2 <- read.csv("dat2.csv")
meta2OR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat2)
summary(meta2OR)
forest.meta(meta2OR, col.study="blue",col.square = "blue" , overall.hetstat=F)

meta2RR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="RR", comb.fixed = T, comb.random = F, data=dat2)
forest.meta(meta2RR, col.study="red", col.square = "red", overall.hetstat=F)

#----------------------------------------------------------------
# Exercise 4: The effect of sample size on fixed effect model
#----------------------------------------------------
cat("\014") 
dat1 <- read.csv("dat1.csv")
meta1OR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat1)
forest.meta(meta1OR, col.square = "red", col.square.lines = "red", overall.hetstat=F)
# lets import dat4 and look at those data
dat4 <- read.csv("dat4.csv")
# lets run a meta-analysis for dat4
meta4OR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat4)
forest.meta(meta4OR, col.square = "blue",col.square.lines = "blue", overall.hetstat=F)

--------------------------------------------
  # Exercise 5: Random effects model - impact of between study variation - tau^2
  #----------------------------------------------------
cat("\014") 
dat5 <- read.csv("dat5.csv")
metaOR5<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = F, comb.random = T, data=dat5)
summary(metaOR5)
forest.meta(metaOR5,col.square = "red", print.tau2=T, print.I2 = F, print.pval.Q=F, digits.tau2=10)

dat4OR <- read.csv("dat4.csv")
meta4OR<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = F, comb.random = T, data=dat4OR)
summary(meta4OR)
forest.meta(meta4OR, col.square = "blue", print.tau2=T, print.I2 = F, print.pval.Q=F, digits.tau2=6)
# Calculating the Odds Ratio
mean(dat4OR$OR)
max(dat4OR$OR)-min(dat4OR$OR)
# How much variation is there in effect sizes between studies

# How much variation is there in effect sizes between studies
mean(dat5$OR)
max(dat5$OR)-min(dat5$OR)
# How much variation is there in effect sizes between studies
dat6 <- read.csv("dat6.csv")
metaOR6<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = F, comb.random = T, data=dat6)
summary(metaOR6)
forest.meta(metaOR6, print.tau2=T, print.I2 = F, print.pval.Q=F)

--------------------------------------------
  # Exercise 6: Describe the amount of heterogenity
  #----------------------------------------------------
cat("\014") 
dat1 <- read.csv("dat1.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = F, comb.random = T, data=dat1, title="Dat1")
summary(meta1)
forest.meta(meta1, print.tau2=T, print.I2 = T, print.pval.Q=F, col.fixed = "red", col.random = "blue")

dat2 <- read.csv("dat2.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = F, comb.random = T, data=dat2, title="Dat2")
summary(meta1)
forest.meta(meta1, print.tau2=T, print.I2 = T, print.pval.Q=F, col.fixed = "red", col.random = "blue")

--------------------------------------------
  # Exercise 7: Testing the amount of heterogenity : Chisquare test
  #----------------------------------------------------
cat("\014") 

dat1 <- read.csv("dat1.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = T, data=dat1, title="Dat1")
summary(meta1)
forest.meta(meta1, print.tau2=T, print.I2 = T, print.pval.Q=T, print.Q=T)

dat2 <- read.csv("dat2.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = T, data=dat2, title="Dat2")
summary(meta1)
forest.meta(meta1, print.tau2=T, print.I2 = T, print.pval.Q=T, print.Q =T)
cat("\014") 
--------------------------------------------
  # Exercise 8: Looking at subgroups
  #----------------------------------------------------
# Lets look at a summary of the data
dat2 <- read.csv("dat2.csv")
labels(dat2)
summary(dat2) 
#########################
# Lets make randomized, blinded, days into categorical variables
labels(dat2)
dat2$randomization <- as.factor(dat2$randomization)
dat2$blinding <- as.factor(dat2$blinding)
dat2$days <- as.factor(dat2$days)
summary(dat2) 

dat2 <- read.csv("dat2.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = T, data=dat2, byvar = randomization, title="Dat2")
summary(meta1)
forest.meta(meta1, test.subgroup=T)

dat2 <- read.csv("dat2.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = T, data=dat2, byvar = blinding, print.byvar= F, title="Dat2")
summary(meta1)
forest.meta(meta1, test.subgroup=T)


## you try - Look at days as a subgroup



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

## you try - Look at days as a blinding AND randomization

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
meta_pretty<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = T, byvar = randomization, data=dat0)

forest.meta(meta_pretty, lab.e = "Treated", lab.c = "Untreated", col.diamond = "red", col.square = "blue", col.square.lines = "green", col.fixed = "#FFEC33", col.random = "#D133FF", fs.random=18)


ls()

dat2 <- read.csv("dat2.csv")
meta2<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = T, data=dat2)
funnel(meta2)
