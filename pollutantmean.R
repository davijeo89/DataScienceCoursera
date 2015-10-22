pollutantmean <- function(directory, pollutant, id=0)
{
  id
  ####Setting type of polution  
  if (pollutant == "nitrate")
  {
    type = 3;
  }
  if (pollutant == "sulfate")
  {
    type = 2;
  }
  #######Binding all files together  
  #setwd(directory);
  files = list.files(directory, full.names = TRUE)
  pol_data = data.frame();
  for (i in 1:332)
  {
    pol_data = rbind(pol_data, read.csv(files[i]))
  }
  ###Creating a subset of files from id input  
  pollute_subset = data.frame()
 # if (exists("id")==FALSE)
 #{
 #   id = 0;
 # }
  for (j in id)
  {
    pollute_subset = rbind(pollute_subset, pol_data[which(pol_data[, "ID"] == j),])
  }
  ###finding actual average
  mean(pollute_subset[ ,type], na.rm=TRUE)
}

