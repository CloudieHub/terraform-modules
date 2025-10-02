# DB Subnet Group
resource "aws_db_subnet_group" "this" {
  name       = "${var.name}-subnet-group"
  subnet_ids = var.subnet_ids
  tags       = merge(var.tags, { Name = "${var.name}-subnet-group" })
}

# Security Group for RDS
resource "aws_security_group" "this" {
  name        = "${var.name}-sg"
  description = "Security group for RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = var.db_port
    to_port         = var.db_port
    protocol        = "tcp"
    cidr_blocks     = var.allowed_cidrs
    description     = "Allow DB access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.tags, { Name = "${var.name}-sg" })
}

# RDS Instance
resource "aws_db_instance" "this" {
  identifier              = "${var.name}-db"
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [aws_security_group.this.id]
  username                = var.username
  password                = var.password
  multi_az                = var.multi_az
  publicly_accessible     = var.publicly_accessible
  skip_final_snapshot     = true
  storage_type            = var.storage_type
  tags                    = merge(var.tags, { Name = "${var.name}-db" })
}
