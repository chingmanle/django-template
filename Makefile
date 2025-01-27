##
# Makefile configuration
# See: https://www.gnu.org/software/make/manual/make.html
SHELL := /bin/bash

.ONESHELL:
.DEFAULT_GOAL := help


.PHONY: build
build: ## Build the backend.
	docker-compose build

.PHONY: up
up: ## run the backend at the background.
	docker-compose up -d

.PHONY: stop
stop: ## stop the backend
	docker-compose stop

.PHONY: down
down: ## shutdown the backend
	docker-compose down

.PHONY: pytest
pytest: ## run pytest on the backend
	docker-compose run --rm test

.PHONY: bandit
bandit: ## run pytest on the backend
	docker-compose run --rm web bandit -r api myapp

.PHONY: coverage
coverage: ## run coverage on pytest
	docker-compose run web coverage run --source='.' manage.py test
	docker-compose run --rm web coverage report

.PHONY: black
black: ## run black on the codebase
	docker-compose run --rm web black api myapp

.PHONY: flake8
flake8: ## run flake8 on the codebase
	docker-compose run --rm web flake8 api myapp

.PHONY: copy-env
copy-env: ## copy .env.sample to .env
	cp .env.sample .env

.PHONY: migrate
migrate: ## Django migrate
	docker-compose run web python manage.py migrate

.PHONY: help
help:  ## Print this help information.
	grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sed 's/Makefile://' | \
		sort -d | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Silence output by default, use `VERBOSE=1 make <command>` to enable
ifndef VERBOSE
.SILENT:
endif