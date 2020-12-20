module "filas" {
  source = "./modules/sqs"
  dlqname = "sqs-secundaria"
  sqsname = "sqs-principal"
  snsname = "sns-email-topic"
}