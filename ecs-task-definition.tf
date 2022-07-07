#
# Module: fg-hello-world-app:ecs-task-definition
#

# Task definition for the app service
data "template_file" "app" {
  template = file("${path.module}/tasks/app_task_definition.json")

  vars = {
    env_vars       = "${jsonencode(var.env_vars)}"
    app_name       = "${var.app_name}"
    memory         = "${var.memory}"
    image          = "${var.image_url}"
    region         = "${var.region}"
    port           = "${var.app_port}"
    awslogs-group  = "${var.environment}_fargate_ecs"
    user           = "${var.user}"


  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = var.app_name
  container_definitions    = data.template_file.app.rendered
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = data.aws_iam_role.ecs_execution_role.arn
  task_role_arn            = data.aws_iam_role.ecs_execution_role.arn
}
