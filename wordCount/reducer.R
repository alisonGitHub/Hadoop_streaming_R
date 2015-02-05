#! /usr/bin/env Rscript
# Alison Bo Wen
# AlisonBoWen@gmail.com
# cat("in R function\n")

input <- file("stdin", "r")

currentLine <-readLines(input, n=1, warn=FALSE)
fields <- strsplit(currentLine, "\t")[[1]]
curWord <- fields[1]
curVal <- as.numeric(fields[2])

while (length(currentLine <-readLines(input, n=1, warn=FALSE))>0){
	fields <- strsplit(currentLine, "\t")[[1]]
	nextWord <- fields[1]
	nextVal <- as.numeric(fields[2])
	if(curWord == nextWord){
		curVal <- curVal + nextVal
	}else{
		cat(curWord,"\t",curVal,"\n")
		curWord <- nextWord
		curVal <- nextVal
	}
}	

cat(curWord,"\t",curVal,"\n")
