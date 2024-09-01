#!/bin/bash
grep -v '^$' quotes.txt > quotes_empty.txt


#part b
# grep '^' quotes.txt | uniq
awk '!seen[$0]++' quotes.txt |grep -v '^$'> quotes_rdup.txt 


#part c
awk '!seen[$0]++' quotes.txt | grep -o '~[A-Za-z ]*$' | grep -o '[A-Za-z ]*'| awk '{count[$0]++} END {for (word in count) print count[word], word}' > quotes_byperson.txt
#note 1st we selected unique quotes
#Then select all authors which is written at last of line 
#Then we remove ~ from each word 
#finally printing words with count

#part d
grep -o '[s][A-Za-z]\+' quotes.txt | grep -v '^sa'