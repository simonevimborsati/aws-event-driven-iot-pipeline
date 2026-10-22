variable "function_name" {
  type = string
  description = "il nome della funzione lambda"
  default = "iot-data-processor"
}
variable "table_name" {
  type = string
  description = "Il nome della tabella DynamoDb in cui scrivere"
}
variable "table_arn" {
  type = string
  description = "L'ARN della tabella DynamoDB per la policy IAM"
}