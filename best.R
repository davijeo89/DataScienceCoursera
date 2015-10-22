best = function(state, outcome)
{
  #loaded data and making a state column
  alldata = read.csv("outcome-of-care-measures.csv",  stringsAsFactors = FALSE, na.string= "Not Available")#colClasses = "character",
  statecodes = alldata[,7];
  #verifying data
  singlestates = statecodes[!duplicated(statecodes)]#list of all 50 states plus territories
  if (sum(state %in% singlestates)==0)
  {
    stop("invalid state")
  }
  if ((outcome == "heart attack" || outcome == "heart failure" || outcome == "pneumonia")==0)
  {
    stop("invalid outcome")
  }
  #making table of hospitals, states and 30 day ranks
  hattack = alldata[,11];
  hfailure = alldata[,17];
  p = alldata[,23];
  hospitals = alldata[,2];
  if (outcome == "heart attack")
  {
    HA = cbind(hattack, hospitals, statecodes);
    HAB = as.data.frame(HA)
    #sorting data
    sorted_attack = HAB[order(HAB[,1], HAB[,2], HAB[,3]),]
    hosnum = match(state, sorted_attack[,3])
    #print(hosnum)
    besthospital = sorted_attack[hosnum,2]
    #print(besthospital)
  }
  if (outcome == "heart failure")
  {
    print("hello")
    HAB = cbind(as.character(hfailure), hospitals, statecodes);
    #HAB = as.data.frame(HA)
    #sorting data
    sorted_attack = HAB[order(as.numeric(HAB[,1]), HAB[,2], HAB[,3]),]
    hosnum = match(state, sorted_attack[,3])
    besthospital = sorted_attack[hosnum,2]
  }
  if (outcome == "pneumonia")
  {
    HAB = cbind(as.character(p), hospitals, statecodes);
    #HAB = as.data.frame(HA)
    #sorting data
    sorted_attack = HAB[order(as.numeric(HAB[,1]), HAB[,2], HAB[,3]),]
    hosnum = match(state, sorted_attack[,3])
    besthospital = sorted_attack[hosnum,2]
  }
besthos = as.character(besthospital)
#HA
#subsorted_attack
besthos
}