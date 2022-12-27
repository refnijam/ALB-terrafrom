resource "aws_elb" "web" {
  name            = "web-elb"
  internal        = false
  security_groups = ["sg-0d8e8f56a30a4250c"]
  subnets         = ["subnet-076f0b5d4016c0f75"]
  #availability_zones = ["${var.awsregion}c","${var.awsregion}a","${var.awsregion}b","${var.awsregion}d","${var.awsregion}e","${var.awsregion}f"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:80"
    interval            = 30
  }
}

# Create a new load balancer attachment
resource "aws_elb_attachment" "web" {
  elb      = aws_elb.web.id
  instance = aws_instance.test[0].id
  load_balancer_id = aws_elb.web.id
}
