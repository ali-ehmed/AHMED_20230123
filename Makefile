yarn_install:
	yarn install
bundle_install:
	bundle install
install:
	make yarn_install bundle_install
db_setup:
	rails db:drop db:create db:migrate db:seed
server:
	$(BUNDLE_EXEC) rails server
test:
	$(BUNDLE_EXEC) rspec $(FILES)
frontend:
	./bin/webpacker-dev-server
