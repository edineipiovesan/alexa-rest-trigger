resource "aws_ecr_repository" "rest_trigger_repository" {
  name                 = "${var.project_name}_repository"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}