# MIGRATIONS_DIR_FINANCE := ./finance-service-src/database/migrations
# MIGRATIONS_DIR_CUSTOMER := ./customer-service/database/migrations




# usage: make migrate-create name=create_users_table
migrate-create:
	migrate create -ext sql -dir $(MIGRATIONS_DIR) -seq $(name)
	

## Generate a new migration file: make migrate-create-rust name=create_users
migrate-create-rust:
	@test -n "$(name)" || (echo "Usage: make migrate-create-rust name=<migration_name>" && exit 1)
	sqlx migrate add -r --sequential --source $(MIGRATIONS_DIR_FINANCE) $(name)

# Migrations
migrate-up:
	migrate -path $(MIGRATIONS_DIR) -database "$(DATABASE_URL)" up

migrate-down:
	migrate -path $(MIGRATIONS_DIR) -database "$(DATABASE_URL)" down 1

sqlc:
	#generate sql commands
	sqlc generate