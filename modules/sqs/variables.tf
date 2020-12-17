variable "AWS_REGION" {
  default = "us-east-1"
}

variable "sqsname" {
  description = "nome da fila sqs"
  // required = true
}

variable "dlqname" {
  description = "nome da fila sqs secundaria"
  // required = true
}