#!/bin/bash

# List queues and use fzf to select one

# Check if an argument is passed
if [ -n "$1" ]; then
  # List queues and filter for the one that matches the argument
  matching_queues=$(aws sqs list-queues | jq -r '.QueueUrls[]' | grep "$1")

  # Check if exactly one matching queue URL is found
  if [ $(echo "$matching_queues" | wc -l) -eq 1 ]; then
    selected_queue="$matching_queues"
  else
    echo "No matching queue found or multiple queues found. Please select manually."
    selected_queue=$(aws sqs list-queues | jq -r '.QueueUrls[]' | fzf -q "$1")
  fi
else
  # List queues and use fzf to select one
  selected_queue=$(aws sqs list-queues | jq -r '.QueueUrls[]' | fzf)
fi

# Check if a queue was selected
if [ -z "$selected_queue" ]; then
  echo "No queue selected. Exiting."
  exit 1
fi

echo "✨ Selected Queue URL: $selected_queue"
echo ""

# Get the approximate number of messages in the queue
message_count=$(aws sqs get-queue-attributes --queue-url "$selected_queue" --attribute-names ApproximateNumberOfMessages | jq -r '.Attributes.ApproximateNumberOfMessages')
echo "Approximate number of messages in the queue: $message_count"
echo ""

# Fetch and print messages in a nicely formatted way
#  - Fetch up to 10 messages
#  - Wait for 2 seconds for messages to arrive
#  - Set the visibility timeout to 10 seconds to prevent other consumers from processing the same message
response=$(aws sqs receive-message --queue-url "$selected_queue" --max-number-of-messages 10 --wait-time-seconds 2 --visibility-timeout 20)

if [[ -z "$response" || "$response" == "{}" ]]; then
  echo "No messages found in the queue."
else
  echo "Messages found:"
  echo "$response" | jq -r '.Messages[] | "Message ID: \(.MessageId)\nBody:\n\(.Body | fromjson | .)\n---"'
fi
