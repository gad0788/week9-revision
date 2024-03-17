resource "aws_lightsail_instance" "server1" {
  name = "lamp-server"
  blueprint_id = "centos_7_2009_01"
  bundle_id = "medium_1_0"
  availability_zone = "us-east-1a"
  key_pair_name = "lamp"
  user_data = file ("resume.sh")
}
resource "aws_route53_record" "rc1" {
  zone_id = "Z0319926K2HLBRS8NWD0"
  type = "A"
  ttl = 300
  name = "resume.kayband.com"
  records = [ aws_lightsail_instance.server1.public_ip_address ]
}
