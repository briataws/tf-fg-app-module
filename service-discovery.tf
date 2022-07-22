resource "aws_service_discovery_service" "terraform" {
  name = "${var.environment}-${var.app_name}"

  dns_config {
    namespace_id = data.aws_service_discovery_dns_namespace.terraform.id

    dns_records {
      ttl  = 10
      type = "A"
    }

    routing_policy = "MULTIVALUE"
  }

  health_check_custom_config {
    failure_threshold = 2
  }
}
