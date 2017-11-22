pollutantmean <- function(directory, pollutant, id = 1:332){
	      for(i in id){
	      	    name<- paste(directory, formatC(i, width=3, flag="0"), ".csv", sep = "")	      
	      	    file_data <-read.csv(file = name)
	      	    nots <- is.na(file_data[,pollutant])
	      	    list <- file_data[!nots, pollutant]
		    if(i == id[1]) {
	      	    new_list <- list
		    } else {
		    new_list <- c(new_list,list)
		    }
	      }
	      mean(new_list)
}