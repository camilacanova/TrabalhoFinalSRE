locals {
  env = "${terraform.workspace}"
  region = "${var.AWS_REGION}"
  // Isolate variables used for different workspaces
  // using map
  context = {
    default = {
      sqsname = "${var.sqsname}-dev"
      dlqname = "${var.dlqname}-dev"
      snsname = "${var.snsname}-dev"
    }
    dev = {
      sqsname = "${var.sqsname}-dev"
      dlqname = "${var.dlqname}-dev"
      snsname = "${var.snsname}-dev"
    }
    prod = {
      sqsname = "${var.sqsname}-prod"
      dlqname = "${var.dlqname}-prod"
      snsname = "${var.snsname}-prod"
    }
  }
  
  context_variables = "${local.context[local.env]}"
}

terraform {
  required_version = ">= 0.12"
}

provider "aws" {
    region = "${local.region}"
}

resource "aws_sqs_queue" "terraform_queue_deadletter" {
  name                      = "${lookup(local.context_variables, "dlqname")}"
  delay_seconds             = 10
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  
  tags = {
    Environment = "${local.env}"
  }
}

resource "aws_sqs_queue" "terraform_queue" {
  name                      = "${lookup(local.context_variables, "sqsname")}"
  delay_seconds             = 10
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn //redirecionamento
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "${local.env}"
  }
}

resource "aws_sns_topic" "sns_email" {
  name = "${lookup(local.context_variables, "snsname")}"
  
  tags = {
    Environment = "${local.env}"
  }
}