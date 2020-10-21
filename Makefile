# make
DC=docker-compose
STAGE=local

# Docker
build:
	@$(DC) build
up:
	@$(DC) up -d
down:
	@$(DC) down
restart:
	@$(DC) restart
reload:
	@$(DC) down
	@$(DC) up -d
ps:
	@$(DC) ps

laravel:
	@$(DC) exec php composer create-project --prefer-dist laravel/laravel="7.*"
	mv laravel/* ./
	mv laravel/.[^\.]* ./
	rm -r laravel

setting-files:
	@cp .env-$(STAGE) .env
	@cp docker-compose-$(STAGE).yml docker-compose.yml

install:
	@make setting-files

	@$(DC) exec php composer install

	
# yarn:
# 	@$(DC) run --rm yarn $(C)