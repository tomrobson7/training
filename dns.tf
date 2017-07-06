provider "dnssimple" {
  token = "asdf1234"
  account = "nope"
}

resource "dnsimple_record" {
  domain = "test-domain"
  type = "A"
  name = "dns_example"
  value = "${aws_instance.web.0.public_ip}"
}

