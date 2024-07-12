#!/bin/bash

# Define the API endpoint
API_URL="https://labs.bible.org/api/?passage=random&type=json"

# Make the API call and store the response
response=$(curl -s $API_URL)


colorize_json() {
  local json=$1
  echo "$json" | sed -E \
    -e 's/"([^"]+)":/"\x1B[31m\1\x1B[0m":/g' 
}

# Check if response is not empty
if [[ -z "$response" ]]; then
  echo "Error: No response from API"
  exit 1
fi

# Colorize and print the JSON response
colorize_json "$response"
