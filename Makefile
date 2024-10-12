# Define the name of the Docker Compose file (optional)
COMPOSE_FILE = docker-compose.yml

# Run the Docker Compose services in detached mode and then enter the Mongo container
up:
	@echo "Starting Docker Compose..."
	@docker compose -f $(COMPOSE_FILE) up -d
	@if [ $$? -eq 0 ]; then \
		echo "Docker Compose started successfully, entering Mongo container..."; \
		docker exec -it mongo /bin/bash -c "/app/mongo_shell_with_dump.sh" \
	else \
		echo "Docker Compose failed. Exiting."; \
	fi

# Stop the Docker Compose services and remove the containers
down:
	@echo "Stopping Docker Compose services..."
	@docker compose -f $(COMPOSE_FILE) down
