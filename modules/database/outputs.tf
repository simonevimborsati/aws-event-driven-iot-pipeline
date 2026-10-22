output "table_name" {
  value = aws_dynamodb_table.tabella_dynamodb.name
  description = "Il nome della tabella DynamoDB creata"
}
output "table_arn" {
  value = aws_dynamodb_table.tabella_dynamodb.arn
  description = "L'ARN della tabella DynamoDB per le policy IAM"
}