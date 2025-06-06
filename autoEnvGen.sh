#!/bin/bash

function handle_js() {
  FILE_PATH=$1
  FILE_CONTENTS=$(cat $FILE_PATH)
  PRE_ENV_VARIABLES=$( echo "$FILE_CONTENTS" | grep process.env ) # Stores the grepped raw data
  ENV_VARIABLES=()
    
  readarray -t ENV_VARIABLE <<< "$PRE_ENV_VARIABLES" # Stores the lines as array elems


  for i in "${ENV_VARIABLE[@]}"; do  
  if [[ "$i" =~ process\.env\.([A-Za-z0-9_-]+) ]]; # Regex pattern matching magic
    then
      VARIABLE="$(echo ${BASH_REMATCH[1]})" 
      ENV_VARIABLES+=("${VARIABLE}")
    fi
  done;
  echo ${ENV_VARIABLES[@]}
}

handle_py () {

  PRE_ENV_VARIABLES="$( echo "$FILE_CONTENTS" | grep os.environ )" # Stores the grepped raw data
  ENV_VARIABLES=()

  readarray -t ENV_VARIABLE <<< "$PRE_ENV_VARIABLES" # Stores the lines as array elems

  for i in "${ENV_VARIABLE[@]}"; do 
   
    if [[ "$i" =~ os\.environ[\[\(][\'\"]([A-Za-z0-9_-]+)[\'\"][\]\)] ]]; # Regex pattern matching magic
    then
      VARIABLE="${BASH_REMATCH[1]}" 
      ENV_VARIABLES+=("${VARIABLE}")
    fi
  done;
  echo ${ENV_VARIABLES[@]}
}


# Entry point
#
FILE_TYPE=$1 
ENV_VARIABLES=()

FILE_PATHS=$(find . \
  -type d \( -wholename './.*' -o -name 'node_modules' \) -prune -false \
  -o -type f -name "*.$FILE_TYPE")

ENV_VARIABLES=()


readarray -t FILE_PATH_ARR <<< $FILE_PATHS

# For each file checking for env variables
#
for FILE_PATH in ${FILE_PATH_ARR[@]};
  do
  FILE_CONTENTS="$(cat $FILE_PATH)"

# For python file type
  if [[ $FILE_TYPE == "py" ]];
    then
      readarray -t ENV_VARIABLE <<< $(handle_py $FILE_PATH)
      for ENV_VAR in ${ENV_VARIABLE[@]};
      do
        ENV_VARIABLES+=($ENV_VAR)
      done

# For js/ts type
  elif [ $FILE_TYPE == "js" -o $FILE_TYPE == "ts" ]; 
    then
      readarray -t ENV_VARIABLE <<< $(handle_js $FILE_PATH)
      for ENV_VAR in ${ENV_VARIABLE[@]};
      do
        ENV_VARIABLES+=($ENV_VAR)
      done
  fi
done;

if [[ ! -f .env.example ]]; # Only adds new data, if no .env.example exists
then
  touch .env.example
  for VAR in ${ENV_VARIABLES[@]};do
    echo "$VAR =" >> .env.example 
  done;
fi

echo "$(awk '!seen[$0]++' .env.example)" > .env.example # Removes duplicate data, if any.
