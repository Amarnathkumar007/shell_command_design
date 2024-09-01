#!/bin/bash
A_set=("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z")
B_set=("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z")
C_set=("%" "&" "#" "$" "@" "(" ")" "!")

char_sets=("$A_set" "$B_set" "$C_set")
#GENERATE  random number between 0-3
#generate random number between length 
#do till either 8 or 
len_set=(8 9 10) #length +1 is actual length

n=${len_set[$(($RANDOM % 3))]} #select number btw 8 to 10

generated_string=""

a_pos=$(($RANDOM % $n))
b_pos=$(($RANDOM % $n))
c_pos=$(($RANDOM % $n))

while [ $c_pos -eq $a_pos ] || [ $c_pos -eq $b_pos ] || [ $a_pos -eq $b_pos ]; do
    a_pos=$(($RANDOM % $n))
    b_pos=$(($RANDOM % $n))
    c_pos=$(($RANDOM % $n))
done

#debug
# echo "$n $a_pos $b_pos $c_pos"

while : ; do
    for ((i=0; i<$n; i++));
    do 
        if [[ $i -eq $a_pos ]]; then
            selected_char=${A_set[$(($RANDOM % 26))]}  #selecting character from set
            generated_string+=$selected_char
        elif [[ $i -eq $b_pos ]]; then
            selected_char=${B_set[$(($RANDOM % 26))]}  #selecting character from set
            generated_string+=$selected_char

        elif [[ $i -eq $c_pos ]]; then
            selected_char=${C_set[$(($RANDOM % 8 ))]}  #selecting character from set
            generated_string+=$selected_char

        else
            selected_set=${char_sets[$(($RANDOM % 3))]}  #selecting character from set
            selected_char=${selected_set[$(($RANDOM % ${#selected_set[@]}))]}
            generated_string+=$selected_char
        fi
    done

    occurrence=$(echo "$generated_string" | fold -w1 | sort | uniq -c | sort -nr | head -n1 | awk '{print $1}')

    [[ $occurance -lt 4 ]] && break #when occurrence is more then ones then we generate again
done

echo "$generated_string"