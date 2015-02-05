#! /usr/bin/env Rscript
# Alison Bo Wen
# AlisonBoWen@gmail.com


isInCircle <- function(x){
		dis = x[1]*x[1]+x[2]*x[2]
		if(dis < 1.0){
			return(1)
		}else{
			return(0)
		}		
	}
args <- commandArgs(TRUE)


totalSample <- as.integer(args[1])
coor <- runif(totalSample * 2,0.0,1.0)

coor <- matrix(coor, ncol = 2, nrow = totalSample, byrow=TRUE)

noInCircle <- apply(coor, 1, isInCircle)
freq <- 4.0 * sum(noInCircle) / as.double(totalSample)
cat("1","\t",freq,"\n")
