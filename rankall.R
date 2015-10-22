rankall = function(outcome, num = "best")
{
  #loaded data and making a state column
  alldata = read.csv("outcome-of-care-measures.csv", stringsAsFactors = FALSE, na.string= "Not Available")
  statecodes = alldata[,7];
  #verifying data
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

  #sorting data
  hospitals = alldata[,2];
  allhos = as.data.frame(cbind(illness, hospitals, statecodes));#all hospitals for all states
  sorted = allhos[order(as.numeric(as.character(allhos[,1])), allhos[,2], allhos[,3]),]#all hospitals in all states sorted my 30-day rates
  #single_hos = sorted[!duplicated(sorted[,3]),]
  #sorted_states = single_hos[order(single_hos$statecodes, single_hos$hospitals),]
  sorted
}