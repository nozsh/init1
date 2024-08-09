#!/bin/bash

# Config file path
config_file="ssh.v3.cfg"

# CFG Exist or Not
if [[ ! -f "$config_file" ]]; then
  echo "Configuration file not found: $config_file"
  exit 1
fi

# Write data from config file to array
hostmachine=()
while IFS= read -r line || [[ -n "$line" ]]; do
  line=$(echo "$line" | xargs)  # Removing spaces at start and end of line
  if [[ -n "$line" && "$line" != \#* ]]; then
    hostmachine+=("$line")
  fi
done < "$config_file"

# Debug array output
echo "- Read configurations:"
for ((i = 0; i < ${#hostmachine[@]}; i++)); do
  echo "- $i: ${hostmachine[i]}"
done

# SSH Connection function
connect_to_hostmachine() {
  local user=$1
  local ip=$2
  echo "Executing command: ssh $user@$ip"  # Output SSH command
  ssh "$user@$ip"
}

# Table Message
message="\n"
for ((i = 0; i < ${#hostmachine[@]}; i++)); do
  hostmachine_info=(${hostmachine[i]})
  message+="- [$(printf "%02d" $((i + 1)))]: (${hostmachine_info[0]}) ${hostmachine_info[1]}\n"
done
message+="- [**]: Exit\n"

echo -e "$message"

# Choice of user
read -p $'- $: ' choice
echo -e -n "\n"

# Handling user choice
if [[ $choice =~ ^[0-9]+$ && $choice -le ${#hostmachine[@]} ]]; then
  hostmachine_info=(${hostmachine[$((choice - 1))]})
  if [[ ${#hostmachine_info[@]} -ne 3 ]]; then
    echo "Invalid host information: ${hostmachine_info[@]}"
    exit 1
  fi
  echo "Selected host info: ${hostmachine_info[@]}"  # Output selected host info
  connect_to_hostmachine "${hostmachine_info[1]}" "${hostmachine_info[2]}"
else
  echo -e -n "- EXIT\n"
  exit 0
fi