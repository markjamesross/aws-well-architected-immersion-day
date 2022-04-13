resource "aws_cloudformation_stack" "time_test" {
  name = "TimeTest"
  capabilities = ["CAPABILITY_NAMED_IAM"]

  parameters = {
    KeyName = var.key_name
    Ec2InstanceSubnetId =data.aws_subnet.default_vpc.id
  }

  template_body = file("src/time_test.yaml")
}

data "aws_vpc" "default" {
  cidr_block = "172.31.0.0/16"
}

data "aws_subnet" "default_vpc" {
  vpc_id = data.aws_vpc.default.id
  availability_zone = "${data.aws_region.current.name}a"
}