# 定義するDocker Composeファイル
# コンテナをビルドして起動
up:
	@docker compose up --build

# コンテナを停止して削除
down:
	@docker compose down

# MySQLとLaravelのログを表示
logs:
	@docker compose logs -f

# コンテナ内のシェルにアクセス
shell:
	@docker compose exec app bash

# マイグレーションを実行
migrate:
	@docker compose exec app php artisan migrate --force

# シーディングを実行
seed:
	@docker compose exec app php artisan db:seed --force

# キャッシュをクリア
clear:
	@docker compose exec app php artisan cache:clear
	@docker compose exec app php artisan config:clear
	@docker compose exec app php artisan route:clear
	@docker compose exec app php artisan view:clear

# アプリケーションの再ビルド
rebuild:
	@docker compose down
	@docker compose up --build -d
