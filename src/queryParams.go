package main

import (
	"github.com/aws/aws-lambda-go/events"
	"net/http"
	"strconv"
)

type QueryParams struct {
	skip  int
	limit int
}

func GetQueryParameters(req events.APIGatewayProxyRequest) (*QueryParams, *events.APIGatewayProxyResponse) {
	skip, ok := req.QueryStringParameters["skip"]
	if !ok {
		res := events.APIGatewayProxyResponse{
			StatusCode: http.StatusBadRequest,
		}
		return nil, &res
	}

	skipInt, err := strconv.Atoi(skip)
	if err != nil {
		res := events.APIGatewayProxyResponse{
			StatusCode: http.StatusBadRequest,
		}
		return nil, &res
	}

	limit, ok := req.QueryStringParameters["limit"]
	if !ok {
		res := events.APIGatewayProxyResponse{
			StatusCode: http.StatusBadRequest,
		}
		return nil, &res
	}

	limitInt, err := strconv.Atoi(limit)
	if err != nil {
		res := events.APIGatewayProxyResponse{
			StatusCode: http.StatusBadRequest,
		}
		return nil, &res
	}

	if !ok {
		res := events.APIGatewayProxyResponse{
			StatusCode: http.StatusBadRequest,
		}
		return nil, &res
	}

	queryParams := QueryParams{
		skip:  skipInt,
		limit: limitInt,
	}

	return &queryParams, nil
}
