config {    
    module = true    
    force = false    
    disabled_by_default = false 
}
plugin "aws" {
  enabled = true
  version = "0.21.1"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
rule "terraform_deprecated_interpolation" {
    enabled = false
}
