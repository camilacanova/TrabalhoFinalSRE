output "name" {
  value = "${aws_sqs_queue.terraform_queue.name}"
  description = "The name of the file to be exported with the extension, e.g. in default workspace = foo-dev.txt, in prod workspace = foo-prod.txt"
}

output "arn" {
  value = "${aws_sqs_queue.terraform_queue.arn}"
  description = "The name of the file to be exported with the extension, e.g. in default workspace = foo-dev.txt, in prod workspace = foo-prod.txt"
}

//output "content" {
//  value = "${aws_sqs_queue.terraform_queue.content}"
//  description = "The content of the file to be exported"
//}