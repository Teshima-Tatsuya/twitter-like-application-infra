output "rds" {
    value = {
        host = aws_db_instance.x.address
    }
}