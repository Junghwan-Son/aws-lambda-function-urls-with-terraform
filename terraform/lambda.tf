resource "aws_lambda_function" "lambda" {
  function_name = var.function_name
  filename      = "lambda.zip"
  handler       = "handler"
  role          = aws_iam_role.lambda.arn

  source_code_hash = filebase64sha256("lambda.zip")
  runtime = "go1.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}