build:
				docker compose build --no-cache --force-rm
ps:
				docker ps -a --no-trunc
up:
				@make build
				docker compose up -d
down:
				docker compose down
laravel-install:
				docker compose exec app composer create-project --prefer-dist laravel/laravel .  "6.*"
create-project:
				mkdir -p backend
				@make up
				@make laravel-install
				docker compose exec app php artisan key:generate
				docker compose exec app php artisan storage:link
				docker compose exec app chmod -R 777 storage bootstrap/cache
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
