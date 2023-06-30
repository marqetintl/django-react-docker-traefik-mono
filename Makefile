
PHONY: dbuildmono

dup:
	docker compose up --build

dbuildmono:
	docker build -f Dockerfile.mono.dev -t miq/mono:dev  .

dprune:
	docker system prune -f

dconfig:
	docker compose config


