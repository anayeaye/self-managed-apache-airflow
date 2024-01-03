output "airflow_url" {
  value = aws_lb.airflow_webserver.dns_name
}

output "allowed_security_groups_id" {
  value = tolist([aws_security_group.airflow_webserver_service.id, aws_security_group.airflow_metrics_service.id])
}
