module "aws_sqs_queue" {
  source = "./modules/sqs"
  dlqname = "sqs-secundaria"
  sqsname = "sqs-principal"
}