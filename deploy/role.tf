data "aws_iam_role" "iam_role" {
  name = "${var.project_name}_role"
}