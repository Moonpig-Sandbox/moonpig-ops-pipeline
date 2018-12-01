resource "aws_iam_user" "pipeline" {
  name = "${var.PipelineUsername}"
  path = "/"
  tags {
    "mnpg:environment" = "${var.TagEnvironmentValue}"
    "mnpg:name"        = "${var.TagNameValue}"
    "mnpg:owner"       = "${var.TagOwnerValue}"
    "mnpg:team"        = "${var.TagTeamValue}"
    "mnpg:workstream"  = "${var.TagWorkstreamValue}"
  }
}

resource "aws_iam_user_policy" "pipeline" {
  name = "${var.PipelineUsername}"
  user = "${aws_iam_user.pipeline.name}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
          "iam:ListRoles",
          "sts:AssumeRole"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
