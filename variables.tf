//
// Module: fg-hello-world-app
//
variable "region" {
  description = "The AWS region"
  type        = string
}

variable "environment" {
  description = "The environment"
  type        = string
}

variable "app_name" {
  description = "The environment"
  type        = string
}

variable "vpc_name" {
  description = "The AWS vpc Name"
  type        = string
}

variable "alb_internal" {
  default     = true
  description = "Internal ALB true | false"
  type        = bool
}

variable "image_url" {
  description = "The environment"
  type        = string
}

variable "min" {
  description = "Minimum Number Of Containers"
  type        = string
}

variable "max" {
  description = "Maximum Number Of Containers"
  type        = string
}

variable "app_port" {
  description = "Port App Listens On"
  type        = string
}

variable "healthy_threshold" {
  default     = "2"
  description = "ALB Target Group Healthy Threshold"
  type        = string
}

variable "unhealthy_threshold" {
  default     = "4"
  description = "ALB Target Group Unhealthy Threshold"
  type        = string
}

variable "timeout" {
  default     = "10"
  description = "ALB Target Group Timeout"
  type        = string
}

variable "idle_timeout" {
  default     = "60"
  description = "ALB Idle Timeout"
  type        = string
}

variable "interval" {
  default     = "30"
  description = "ALB Target Group Interval"
  type        = string
}

variable "cpu" {
  default     = "256"
  description = "ECS Task CPU"
  type        = string
}

variable "memory" {
  default     = "1024"
  description = "ECS Task Memory"
  type        = string
}

variable "env_vars" {
  type        = list(map(string))
  description = "ENV VARS for Docker"
}

variable "user" {
  default     = "root"
  description = "ECS Docker User"
  type        = string
}


variable "health_check_path" {
  default     = "/"
  description = "health check path for the ALB"
  type        = string
}

variable "aws_service_discovery_namespace" {
  default     = "terraform.local"
  description = "Name of the AWS Service Discovery Namespace"
  type        = string
}

variable "drop_invalid_header_fields" {
  default     = true
  description = "drop invalid header fields"
  type        = string
}

variable "ecs_task_execution_role" {
  default     = "ecs_task_execution_role"
  description = "ECS Task Exectution Role"
  type        = string
}
