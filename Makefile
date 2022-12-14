HOME_DIR = /home/testuser
HOME_DATA = $(HOME_DIR)/data

define task =
if grep -q docker /etc/group
then
		touch .rootless
		echo "docker group already exists"
else
		sudo groupadd docker
fi
sudo usermod -aG docker $$USER
endef

all: ls

.ONESHELL:

.PHONY: all down re clean fclean setup ls

.rootless:
	@$(task)

setup: .rootless
	@echo "setup"
	@sudo chmod a+w /etc/hosts && sudo cat /etc/hosts | grep testuser.42.fr || \
	sudo echo "127.0.0.1 testuser.42.fr" >> /etc/hosts

	@sudo mkdir -p $(HOME_DATA)/mariadb && sudo chmod 777 $(HOME_DATA)/mariadb
	@sudo mkdir -p $(HOME_DATA)/wordpress && sudo chmod 777 $(HOME_DATA)/wordpress

.up: setup
	@echo "Preparing containers, please wait..."
	@sudo docker-compose -f srcs/docker-compose.yml up -d > /dev/null
	@touch .up

ls: .up
	@sudo docker-compose -f srcs/docker-compose.yml ps

down:
	@sudo docker-compose -f srcs/docker-compose.yml down

re:
	@sudo docker-compose -f srcs/docker-compose.yml build --no-cache

clean:
	@sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	@sudo -n sed '/127.0.0.1 testuser.42.fr/d' /etc/hosts -n
	@sudo rm -rf $(HOME_DIR) .up .rootless

fclean: clean
	@sudo docker system prune --volumes --all --force

re: fclean all
