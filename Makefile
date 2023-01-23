yarn_install:
	yarn install

bundle_install:
	bundle install

install:
	make yarn_install bundle_install

db_reset:
	./bin/rails db:reset

db_seed:
	./bin/rails db:seed

application_setup: install db_reset

server:
	$(BUNDLE_EXEC) rails server

test:
	$(BUNDLE_EXEC) rspec $(FILES)

frontend:
	./bin/webpacker-dev-server
