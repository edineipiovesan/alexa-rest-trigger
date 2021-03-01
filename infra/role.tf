### Role
data "template_file" "lambda_role" {
  template = file("${path.module}/role/lambda.json.tpl")
}

resource "aws_iam_role" "iam_role" {
  name               = "${var.project_name}_role"
  assume_role_policy = data.template_file.lambda_role.rendered
}

### CloudWatch policy
data "template_file" "cloudwatch_policy" {
  template = file("${path.module}/policy/cloudwatch.json.tpl")
}

resource "aws_iam_policy" "logging_policy" {
  name        = "logging"
  path        = "/"
  description = "IAM policy for logging"
  policy      = data.template_file.cloudwatch_policy.rendered
}

### Assign logging policy to role
resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.logging_policy.arn
}