provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_elb" "web" {
  name               = "elb1"
  availability_zones = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    unhealthy_threshold = 2
    healthy_threshold   = 2
  }
}

output "elb_dns_name" {
  value = aws_elb.web.dns_name
}
