terraform {
  backend "s3" {
    bucket = "lab-fiap-75aoj-337589"
    key    = "workspaces"
    region = "us-east-1"
  }
}