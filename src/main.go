package main

import (
	"fmt"
	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
	"net/http"
)

func handleRequest(req events.APIGatewayProxyRequest) (events.APIGatewayProxyResponse, error) {

	queryParams, res := GetQueryParameters(req)
	if res == nil {
		return *res, nil
	}

	return events.APIGatewayProxyResponse{
		StatusCode: http.StatusOK,
		Headers:    map[string]string{"Content-Type": "text/plain; charset=utf-8"},
		Body:       fmt.Sprintf("QueryParams. Skip: %d, Limit %d", queryParams.skip, queryParams.limit),
	}, nil
}

func main() {
	lambda.Start(handleRequest)
}
