#!make

help: _header
	${info }
	@echo Opciones:
	@echo --------------------------------
	@echo start / start-ngrok
	@echo stop
	@echo update
	@echo workspace
	@echo export
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

_urls-ngrok:
	${info }
	@echo -------------------------------
	@echo [n8n] http://localhost:5678
	@echo [Mailpit] http://localhost:8025
	@echo [ngrok] http://localhost:4040
	@echo -------------------------------

_start-command:
	@docker compose up -d --remove-orphans

start: _start-command _urls

_start-command-ngrok:
	@docker compose -f docker-compose.yml -f docker-compose.ngrok.yml up -d --remove-orphans

start-ngrok: _start-command-ngrok _urls-ngrok

stop:
	@docker compose -f docker-compose.yml -f docker-compose.ngrok.yml down

update:
	@docker compose -f docker-compose.yml -f docker-compose.ngrok.yml pull

workspace:
	@docker compose exec n8n /bin/sh

export:
	@python export.py

clean:
	@docker compose down -v --remove-orphans
