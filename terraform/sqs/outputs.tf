output "arnSQS" {
  value = "${aws_sqs_queue.terraform_queue.arn}"
  description = ""
}

output "arnDLQ" {
  value = "${aws_sqs_queue.terraform_queue_deadletter.arn}"
  description = ""
}

output "urlSQS" {
  value = "${aws_sqs_queue.terraform_queue.id}"
  description = ""
}

output "arnSNS" {
  value = "${aws_sns_topic.sns_email.arn}"
  description = ""
}

//ARN da fila sqs principal
//ARN da fila sqs DLQ
//URL da fila sqs principal
//ARN do SNS criado
//Deve ser utlizado workspaces para fazer deploy do ambiente de produção[prod] e desenvolvimento[dev]
