output "sqs" {
  value = "${module.aws_sqs_queue.name}"
}

//output "content" {
//  value = "${module.sqs.content}"
//}