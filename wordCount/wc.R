#! /usr/bin/env Rscript
# Alison Bo Wen
# AlisonBoWen@gmail.com
# cat("in R function\n")
input <- file("stdin", "r")

pt <- function(word){
	cat(word,"\t",1,"\n")
	}
while (length(currentLine <-readLines(input, n=1, warn=FALSE))>0){
	fields <- strsplit(currentLine, " ")[[1]]
	lapply(fields,pt)
}	
close(input)
