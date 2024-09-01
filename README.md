# Overview
## Question 1
### part A:
- In this question we need to remove empty line in order to implement it we had used grep command along with "-v" flag that us used to remove things with the given pattern
- command:
```sh
    grep -v '^$' quotes.txt > quotes_empty.txt
```
#### working:
- we have selecected all blank lines using '^$' which is then removed using flag -v from file name quotes.txt which is then overridden to quotes_empty.txt

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

### part B:
- In this we need to remove duplicate quotes
- Command:
```sh
   awk '!seen[$0]++' quotes.txt |grep -v '^$'> quotes_rdup.txt 
```
#### working:
- To select unique quotes we have used seen that means when it sees same quotes it wont add then removed all empty lines then redirected to quotes_rdup.txt.

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

### part C:
- In this question we need to print the number of quotes by personality.
- Command:
```sh
    awk '!seen[$0]++' quotes.txt | grep -o '~[A-Za-z ]*$' | grep -o '[A-Za-z ]*'| awk '{count[$0]++} END {for (word in count) print count[word], word}' > quotes_byperson.txt
```
#### working:
- In order to select person with along with their count we first filter out the duplicate quote using !seen[$0] and then select all word that is the end of quote and start with ~ then we remove ~ i.e we just want name. Then we count the occurances and print occurances with count.
 
#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

### part D:
- In this we need to select all words that start 's' and doesn't followed by 'a'
- Command:
```sh
    grep -o '[s][A-Za-z]\+' quotes.txt | grep -v '^sa'
```
#### working:
- In order to select words with starting as s and not followed by a. we select all word that start with and then deselect all word with sa as we dont want these word as s followed by a.

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

## Question 2
### part A:
- We need to generate word with length 8 to 10. with condition length should be in range 8-10 with atleast one upper char, atleast one lower case and atleast one symbol from "%&#$@()!". and non of character should appear more then ones.

#### working:
- In order to generate word length from 8 to 10 we randomize the process using random function. and then select one uppercase, one lower case and one symbole we randomly generate their position in a way that non of their position is same and then we generate other characters. then we finally check the max occurance of word if more then 4 then we generate again.

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

### part B:
- Generate an account number for banks with length not less than 12 characters and not more than 14 characters containing only numbers i.e [0-9] without repetition. The first character of the account number should not be zero. The account number should not form a Fibonacci series in any part of the overall string. The account number should not have a repeated number for more than 3 times i.e. it should have 666 or 555 in any part of the account number

#### working:
- we applied the same approach as part A i.e randomly generated number between 12 to 14 using set. and then generated 1st character until we dont get 0. then generated remaining characters. finally we count the consecutive occurances if more then 3 then we generate again.

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

## Question 3
### part A:
- When the script is executed from the current directory, it should print all the directories ONLY present in its current directory.
- command:
```sh
    options=$(ls -d */)
    for i in $options; do 
        # Remove the trailing slash
        dir_name=${i%/}
        echo "$dir_name"
    done
```
#### working:
- we first select all files that are directory using -d flag then we loop through all directory and remove / from name and then print directory

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

### part B:
- The output should sort the directory listing by size in increasing order
- command:
```sh
    options=$(ls -t -d */)
    for i in $options; do 
        # Remove the trailing slash
        dir_name=${i%/}
        
        # Get the size of the directory
        dir_size=$(du -sh "$dir_name" | awk '{print $1}')
        
        # Print the directory name along with its size
        echo "$dir_name $dir_size"
    done
```
#### working:
- we emplied same approach as previous with extra flag that sort according to size using -s flag and we need human redable so we use -h flag.

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

## Question 4
### part A:
- Create a directory temp_activity
- command:
```sh
    mkdir temp_activity
```
#### working:
- mkdir makes folder 

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

### part B:
- Inside this directory, create files temp<i>.sh, substitute <i> with numbers from 1 to 50. Thus, you’ll have 50 files with names temp1.sh, temp2.sh, … Achieve this with a single command without loop
- command:
```sh
    touch temp{1..50}.sh
```
#### working:
- touch command makes folder in which we sent range 1 to 50

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

### part C:
- Change the extensions of files from temp1 to temp25 from sh to txt 
- Additional Note: All the requirements should be addressed via single SHELL script.

- command:
```sh
    for ((i=1; i<26; i++));
    do
        mv temp$i.sh temp$i.txt
    done
```
#### working:
- used simple for loop then mv command to rename file.

#### Execution
```sh
    chmod +x file_name.sh
    ./<file_name>.sh
```
> Note: file must be in `+x` before we execute

