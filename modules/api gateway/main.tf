resource "aws_apigatewayv2_api" "IoS_api" {
  name          = "IoS-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "integration_api" {
  api_id           = aws_apigatewayv2_api.IoS_api.id
  integration_type = "AWS_PROXY"

  integration_method        = "POST"
  integration_uri           = var.lambda_invoke_arn
}

resource "aws_apigatewayv2_route" "route_api" {
  api_id    = aws_apigatewayv2_api.IoS_api.id
  route_key = "POST /iot"

  target = "integrations/${aws_apigatewayv2_integration.integration_api.id}"
}

resource "aws_lambda_permission" "api_gateway_lambda" {
  statement_id  = "AllowExecutionFromApiGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.IoS_api.execution_arn}/*/*"
}

resource "aws_apigatewayv2_stage" "stage" {
  api_id      = aws_apigatewayv2_api.IoS_api.id
  name        = "$default"
  auto_deploy = true
}