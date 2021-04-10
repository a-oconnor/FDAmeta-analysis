library(meta)
data(Olkin95)
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Olkin95,
                 studlab=paste(author, year),
                 sm="RR", method="I")


# Funnel plots
#
funnel(meta1)
#
# Same result as code above:
#
funnel(meta1$TE, meta1$seTE, sm="RR",
       comb.fixed=TRUE, level=0.95)
#
# Funnel plot with confidence intervals,
# fixed effect estimate and contours
#
cc <- funnel(meta1, comb.fixed=TRUE,
             level=0.95, contour=c(0.9, 0.95, 0.99))$col.contour
legend(0.05, 0.05,
       c("0.1 > p > 0.05", "0.05 > p > 0.01", "< 0.01"), fill=cc)
#
# Contour-enhanced funnel plot with user-chosen colours
#
funnel(meta1, comb.fixed=TRUE,
       level=0.95, contour=c(0.9, 0.95, 0.99),
       col.contour=c("darkgreen", "green", "lightgreen"),
       lwd=2, cex=2, pch=16, studlab=TRUE, cex.studlab=1.25)
legend(0.05, 0.05,
       c("0.1 > p > 0.05", "0.05 > p > 0.01", "< 0.01"),
       fill=c("darkgreen", "green", "lightgreen"))

par(oldpar)