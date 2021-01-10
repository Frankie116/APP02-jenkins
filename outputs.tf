# ---------------------------------------------------------------------------------------------------
# version  1.6
# Library: https://github.com/Frankie116/my-library.git
# outputs
# ---------------------------------------------------------------------------------------------------

# req:
# variables.tf   - var.my-docker-port
# variables.tf   - var.my-ecs-cd-file 



# # 05a-lb-alb.tf ----------------------------------------------------------
output my-website-address {
  description          = "Full website addresss including port number"
  value                = "${aws_route53_record.my-r53-record.fqdn}:${var.my-docker-port}"
}



# 09c-template-file ----------------------------------------------------------
output my-ecs-cd-file {
  description          = "Name of the container definition"
  value                = var.my-ecs-cd-file 
}

