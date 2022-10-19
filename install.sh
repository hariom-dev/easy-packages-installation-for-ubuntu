#!/bin/bash

# Import gloabl files
source ./global.sh
bash ./global.sh

count_of_inputs=$#;

if [ $count_of_inputs -eq 0 ]; then
    echo -e "${Red}Please add 1 or multiple package name${End}"
    exit 404;
fi  

# Validate package name
count=1;
while [ $count -le $count_of_inputs ] 
do
    ELEMENTS=${#PACKAGES[@]}

    not_found_pkg_count=0  
    for (( i=0;i<$ELEMENTS;i++)); do

        package_name=${PACKAGES[${i}]}
        if [ $package_name == $1 ]; then
            not_found_pkg_count=0
            break
        else
            not_found_pkg_count=$((not_found_pkg_count + 1));
        fi        
    done
    
    if [ $not_found_pkg_count -gt 0 ]; then
        echo -e "${Red}$count: ${$count} package not found in pakages list${End}"
        exit 404;
    fi 
    not_found_pkg_count=0
    count=$((count + 1));
    shift 1;
done

# while [ $count -le $count_of_inputs ] 
# do
#     echo -e "${Red} $1 package not found in pakages list${End}"
#     source ./$1/install_$1.sh
#     bash ./$1/install_$1.sh
#     count=$((count + 1));
#     shift 1;
# done