resource "aws_lambda_function" "withintent" {
  description      = "${var.description}"
  environment      = ["${var.envvar}"]
  filename         = "${var.filename}"
  function_name    = "${var.name}"
  handler          = "${var.handler}"
  layers           = ["${var.layers}"]
  memory_size      = "${var.memory_size}"
  role             = "arn:aws:iam::${var.account_id}:role/${var.role_name}"
  runtime          = "${var.runtime}"
  source_code_hash = "${var.source_code_hash}"
  tags             = "${var.common_tags}"
  timeout          = "${var.timeout}"
  vpc_config       = "${var.vpc_config}"

  depends_on = [
    "aws_iam_role.withintent",
    "aws_iam_role_policy.withintent",
    "aws_iam_role_policy_attachment.withintent",
  ]
}
