{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "es:*",
      "Condition": {
        "IpAddress": {
          "aws:SourceIp":[
            "116.197.184.0",
            "66.124.239.40"
          ]
        }
      },
      "Resource": "arn:aws:es:${region}:${account_id}:domain/${name}/*"
    }
  ]
}
