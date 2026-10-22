variable "lambda_invoke_arn" {
  type = string
  description = "L'ARN della funzione Lambda da integrare con l'API Gateway"
}

variable "lambda_arn" {
  type        = string
  description = "L'ARN base della funzione Lambda per i permessi"
}