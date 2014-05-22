WEBKIT_BIN = ./node_modules/.bin/nodewebkit
COFFEE_BIN = ./node_modules/.bin/coffee

.PHONY: clean

start:
	$(WEBKIT_BIN) .

clean:
	rm -rf ./build

build: clean
	$(COFFEE_BIN) --compile --output ./build/js ./app/coffee	
	cp ./app/index.html ./build/
	cp ./app/lib/*.js ./build/js/
