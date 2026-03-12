#creating ECS cluster and iam role

resource "aws_ecs_cluster" "ecs-threat" {
  name = "ecs-threat"
}

data "aws_iam_role" "ecs_task_iam_role" {
  name = "ecsTaskExecutionRole"
}

#creating task definition 

resource "aws_ecs_task_definition" "ecs-docker" {
  family                   = "ecs-docker"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.ecs_cpu
  memory                   = var.ecs_memory
  execution_role_arn       = "${data.aws_iam_role.ecs_task_iam_role.arn}"
  container_definitions    = jsonencode([
    {
      name      = var.ecs_container_name
      image     = var.ecs_image
      essential = true
      portMappings = [
        {
          containerPort = var.ecs_docker_port
          hostPort      = var.ecs_docker_port
        }
      ]
    }
  ])

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}

#creating an ECS service

resource "aws_ecs_service" "ecs-project" {
  name            = "ecs-project"
  cluster         = aws_ecs_cluster.ecs-threat.id
  task_definition = aws_ecs_task_definition.ecs-docker.arn
  desired_count   = var.ecs_desired_count
  launch_type = "FARGATE"

  load_balancer {
    target_group_arn = var.tg_arn
    container_name   = var.ecs_container_name
    container_port   = var.ecs_docker_port
  }

  network_configuration {
   subnets         = [var.subnetprivate1_id, var.subnetprivate2_id]
   security_groups = [aws_security_group.sg2.id]
 }
}

#creating security group for the ecs task
 
resource "aws_security_group" "sg2" {
  name = "sg2"
  vpc_id = var.vpc_id

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = [var.ingress_cidr]
  }  

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "TCP"
    cidr_blocks      = [var.ingress_cidr]
  }  

  ingress {
    from_port        = var.application_port
    to_port          = var.application_port
    protocol         = "TCP"
    cidr_blocks      = [var.ingress_cidr]
  }  


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.egress_cidr]
  }
}