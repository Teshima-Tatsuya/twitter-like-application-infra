output "rds" {
    value = {
        host = aws_db_instance.main.address
    }
}