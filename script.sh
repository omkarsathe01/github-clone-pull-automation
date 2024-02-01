#!/bin/bash

echo "Visit https://github.com/omkarsathe01/github-clone-pull-automation#automating-clone-and-pull-operations-for-user for any help!"

# Check if jq is installed
if ! command -v jq &> /dev/null; then
  echo "Error: jq is required for this script. Please install jq (https://stedolan.github.io/jq/)"
  exit 1
fi

read -p "📝 Enter Your GitHub Username: " USER_NAME
read -sp "🔑 Enter Your GitHub Bearer Token: " GITHUB_TOKEN
echo 

# Make the API request with user name and access token
response=$(curl -s -H "Authorization: Bearer $GITHUB_TOKEN" https://api.github.com/search/repositories?q=user:$USER_NAME)


# Check if the response contains items
if [ "$(echo "$response" | jq '.items')" == "null" ]; then
  echo "Oh ho! No repositories found 😢"
  exit 1
fi

total_count=$(echo "$response" | jq -r '.total_count')
urls=($(echo "$response" | jq -r '.items[] | .html_url'))

echo "Relax and have a cup of coffee 🍵 while I'm doing my work 😊"

for ((i = 0; i < $total_count; i++)); do
  url=${urls[i]}
  repo_name=$(echo "$url" | sed 's|.*/\(.*\)$|\1|')
  repo_path="./$repo_name"

  # Print progress bar
  progress=$((i * 100 / total_count))
  printf "\rProgress: [%-50s] %d%% - $repo_name..." $(printf "#%.0s" $(seq 1 $((progress / 2)))) "$progress"

  if [ -d "$repo_path" ]; then
    # Repository exists, pull latest changes
    git -C "$repo_path" pull > /dev/null 2>&1
  else
    # Repository does not exist, clone it
    git clone "$url" "$repo_path" > /dev/null 2>&1
  fi
done

# Print progress bar for completion
printf "\rProgress: [%-50s] 100%%" "##################################################"
sleep 1

echo -e "\033[K"
echo
echo "$total_count/$total_count done."
echo "Thanks for using the script!"
echo "Help us improve by sharing feedback at omkarsathe.pers@gmail.com"
