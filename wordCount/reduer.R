#! /usr/bin/env Rscript
# Alison Bo Wen
# AlisonBoWen@gmail.com

input <- file("stdin", "r")


total  <- 0
freqT <- 0
while (length(currentLine <-readLines(input, n=1, warn=FALSE))>0){
	fields <- strsplit(currentLine, "\t")[[1]]
	n <- fields[1]
	freq <- as.numeric(fields[2])
	freqT <- freqT + freq
	total <- total +1	
}	

cat(freqT/as.double(total),"\n")
