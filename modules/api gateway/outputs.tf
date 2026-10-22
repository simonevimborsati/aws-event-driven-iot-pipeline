output "api_url" {
  value = aws_apigatewayv2_api.IoS_api.api_endpoint
  description = "L'URL pubblico dell'HTTP API Gateway per inviare le richieste POST"
}