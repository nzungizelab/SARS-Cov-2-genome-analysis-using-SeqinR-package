
#Severe acute respiratory syndrome coronavirus 2 (SARS-CoV-2) isolate Wuhan-Hu-1
#Reference Sequence: NC_045512.2

#ACCESSION number in NCBI:   NC_045512



setwd("D:/R/Covid19_seq_analysis")


#load library
library("seqinr")

#load fasta file of 
covid19 <- read.fasta(file = "SARS-Cov-2.fasta")


#store the DNA seq for SARS-Cov-2 in a variable covid19seq 

covid19seq <- covid19 [[1]]

#display first 100 nucleotides of the SARS-Cov-2 sequence.
covid19seq [1:100]

#outpu
#[1] "a" "t" "t" "a" "a" "a" "g" "g" "t" "t" "t" "a" "t" "a" "c" "c" "t" "t" "c" "c" "c" "a" "g" "g" "t" "a" "a" "c" "a" "a" "a" "c" "c"
#[34] "a" "a" "c" "c" "a" "a" "c" "t" "t" "t" "c" "g" "a" "t" "c" "t" "c" "t" "t" "g" "t" "a" "g" "a" "t" "c" "t" "g" "t" "t" "c" "t" "c"
#[67] "t" "a" "a" "a" "c" "g" "a" "a" "c" "t" "t" "t" "a" "a" "a" "a" "t" "c" "t" "g" "t" "g" "t" "g" "g" "c" "t" "g" "t" "c" "a" "c" "t"
#"[100] "c"




#Length of a DNA sequence
length(covid19seq)

#output : 29903 total nucleotides


#display the last 50 nucleotides 
covid19seq [29853:29903]

#Output
#[1] "g" "c" "t" "t" "c" "t" "t" "a" "g" "g" "a" "g" "a" "a" "t" "g" "a" "c" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a"
#[34] "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a" "a"

#Base composition of a DNA sequence

table(covid19seq) #store the variable as table

# Output:  a    c    g    t 
#         8954 5492 5863 9594 
#This means that the SARS-Cov-2 genome sequence has 8954 As, 5492 Cs, 5863 Gs and 9594 Ts


#GC Content in SARS-Cov-2 sequence

GC(covid19seq)

#output: [1] 0.3797278 which means is 37.9727%

# alternative option use formula GCcontent = (number of Gs + number of Cs)*100/(genome length).

#> (5863+5492)*100/(8954+5492+5863+9594)
#[1] 37.97278

#calculating the number of occurrences of DNA words in SARS-Cov-2 genome sequence

#DNA words that are 1 nucleotide long, 2 nucleotides long (ie."AA", "AG", "AC", "AT", "CA") or 3 nucleotides long (eg. "AAA", "AAT"), 4 nucleotides long, etc.

count(covid19seq, 1)

#  a    c    g    t 
#8954 5492 5863 9594 

count(covid19seq, 2)

#aa   ac   ag   at   ca   cc   cg   ct   ga   gc   gg   gt   ta   tc   tg   tt 
#2880 2023 1742 2308 2084  888  439 2081 1612 1168 1093 1990 2377 1413 2589 3215 

count(covid19seq, 3)
#aaa  aac  aag  aat  aca  acc  acg  act  aga  agc  agg  agt  ata  atc  atg  att  caa  cac  cag  cat  cca  ccc  ccg  cct  cga  cgc  cgg 
#923  615  580  761  809  376  164  674  605  301  329  507  471  339  725  773  703  459  438  484  354  116   74  344   95   97   76 
#cgt  cta  ctc  ctg  ctt  gaa  gac  gag  gat  gca  gcc  gcg  gct  gga  ggc  ggg  ggt  gta  gtc  gtg  gtt  taa  tac  tag  tat  tca  tcc 
#171  561  287  495  738  535  340  297  440  372  187   88  521  282  223  134  454  469  269  552  700  719  609  427  622  549  209 
#tcg  tct  tga  tgc  tgg  tgt  tta  ttc  ttg  ttt 
#113  542  630  547  554  858  876  518  817 1004 