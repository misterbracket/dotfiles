#!/usr/bin/env bash

# Check if the "scripts" folder exists in the current directory
if [ ! -d "scripts" ]; then
	echo "Error: 'scripts' folder not found in the current directory. Maybe this is not a Pleo Moon?"
	exit 1
fi

CURRENT_MOON=$(basename "$(pwd)")

echo "Running Pleo Moon $CURRENT_MOON with local database"

cd ./scripts && ./run-service-with-local-database.sh
