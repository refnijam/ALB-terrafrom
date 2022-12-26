resource "aws_elb" "web" {
  name            = "web-elb"
  internal        = false
  security_groups = ["sg-0d8e8f56a30a4250c"]
  subnets         = ["subnet-076f0b5d4016c0f75"]


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
