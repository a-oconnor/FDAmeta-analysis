Meta-Analaysis Workshop Slides
========================================================
author: Annette O'Connor
date:  
autosize: true
transition: none

Meta-analysis
========================================================

1. Define the review question
2. Comprehensive search for studies 
3. Select relevant studies from the search
4. Collect data from relevant studies
5. Assess risk of bias in relevant studies
6. <span style="color:blue">  **Synthesize the results**  </span>
7. Present the results
8. Interpret the results

BRD Example of how we can use meta-analysis
========================================================
go to BRD project

BRD Example of how we can use meta-analysis
========================================================
![mynetwork](figure/network_plot.png)

Exercise 1: Setting things up --install the package
========================================================

Purpose
-  Install the packages we need
-  Load the  packages we need
-  Accessing your data
-  Looking at your data

Aside: What does R code look like
========================================================

```r
# This text will not be read by R becuase of the #
cat("\014") 
dat1 <- read.csv("dat1.csv")
```

Aside: What does R code look like
========================================================

```r
cat("\014") 
dat1 <- read.csv("dat1.csv")
meta1<-metabin(event.e, n.e, event.c, n.c, studlab=trial, sm="OR", comb.fixed = T, comb.random = F, data=dat1)
summary(meta1)
```

End Exercise
========================================================
![myfiga](figure/broom.png)

Exercise 2: Direction and precision of the effect size 
========================================================
Takehome  

- Normally for preventive factors ratios< 1, imply prevention
- Normally for risk factors ratios, > 1 imply risk
- Focus on estimate and <span style="color:blue">  **precision**  </span> 
- Interpretation can change based on what is in the numerator

End Exercise
========================================================
![myfiga](figure/broom.png)

Exercise 3: The impact of the effect measure: OR versus RR
======================================================== 
Takehome  
- Risk ratio is always closer to the null value than Odds ratios
- Difference becomes smaller as the outcome become rarer

End Exercise
========================================================
![myfiga](figure/broom.png)

Exercise 4: The fixed effect model - sample size
======================================================== 
![myfig1](figure/metapicture.png) 

Exercise 4: Fixed effect model
======================================================== 
![myfigex_4](figure/Fixed 1.png) 


End Exercise
========================================================
![myfiga](figure/broom.png)

Exercise 4: The fixed effect model - sample size
======================================================== 
![myfigex_4](figure/Fixed 2.png) 


End Exercise
========================================================
![myfiga](figure/broom.png)

Exercise 5: The random effects model - between study variation
======================================================== 
![myfig2](figure/Random effect.png) 


Exercise 5: The random effects model - between study variation
======================================================== 
![myfig2](figure/Random 2.png) 


Exercise 5: The random effects model - between study variation
======================================================== 
![myfig2](figure/Random 4.png) 


Exercise 5: The random effects model - between study variation
======================================================== 
![myfig2](figure/Random 3.png) 


End Exercise
========================================================
![myfiga](figure/broom.png)

Exercise 6: Heterogeneity : different effects
======================================================== 
![myfig2](figure/two_distributions.png) 

End Exercise
========================================================
![myfiga](figure/broom.png)

Exercise 7: Heterogeneity - describing the amount of heterogeneity
======================================================== 
-  Describe the amount of heterogeneity
-  Test of the amount is more than expected by chance

End Exercise
========================================================
![myfiga](figure/broom.png)




Exercise 8: Looking at subgroups
======================================================== 

- Subgroups -contextual heterogenity like sex, region, breed
- Subgroups -methodological heterogenity like randomized
- Needs mutually exclusive categories
- Not a continuous variable 
- Look at days as a blinding AND randomization

Exercise 8: Looking at subgroups
======================================================== 

- Run a subgroup analsyis yourself 
- With days as the group

End Exercise
========================================================
![myfiga](figure/broom.png)


 Exercise 9: Using meta-regression
======================================================== 
 - a weighted multivariable regression

Exercise 9: Using meta-regression
======================================================== 

- Run a meta-regression analsyis yourself 
    - With days as the group
    - With days and randomization as the groups

End Exercise
========================================================
![myfiga](figure/broom.png)


 Exercise 10: small studies
========================================================

- the code for influence analysis
  funnel(XXXXX)
  - use the dat1.csv dataset

  Exercise 11: assess influential studies
========================================================

- the code for influence analysis
  metainf(XXXXX)
  - can you think how you might run this analysis
  
