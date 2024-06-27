mocaas<-function (seq,method=c('best','worst','close'),replace='all')
{
  
  if (length(seq)==1) {
    seq <- strsplit(seq, "")[[1]] }
 
  stopifnot(is_wholenumber(length(seq)/3))
  if (any(seq %in% LETTERS)) {
    seq <- tolower(seq)
  }
  
  if (method=='best') {
    W<-AA_table[,c(1,6)] }
  if (method=='worst') {
    W<-AA_table[,c(1,8)] }
  if (method=='close') {
    W<-AA_table[,c(1,8)] }
  
  if ('all'%in%replace) { change <- 1:((length(seq)/3)-1)} else {
    change<-replace}
  cat ('the following triplets will be replaced:',replace, '\n')
  
  three_letter_substrings <- list()
  

  for (i in seq(1, length(seq) - 2, by = 3)) {

    substring <- paste(seq[i:(i + 2)], collapse = "")

    three_letter_substrings[[length(three_letter_substrings) + 1]] <- substring
  }
  
  
  for ( i in change) {
    
    three_letter_substrings[i]<-W[which(W[,1]==three_letter_substrings[i]),2]
  }
  
  
  result_string <- paste(three_letter_substrings, collapse = "")
  
  result <- strsplit(result_string, "")[[1]]
  
  R<-as.data.frame(cbind(seq,result),ncol=2)
  
  R$change<-rep(0)
 R[which(R[,1]!=R[,2]),3]<-1

 if (all.equal(translate(seq),translate(R[,2]))==T) {hum<-0 } else {hum<-'some'}
  cat(sum(R[,3]), 'bp have been changed', hum, 'AA have been changed','\n')
  
  return(R)
}
