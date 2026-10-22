module "database" {
  source = "./modules/database"
}

module "lambda" {
  source = "./modules/lambda"

  table_name    = module.database.table_name
  table_arn     = module.database.table_arn
  function_name = "iot-data-processor"
}

module "api_gateway" {
  source = "./modules/api gateway"

  lambda_invoke_arn = module.lambda.lambda_invoke_arn
  lambda_arn        = module.lambda.lambda_arn
}