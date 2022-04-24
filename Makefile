.PHONY: test clean

zip: build
	rm -rf bin/
	mkdir bin/
	zip bin/lambda src/$<
	rm src/$<

build: src/main.go
	cd src/ && go get .
	cd src/ && GOOS=linux GOARCH=amd64 go build -o $@