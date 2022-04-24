.PHONY: test clean

zip: build
	rm -f terraform/lambda.zip
	zip terraform/lambda src/handler
	rm src/handler


build: src/main.go
	cd src/ && go get .
	cd src/ && GOOS=linux GOARCH=amd64 go build -o handler