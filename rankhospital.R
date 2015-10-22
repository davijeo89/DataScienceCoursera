rankhospital = function(state, outcome, num = "best")
{
    #loaded data and making a state column
    alldata = read.csv("outcome-of-care-measures.csv", colClasses = "character")
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
    #pulling respective outcome
    if (outcome == "heart attack")
    {
      illness = alldata[,11];
    }
    if (outcome == "heart failure")
    {
      illness = alldata[,17];
    }
    if (outcome == "pneumonia")
    {
      illness = alldata[,23];
    }
    #hattack = 
    #hfailure = alldata[,17];
    #p = alldata[,23];
    #sorting data
    hospitals = alldata[,2];
    HA = as.data.frame(cbind(as.character(illness), hospitals, statecodes));
    HosInStates = HA[grep(state, HA$statecodes),]
    #c= grep("Not Available", h$illness)
   # HosInStates = HosInState[-c,]
    if (num == "best")
    {
      num = 1;
    }
    if (num == "worst")
    {
      num = nrow(HosInStates)
    }
    if (num > nrow(HosInStates))
    {
      NA   
    }
    sorted = HosInStates[order(as.numeric(HosInStates$illness), HosInStates$hospitals, HosInStates$statecodes),]
   
    best = as.character(sorted[num,2])
    best
  }