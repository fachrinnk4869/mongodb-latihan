#!/bin/bash

# Function to perform the MongoDB dump
function dump_on_exit() {
    echo "Performing MongoDB dump before exiting..."
    mongodump --out /dump
    echo "MongoDB dump completed."
}

# Set up a trap to run the dump_on_exit function when the shell exits
trap dump_on_exit EXIT

# Start the MongoDB shell
mongosh
