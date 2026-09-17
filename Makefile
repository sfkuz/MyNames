# Загружаем переменные из .env
include .env
export

MIGRATIONS_DIR = migrations
DB_URL = ${DATABASE_URL}
PYTHON = python3

.PHONY: up down create status

## Применить все миграции
up:
	@$(PYTHON) -m yoyo apply $(MIGRATIONS_DIR) --database $(DB_URL)

## Откатить последнюю миграцию
down:
	@$(PYTHON) -m yoyo rollback $(MIGRATIONS_DIR) --database $(DB_URL) --all

## Создать новую миграцию (пример: make create name=add_users_table)
create:
	@$(PYTHON) -m yoyo new --sql $(MIGRATIONS_DIR) --message "$(name)"

## Проверить состояние миграций
status:
	@$(PYTHON) -m yoyo list $(MIGRATIONS_DIR) --database $(DB_URL)
