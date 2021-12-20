#!/bin/bash

# script details
SCRIPT_NAME="asghar.sh"
SCRIPT_VERSION="1.0"
SCRIPT_AUTHOR="BalliAsghar"
SCRIPT_DESCRIPTION="This small script will fetch resources from Jsonplaceholder API and store it in a file"


# welcome message
echo "Welcome to the asghar script"

# color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
BOLDGREEN="\033[0;32m"
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# variables
options[1]="posts"
options[2]="comments"
options[3]="albums"
options[4]="photos"
options[5]="todos"
options[6]="users"

# echo options
echo "choose option eg. 3" 
echo -e "1. ${RED}100 posts${NC}" 
echo -e "2. ${YELLOW}500 comments${NC}" 
echo -e "3. ${BLUE}100 albums${NC}"
echo -e "4. ${PURPLE}5000 photos${NC}"
echo -e "5. ${CYAN}200 todos${NC}"
echo -e "6. ${BOLDGREEN}10 users${NC}"

# read option
read -p "Enter your option: " option

# if input is not a number or is not between 1 and 6 or is empty then exit
if ! [[ "$option" =~ ^[0-9]+$ ]] || [[ "$option" -lt 1 ]] || [[ "$option" -gt 6 ]] || [[ -z "$option" ]]; then
    echo -e "${RED}Error:${NC} Please enter a number between 1 and 6"
    exit 1
fi

# fetch data based on option and save to file
curl -X GET http://jsonplaceholder.typicode.com/${options[$option]} > ${options[$option]}.json
echo -e "${GREEN}Success:${NC} Data fetched and saved to ${options[$option]}.json"
