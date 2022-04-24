{
  "Version": "2012-10-17",
  "Statement": [
    {
    "Effect": "Allow",
    "Action": "logs:CreateLogGroup",
    "Resource": "arn:aws:logs:${aws_region}:${aws_account_id}:*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "arn:aws:logs:${aws_region}:${aws_account_id}:log-group:/aws/lambda/${function_name}:*"
      ]
    }
  ]
}