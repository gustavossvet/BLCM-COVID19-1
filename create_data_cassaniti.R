### data from Cassaniti et al. 2020 ##
### DOI: 10.1002/jmv.25800
### 

#  PCR IGG IGM  N
#   +   +   +   27
#   +   +   -   2
#   +   -   +   7
#   +   -   -   32
#   -   +   +   0
#   -   +   -   0
#   -   -   +   1
#   -   -   -   41


setwd("C:\\Users\\admin\\switchdrive\\Cost Harmony\\analysis\\letter")

# create a data set, save it in a matrix
PCR <- c(rep(1, 68), rep(0, 42))
length(PCR)
IGG <- c(rep(1, 29), rep(0, 39), rep(1, 0), rep(0,42))
length(IGG)
IGM <- c(rep(1,27),rep(0,2),rep(1,7),rep(0,32),rep(1,0),rep(0,0),rep(1,1),rep(0,41))
length(IGM)

dat <- data.frame(PCR,IGG,IGM)
m.ca <- as.matrix(dat)

# dump data for Jags
dump("m.ca")

# open the dumpdata.R file, add there N and the 110 ones
N <- 110

ones <- c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
          1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
          1, 1, 1, 1, 1, 1, 1, 1)
