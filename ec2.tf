provider "aws" {
  region     = "ap-south-1"
  #access_key = ""
  #secret_key = ""
    }
resource "aws_instance" "myec2" {
   ami = "ami-07db4adf15d7719d1"
   instance_type = "t2.micro"
}
