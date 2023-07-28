module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "Terraform-instance"

  instance_type          = "t2.micro"
  key_name               = module.key_pair.key_pair_name
  monitoring             = true
  vpc_security_group_ids = ["${module.vote_service_sg.security_group_id}"]
  subnet_id              = module.vpc.public_subnets[0]
  associate_public_ip_address = true


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "aws"
  public_key = ""
}
