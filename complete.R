complete <- function(directory, id = 0)
{
  #######Binding all files together  
  #setwd(directory);
  files = list.files(directory, full.names = TRUE)
  datas = data.frame();
  for (i in 1:332)
  {
    datas = rbind(datas, read.csv(files[i]))
  }
  ##condates the complete cases
  gooddata = complete.cases(datas)
  good = datas[gooddata, ]
  ##counting the number of complete cases
 # completes = matrix(data = NA, nrow = length(id), ncol = 2)
 # colnames(completes) = c("id", "nobs")
 # x = 1;
 # for (i in id)
 # {
  #  u = length(which(good[,4] == i))
  #  completes[x,1] = id[x]
  #  completes[x,2]source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R") = u
#x=x+1;
 # }
 #completes
  completes = data.frame()
  for (i in id)
  {
    u = length(which(good[,4] == i))
    completes = rbind(completes, c(i, u)) 
  }
  colnames(completes) = c("id", "nobs")
comp = as.data.frame(completes)
  comp
}
