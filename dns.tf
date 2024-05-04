resource "aws_route53_zone" "amazonwordpress_com" {
  name = "amazonwordpress.com"
}

resource "aws_route53_record" "elb_dns" {
  zone_id = aws_route53_zone.amazonwordpress_com.zone_id
  name    = "amazonwordpress.com"
  type    = "A"
  alias {
    name                   = aws_elb.web.dns_name
    zone_id                = aws_elb.web.zone_id
    evaluate_target_health = true
  }
}
