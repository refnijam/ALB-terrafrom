resource "aws_route53_zone" "primary" {
  name = "example.com."
}


resource "aws_route53_record" "elb" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "web.example.com"
  type    = "A"
  alias {
    name                   = aws_elb.web.dns_name
    zone_id                = aws_elb.web.zone_id
    evaluate_target_health = true
  }
}