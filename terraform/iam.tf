resource "aws_iam_role" "lambda" {
  name = "iam_${var.function_name}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com"
        ]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}


resource "aws_iam_policy" "lambda" {
  name = "policy_${var.function_name}"
  policy = templatefile("policy.json.tpl", {
    aws_account_id = data.aws_caller_identity.current.account_id
    aws_region = var.aws_region,
    function_name = var.function_name
  })
}

resource "aws_iam_role_policy_attachment" "iam_for_lambda" {
  role = aws_iam_role.lambda.name
  policy_arn = aws_iam_policy.lambda.arn
}
