.PHONY: test clean

zip: build
	rm -f terraform/lambda.zip
	cd src/ && zip ../terraform/lambda handler
	rm src/handler


build: src/main.go
	cd src/ && go get .
	cd src/ && GOOS=linux GOARCH=amd64 go build -o handler


deploy: terraform/lambda.zip
	cd terraform && terraform apply
