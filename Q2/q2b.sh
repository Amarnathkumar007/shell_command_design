#!/bin/bash
len_set=(10 11 12) #since we need acc number in the range of 12..14 we randomize the process
acc_n=""
rend_len=$(( $RANDOM % 3)) #randomizing the length
len=${len_set[$rend_len]}

pre=$(($RANDOM % 10))
#generating 1st number that is not equls 0
while [ $pre -eq 0 ]; do
    pre=$(($RANDOM % 10))
done
acc_n+="$pre"

curr=$(($RANDOM % 10))
acc_n+="$curr"

while : ; do 
    for ((i=0; i<len; i++));
    do 
        temp=$((($RANDOM % 10)))
        next=$(($curr+$pre))
        #here we checking for fibbo occurance
        while [ $temp -eq $next ]; do
            temp=$(($RANDOM % 10))
        done
        temp=$(($temp%10))
        pre=$curr
        curr=$temp
        acc_n+="$curr"
    done

    prev_char=''
    max_count=0
    current_count=1

    for (( i=0; i<${#acc_n}; i++ )); do
        char=${acc_n:i:1} #taking character to check occurance
    
        if [[ $char == $prev_char ]]; then  #if same then increment
            ((current_count++))
        else
            current_count=1
        fi
        # update max_count if current_count is greater than max_count
        if ((current_count > max_count)); then
            max_count=$current_count
        fi
    
        prev_char=$char
    done
    # if max_count is less than 4 then break the loop otherwise we generate again
    if ((max_count < 4)); then
        break
    fi

done
echo $acc_n

