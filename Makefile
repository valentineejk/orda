start:

# usage: make migrate-create name=create_users_table
migrate-create:
	migrate create -ext sql -dir ./customer-service/database/migrations -seq $(name)


# Migrations
migrate-up:
	migrate -path ./customer-service/database/migrations -database "$(DATABASE_URL)" up

migrate-down:
	migrate -path ./customer-service/database/migrations -database "$(DATABASE_URL)" down 1

sqlc:
	#generate sql commands
	sqlc generate