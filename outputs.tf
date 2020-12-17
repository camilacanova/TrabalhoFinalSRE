output "sqs" {
  value = "${module.aws_sqs_queue.name}"
}

output "arn" {
  value = "${module.aws_sqs_queue.arn}"
}

//output "content" {
//  value = "${module.sqs.content}"
//}