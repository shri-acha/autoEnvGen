#!/bin/bash

function handle_js() {

  PRE_ENV_VARIABLES="$( echo "$FILE_CONTENTS" | grep process.env )" # Stores the grepped raw data
  ENV_VARIABLES=()

  readarray -t ENV_VARIABLE <<< "$PRE_ENV_VARIABLES" # Stores the lines as array elems

  for i in "${ENV_VARIABLE[@]}"; do 
   
  if [[ "$i" =~ process\.env\.([A-Za-z0-9_-]+) ]]; # Regex pattern matching magic
    then
      VARIABLE="${BASH_REMATCH[1]}" 
      ENV_VARIABLES+=("${VARIABLE}")
    fi
  done;
  if [[ ! -f env.example ]]; # Only adds new data, if no .env.example exists
  then
    touch env.example
    for VAR in ${ENV_VARIABLES[@]};do
      echo "$VAR =" >> env.example
    done;
  fi
}

handle_py () {

  PRE_ENV_VARIABLES="$( echo "$FILE_CONTENTS" | grep os.environ )" # Stores the grepped raw data
  ENV_VARIABLES=()

  readarray -t ENV_VARIABLE <<< "$PRE_ENV_VARIABLES" # Stores the lines as array elems

  for i in "${ENV_VARIABLE[@]}"; do 
   
  if [[ "$i" =~ os\.environ\[\'([A-Za-z0-9_-]+)\'\] ]]; # Regex pattern matching magic
    then
      VARIABLE="${BASH_REMATCH[1]}" 
      ENV_VARIABLES+=("${VARIABLE}")
    fi
  done;
  if [[ ! -f env.example ]]; # Only adds new data, if no .env.example exists
  then
    touch env.example
    for VAR in ${ENV_VARIABLES[@]};do
      echo "$VAR =" >> env.example
    done;
  fi
}


FILE_PATH=$1
FILE_NAME=$( basename $FILE_PATH )

FILE_TYPE=$( basename $FILE_PATH | cut -d'.' -f 2 ) 

FILE_CONTENTS="$(cat $FILE_PATH)"

if [[ $FILE_TYPE == "py" ]];
then
  handle_py

elif [[ $FILE_TYPE == "js" ]]; 
then
  handle_js
fi
