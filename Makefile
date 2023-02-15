# Variables
DOCKER = docker
DOCKER_COMPOSE = docker-compose
EXEC = $(DOCKER) exec -w /srv/app n3mesis-03fz885fv3t8-php-1
PHP = $(EXEC) php
COMPOSER = $(EXEC) composer
NPM = $(EXEC) npm
SYMFONY_CONSOLE = $(PHP) bin/console

## --- 🔥App ---
init: ## Init the project
	$(MAKE) docker-start
	$(MAKE) composer-install
	@echo The application is available at: https://localhost/.
	
cache-clear: ##Clear cache
	$(SYMFONY_CONSOLE) cache:clear

## --- 🐋Docker ---
docker-start: ## Start app
	$(DOCKER_COMPOSE) up -d

docker-stop: ## Stop app
	$(DOCKER_COMPOSE) stop

docker-ps: ## List containers
	$(DOCKER_COMPOSE) ps

## --- 🎻Composer ---
composer-install: ## Install dependencies
	$(COMPOSER) install --prefer-dist --no-autoloader --no-scripts
