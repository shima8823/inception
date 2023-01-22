include srcs/.env

.PHONY: all
all: set_domain set_volume_dir
	docker-compose -f srcs/docker-compose.yml up -d

.PHONY: exec_nginx
exec_nginx:
	docker exec -it nginx bash

.PHONY: exec_mariadb
exec_mariadb:
	docker exec -it mariadb bash

.PHONY: exec_wordpress
exec_wordpress:
	docker exec -it wordpress bash

# -------------------- set up -------------------- #
.PHONY: set_domain
set_domain:
	@if ! grep "127.0.0.1\t${DOMAIN_NAME}" /etc/hosts > /dev/null; then \
		echo "add domain in /etc/hosts"; \
		echo "127.0.0.1\t${DOMAIN_NAME}" | sudo tee -a /etc/hosts; \
	fi

.PHONY: set_volume_dir
set_volume_dir:
	@if [ ! -d ${VOLUME_DIR}/html ] ; then \
		sudo mkdir -p ${VOLUME_DIR}/html; \
	fi
	@if [ ! -d ${VOLUME_DIR}/database ] ; then \
		sudo mkdir -p ${VOLUME_DIR}/database; \
	fi
# ------------------------------------------------ #

# -------------------- delete etc -------------------- #
.PHONY: clean
clean:
	docker-compose -f srcs/docker-compose.yml down -v --rmi all
	rm -rf ${VOLUME_DIR}/database/*
	rm -rf ${VOLUME_DIR}/html/*

.PHONY: clean_image
clean_image:
	docker-compose -f srcs/docker-compose.yml down --rmi all

# ---------------------------------------------------- #

.PHONY: re
re: clean all

.PHONY: re_image
re_image: clean_image all
