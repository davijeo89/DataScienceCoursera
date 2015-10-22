corr <- function(directory, threshold=0)
{
  files = list.files(directory, full.names = TRUE)
  datacor = c()
  for (i in 1:332)
  {
    datas = read.csv(files[i])
    gooddata = complete.cases(datas)
    good = datas[gooddata, ]
    u =length(good[,4])
    if (u>threshold)
    {
      coors = cor(good[,2], good[,3])
      datacor = c(datacor, coors)
      print(datacor)
    }
  }
  datacor;

  # datas = data.frame();
  #  for (i in 1:332)
  #  {
  #   datas = rbind(datas, read.csv(files[i]))
  # }
  ##concatenatess the complete cases
  # gooddata = complete.cases(datas)
  # good = datas[gooddata, ]
  # datacor = c()
  # z=1;
  #  for (i in 1:332)
  #  {
  #   u =length(which(good[,4] == i))
  # print(u)
  #   if (u > threshold)
  #   {
  #     coors = cor(good[z:(z+u)-1,2], good[z:(z+u)-1,3])
  #     datacor = c(datacor, coors)
  #   }
  #   z=u+z;
  # print(z)
  #break
  # }
}

