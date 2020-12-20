output "arnSQS" {
  value = "${module.filas.arnSQS}"
}

output "arnDLQ" {
  value = "${module.filas.arnDLQ}"
}


output "urlSQS" {
  value = "${module.filas.urlSQS}"
}

output "arnSNS" {
  value = "${module.filas.arnSNS}"
}


//ARN da fila sqs principal
//ARN da fila sqs DLQ
//URL da fila sqs principal
//ARN do SNS criado
//Deve ser utlizado workspaces para fazer deploy do ambiente de produção[prod] e desenvolvimento[dev]
