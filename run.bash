#!/bin/bash

# Run Docker Compose in detached mode
docker compose up -d

# Check if the last command (docker compose up -d) was successful
if [ $? -eq 0 ]; then
    echo "Docker Compose started successfully, entering Mongo container..."
    # Execute the bash shell inside the Mongo container
    docker exec -it mongo /bin/bash
else
    echo "Docker Compose failed. Exiting."
fi
