terraform 
{
######Creation of S3 Bucket######################
#################################################
 resource "aws_s3_bucket" "vijay-terraform-backend" 
 {
  bucket = "vijay-terraform-backend"
  # Enable versioning so we can see the full revision history of our
  # state files
  versioning {
    enabled = true
             }
 }
 ##### Creation of DynamoDB Tables#############
  #############################################
  resource "aws_dynamodb_table" "vijay-terraform_locks" 
  {
   name         = "vijay-terraform_locks"
   hash_key     = "LockID"
   attribute {
    name = "LockID"
    type = "S"
             }
  }
 ##### This to upload tfstate file in S3##############   
 #####################################################
 backend "S3" 
 {
 bucket = "vijay-terraform-backend"
 key = "Terraform.tfstate"
 region = "ap-south-1"
 #access_key = ""
 #secret_key = ""
 ######### This to lock state file in S3#############
 ####################################################
 dynamodb_table = "vijay-terraform_locks"
 }
}
