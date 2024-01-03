

# A postgres RDS instance for airflow metadata.
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance



resource "aws_db_instance" "airflow_db" {
  identifier_prefix      = "${var.prefix}-airflow-db-"
  allocated_storage      = 20
  max_allocated_storage  = 100
  db_subnet_group_name   = aws_db_subnet_group.airflow_db.name
  engine                 = "postgres"
  engine_version         = var.rds_engine_version
  instance_class = var.rds_instance_class
  publicly_accessible    = var.publicly_accessible
  vpc_security_group_ids = [aws_security_group.airflow_db.id]
  apply_immediately      = true
  snapshot_identifier = var.snapshot_identifier
  skip_final_snapshot    = true
  db_name                = var.airflow_db.db_name
  username               = var.airflow_db.username
  password               = var.airflow_db.password
  port                   = var.airflow_db.port
}
