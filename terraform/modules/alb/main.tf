resource "aws_lb" "alb" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg1.id]
  subnets            = [var.subnet_public1_id, var.subnet_public2_id]
}

resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}


resource "aws_lb_listener" "alb_listener_https" {
   load_balancer_arn    = aws_lb.alb.id
   port                 = 443
   protocol             = "HTTPS"
   certificate_arn      = var.certificate_arn
   default_action {
    target_group_arn    = aws_lb_target_group.alb_tg.id
    type                = "forward"
  }
}

resource "aws_security_group" "sg1" {
  name = "sg1"
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

resource "aws_lb_target_group" "alb_tg" {
  name     = "alb-tg"
  port     = var.application_port
  target_type = "ip" 
  protocol = "HTTP"

  health_check {
  path                = "/health"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
  matcher             = "200-399"
}

  vpc_id   = var.vpc_id
}