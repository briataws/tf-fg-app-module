vpc_name             = "mgmt"
region               = "us-west-2"
environment          = "mgmt"
image_url            = "bcarpio/python-hello-world"
instance_network_tag = "Private"
alb_network_tag      = "Public"
alb_internal         = false
app_name             = "hello-world"
min                  = "1"
max                  = "1"
app_port             = "8080"
cpu                  = "2048"
memory               = "4096"
health_check_path    = "/"


route53_zone_name = "sandbox-testing-private.com"

route53_private_zone = true

env_vars = [{
  "name"  = "WHO"
  "value" = "Brian Carpio"
  },
  {
    "name"  = "WHAT"
    "value" = "Is NerdLife"
}]
