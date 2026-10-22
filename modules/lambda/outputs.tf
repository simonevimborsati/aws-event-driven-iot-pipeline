output "lambda_arn" {
  description = "L'ARN della funzione Lambda"
  value       = aws_lambda_function.funzioni_lambda.arn
}

output "lambda_name" {
  description = "Il nome della funzione Lambda"
  value       = aws_lambda_function.funzioni_lambda.function_name
}

output "lambda_invoke_arn" {
  value = aws_lambda_function.funzioni_lambda.invoke_arn
  description = "L'ARN di invocazione della funzione Lambda, utilizzato dall'API Gateway per l'integrazione proxy"
}