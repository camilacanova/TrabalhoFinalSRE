locals {
  env = "${terraform.workspace}"
  
  // Isolate variables used for different workspaces
  // using map
  context = {
    default = {
      sqsname = "${var.sqsname}-dev"
      dlqname = "${var.dlqname}-dev"
    }
    dev = {
      sqsname = "${var.sqsname}-dev"
      dlqname = "${var.dlqname}-dev"
    }
    homol = {
      sqsname = "${var.sqsname}-homol"
      dlqname = "${var.dlqname}-homol"
    }
    prod = {
      sqsname = "${var.sqsname}-prod"
      dlqname = "${var.dlqname}-prod"
    }
  }
  
  context_variables = "${local.context[local.env]}"
}

// Creates a new local file with the given filename and content
//resource "local_file" "test" {
//  content     = "${local.env}"
//  filename = "${path.module}/${lookup(local.context_variables, "name")}"
//}


terraform {
  required_version = ">= 0.12"
}

provider "aws" {
    region = "${var.AWS_REGION}"
}

resource "aws_sqs_queue" "terraform_queue_deadletter" {
  name                      = "${lookup(local.context_variables, "dlqname")}"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  //redrive_policy = jsonencode({
  //  deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter.arn //redirecionamento
  //  maxReceiveCount     = 4
  //})

  tags = {
    Environment = "${local.env}"
  }
}

resource "aws_sqs_queue" "terraform_queue" {
  name                      = "${lookup(local.context_variables, "sqsname")}"
  delay_seconds             = 90
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


//ARN da fila sqs principal
//ARN da fila sqs DLQ
//URL da fila sqs principal
//ARN do SNS criado


//resource "aws_sqs_queue" "terraform_queue" {
//  count = 5
//  name = "fila-criada-${count.index}"
//  tags = {
//    Environment = "production"
//  }
//}