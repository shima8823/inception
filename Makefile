.PHONY: all
all:
	docker-compose -f srcs/docker-compose.yml up -d

.PHONY: start
start:
	docker-compose -f srcs/docker-compose.yml start

.PHONY: stop
stop:
	docker-compose -f srcs/docker-compose.yml stop

.PHONY: clean
clean:
	docker-compose -f srcs/docker-compose.yml down

.PHONY: fclean
fclean: clean
	docker-compose -f srcs/docker-compose.yml down --rmi all

.PHONY: re
re: fclean all
