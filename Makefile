WEBKIT_BIN = ./node_modules/.bin/nodewebkit
COFFEE_BIN = ./node_modules/.bin/coffee
BOWER_BIN = ./node_modules/.bin/bower
GULP_BIN = ./node_modules/.bin/gulp
COFFEE = --require coffee-script/register

.PHONY: clean

install:
	npm install
	$(BOWER_BIN) install

clean:
	rm -rf ./build

# build: clean install
# 	$(GULP_BIN) build $(COFFEE)

build: clean install
	$(COFFEE_BIN) --compile --output ./build/js ./app/coffee	
	cp ./app/index.html ./build/
	cp ./app/lib/**/*.min.js ./build/js/
	mkdir ./build/css
	cp ./app/css/*.css ./build/css/

start: build
	$(WEBKIT_BIN) .