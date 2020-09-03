NAME := php-template
PHP_IMAGE := php:7.4.9
COMPOSER_IMAGE := composer:1.10

.PHONY: dev/run
dev/run:
	docker run -it \
		--name $(NAME)-dev \
		--rm \
		--mount type=bind,src="$(PWD)",dst="/app",readonly \
		-p "8080:8080" \
		$(PHP_IMAGE)-cli \
		php -S 0.0.0.0:8080 -t /app/src/Infrastructure/Web/public/

.PHONY: dev/composer
dev/composer:
	docker run -it \
		--name $(NAME)-composer \
		--rm \
		--mount type=bind,src="$(PWD)",dst="/app" \
		--user $(shell id -u):$(shell id -g) \
		$(COMPOSER_IMAGE) /bin/bash

.PHONY: dev/lint
dev/lint:
	docker run -it \
		--name $(NAME)-lint \
		--rm \
		--mount type=bind,src="$(PWD)",dst="/app",readonly \
		-w /app \
		$(PHP_IMAGE)-cli \
		vendor/bin/phpstan analyse --level max src

.PHONY: dev/test
dev/test:
	docker run -it \
		--name $(NAME)-test \
		--rm \
		--mount type=bind,src="$(PWD)",dst="/app" \
		-w /app \
		$(PHP_IMAGE)-cli \
		vendor/bin/phpunit --testdox test
