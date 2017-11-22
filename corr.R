corr <- function(directory, threshold = 0) {
     id <- 1:332 
     for(i in id) {
     	   num <- complete(directory,i)
	   if (num[2] > threshold) {
	      name<- paste(directory, formatC(i, width=3, flag="0"), ".csv", sep = "")
              file_data <-read.csv(file = name)
              outp <- (!is.na(file_data[,1])) & (!is.na(file_data[,2])) & (!is.na(file_data[,3])) & (!is.na(file_data[,4]))
	      out <- cor(file_data[outp,2], file_data[outp,3])
              if(exists("corbs") == FALSE) {
              	    corbs <- out
	      } else {
                    corbs <- c(corbs,out)
              }
 
           }
	}            
#     cor(new_list_S,new_list_N)
      if(exists("corbs") == FALSE) {
      	corbs <- vector(mode="numeric",length =0)
	}		
      corbs
}