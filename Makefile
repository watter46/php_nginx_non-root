build:
				docker compose build --no-cache --force-rm
ps:
				docker ps -a --no-trunc
up:
				@make build
				docker compose up -d
down:
				docker compose down
logs:
				docker compose logs
app:
				docker compose exec app bash
web:
				docker compose exec web bash

# ホストのUID GID取得
env:
				bash make_env.sh

# UID GID取得からコンテナ起動
init:
				@make env
				@make up
