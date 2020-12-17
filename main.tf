module "aws_sqs_queue" {
  source = "./modules/sqs"
  sqsname = "sqs-principal"
}