#!make

help: _header
	${info }
	@echo Opciones:
	@echo --------------------------------
	@echo start
	@echo workspace
	@echo clean
	@echo --------------------------------

_header:
	@echo -------------
	@echo n8n en Docker
	@echo -------------

_urls:
	${info }
	@echo -------------------------------
	@echo [n8n] http://localhost:5678
	@echo [Mailpit] http://localhost:8025
	@echo -------------------------------

_start-command:
	@docker compose up -d

start: _start-command _urls

workspace:
	@docker compose exec n8n /bin/sh

clean:
	@docker compose down -v --remove-orphans
