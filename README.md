# Terraform4aws
Learn how to Deploy Enterprise Infrastructure on AWS from Scratch, Completely Remote Execution

1. Provider.tf file contains the Details of Cloud provider namely AWS, AZURE or Openstack, appropriate Provider plugin can be found in this link https://www.terraform.io/docs/providers/index.html
2. resource.tf file will contain resources defination, in AWS resources would be EC2, EBS, LB or ASG etc
3. Vars.tf file will contain the variables like AMI ID, a region details the data which can vary
4. terraform.tfvars this file we will use explicitly to pass the IAM users Secret key and Private Key
