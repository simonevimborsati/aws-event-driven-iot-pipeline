variable "table_name" {
    type        = string
    description = "il nome della tabella Amazon DynamoDB"
    default = "iot-sensor-data"
}
variable "hash_key" {
    type        = string
    description = "Il nome dell'attributo da usare come chiave di partizione (hash key)"
    default = "sensor_id"
}
variable "attributes" {
    type        = list(object({
      name = string
      type = string
      }))
    description = "Lista degli attributi per le chiavi primarie"
    default = [ {
      name = "sensor_id"
      type = "S"
    } ]
}