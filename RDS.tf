resource "aws_db_instance" "my-mysql-db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "myrds123"
  port                 = "3306"
  #db_subnet_group_name = "default-vpc-06efd4689ffe63514"
  vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
  availability_zone    = "us-west-2a"
  publicly_accessible  = true
  username             = "rds"
  password             = "mysqlrds123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true

  tags = {
    name =  "MYSQL RDS"
  }
  
}