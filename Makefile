NAME = onion

all: up show-onion

help:
	@ echo "\033[0;31m  You need help ? Try with one of these commands :\033[0;39m"
	@ echo ""
	@ awk 'BEGIN {FS = ":.*##";} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@ echo ""

up: ## Launch in background
	@ cp ~/.ssh/id_rsa.pub ./srcs/id_rsa.pub
	@ docker compose -f ./srcs/docker-compose.yml up -d

build: ## Build (use make start after, to launch)
	@ docker compose -f ./srcs/docker-compose.yml build

start: ## Begin
	@ docker compose -f srcs/docker-compose.yml start

down: ## Stop
	@ docker compose -f srcs/docker-compose.yml down

reload: ## Restart
	@ docker compose -f srcs/docker-compose.yml up --build

status: ## Display status
	@ docker ps

logs: ## See logs
	@ docker compose -f ./srcs/docker-compose.yml logs

clean: down ## Stop & Clean docker (prune -f)
	@ docker system prune -f

prune: down ## Remove all dockers on this system (prune -a)
	@ docker system prune -a

fclean: down prune ## Remove all dockers on this system & Remove persistant datas
	@ rm ./srcs/id_rsa.pub

show-onion: ## Display the .onion address for the service
	@ echo -n "\033[0;31m  Onion address : \033[0;39m"
	@ docker exec $(shell docker ps --filter "name=srcs-onion-1" -q) cat /var/lib/tor/hidden_service/hostname


.PHONY: fclean prune clean logs status reload down start build up help show-onion all
