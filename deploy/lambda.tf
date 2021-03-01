# Lambda function
resource "aws_lambda_function" "lambda_function" {
  function_name = "${var.project_name}_function"
  role          = data.aws_iam_role.iam_role.arn
  description   = "Backend function for ${var.project_name} Alexa skill"
  package_type  = "Image"
  image_uri     = var.image_uri
}

# Lambda trigger
resource "aws_lambda_permission" "lambda_permission" {
  statement_id       = "AllowAlexaSkillInvokeLambda"
  action             = "lambda:InvokeFunction"
  function_name      = "${var.project_name}_function"
  principal          = "alexa-connectedhome.amazon.com"
  event_source_token = var.skill_event_source_token

  depends_on = [aws_lambda_function.lambda_function]
}