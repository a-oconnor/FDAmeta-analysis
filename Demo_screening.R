install.packages("revtools")
library(revtools)
file_location <- system.file(
  "extdata",
  "avian_ecology_bibliography.ris",
  package = "revtools")
file_location
x <- read_bibliography("/cloud/lib/x86_64-pc-linux-gnu-library/4.3/revtools/extdata/avian_ecology_bibliography.ris")
screen_abstracts(x)