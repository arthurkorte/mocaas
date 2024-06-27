### mocaas - Modify RNA sequence withOut Changes in the Amino Acid Sequence

### get your input sequence as vector of characters
seq<-as.character(read.csv('test_seq.csv')[,1])

# alternativley download from tair etc. 
# the mocaas function requires two external libraries

library('seqinr')
library('ds4psy')

load('AA_table.rda')
#codon frequency from https://www.kazusa.or.jp/codon/cgi-bin/showcodon.cgi?species=3702
source('mocaas.r')

# run the respective method ('best','close','worst)
out<-mocaas(seq,method='best')
# one can also only replace certain triplets
out2<-mocaas(seq,method='best',replace = c(2:100))

#extract new RNA sequence
seq_new<-out[,2]

# alternativley 
seq_new<-paste(out[,2],collapse = '')

# test AA sequence via translate function of seqinr package
