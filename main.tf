# Provide VPC and subnets in variables.tf to create a fargate with NGINX, accessible through an application load balancer

resource "aws_ecs_cluster" "cluster" {
  name = "ecs-cluster"
}


resource "aws_ecs_service" "service" {
  name            = "ecs-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn # Referencing our target group
    container_name   = aws_ecs_task_definition.ecs_task_definition.family
    container_port   = 80 # Specifying the container port
  }

  network_configuration {
    assign_public_ip = true
    security_groups = ["${aws_security_group.service_security_group.id}"] # Setting the security group
    subnets         = var.subnets
  }

}