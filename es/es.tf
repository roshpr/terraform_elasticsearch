resource "aws_elasticsearch_domain" "es" {
    domain_name = "${var.name}-es"
    elasticsearch_version = "2.3"
    advanced_options {
        "rest.action.multi.allow_explicit_index" = true
    }

    access_policies = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "*"
        ]
      },
      "Action": "es:*",
      "Resource": "*"
    }
  ]
}
CONFIG
    cluster_config {
      instance_type = "t2.small.elasticsearch"
      instance_count = 2
      zone_awareness_enabled = true
    }
    ebs_options {
      ebs_enabled = true
      volume_size = 20
    }
    snapshot_options {
        automated_snapshot_start_hour = 23
    }

    tags {
      Domain = "TestDomain"
    }
}