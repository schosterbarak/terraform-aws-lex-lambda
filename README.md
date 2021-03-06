# terraform-aws-lex-lambda

terraform-aws-lex-lambda

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-lex-lambda/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-lex-lambda)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-lex-lambda.svg)](https://github.com/JamesWoolfenden/terraform-aws-lex-lambda/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![AWS CIS](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-lex-lambda/cis_aws)](https://www.bridgecrew.cloud/incidents/?ALL_SEVERITY=true&Open=true&accounts=JamesWoolfenden%2Fterraform-aws-lex-lambda&benchmarks=CIS+AWS+V1.2)

The terraform module creates lambda with permissions, for my purposes a lex lambda combination bit options for IAM and CLoudwatch.
To use a lambda with an intent a number of other objects are either required. In this module I have included a number of reasonable default values.
This should make it easier to build the lambdas that go with your lex objects.
The lamda permission is a array/list this means you can add as many permissions to lambda as you need to.

How to use this project:

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

This is a minimal example **Examplea**, but with Cloudwatch alarms enabled.

```terraform
module lexlambda {
  source = "github.com/jameswoolfenden/terraform-aws-lex-lambda"
  version= "0.3.40"

  lambdapermmissions = [{
    intent     = "Pizza"
    source_arn = "Pizza:*"
  }]

  account_id     = data.aws_caller_identity.current.account_id
  alarms_enabled = true
  common_tags    = var.common_tags
  description    = "Best Pizza!!"
  filename       = "${path.module}/lambda.zip"
  name           = var.name
  region_name    = data.aws_region.current.name
  role_arn       = data.aws_iam_role.lambda.arn
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | The Aws account the policy or object should target | `string` | n/a | yes |
| action | Action for the Lambda permission | `string` | `"lambda:InvokeFunction"` | no |
| alarms\_enabled | Cloudwatch alarms enabled | `bool` | `false` | no |
| common\_tags | Implements the common tags scheme | `map` | n/a | yes |
| description | Of the the Lambda | `string` | n/a | yes |
| envvar | Optional set of environmental variables for the lambda | `map` | <pre>{<br>  "Terraform": "Bug"<br>}</pre> | no |
| filename | name of zip file if any | `string` | `null` | no |
| handler | The file the lambda should import | `string` | `"index.handler"` | no |
| kms\_master\_key\_id | Add value,  either CMk or alias/aws/sns to enable encryption of SNS | `string` | `""` | no |
| lambdapermmissions | This takes a list object with values to set permissions of a lambda. Can take multiple permission objects | `list` | `[]` | no |
| layers | Optionally, add in up 5 lambda layers | `list` | `[]` | no |
| memory\_size | Of the the lambda | `string` | `"128"` | no |
| metric\_comparison\_operator | For Cloudwatch Alarms | `string` | `"GreaterThanThreshold"` | no |
| metric\_datapoints\_to\_alarm | For Cloudwatch Alarms | `number` | `1` | no |
| metric\_evaluation\_periods | For Cloudwatch Alarms | `number` | `1` | no |
| metric\_metric\_name | n/a | `string` | `"Invocations"` | no |
| metric\_period | n/a | `number` | `300` | no |
| metric\_statistic | n/a | `string` | `"Average"` | no |
| metric\_threshold | n/a | `number` | `100` | no |
| name | Name of Lambda object | `string` | n/a | yes |
| prefixdash | Support for renaming on multi-environments | `string` | `""` | no |
| principal | n/a | `string` | `"lex.amazonaws.com"` | no |
| region\_name | Aws region name, eu-west-1... | `string` | n/a | yes |
| role\_arn | The name you want your IAM role to have | `string` | n/a | yes |
| runtime | Language the code runs in | `string` | `"nodejs8.10"` | no |
| s3\_bucket | path to the lambda bucket | `string` | `null` | no |
| s3\_key | path to the lambda zip | `string` | `null` | no |
| security\_group\_ids | The IDs of some security groups | `list(string)` | `[]` | no |
| subnet\_ids | Subnet IDs... | `list(string)` | `[]` | no |
| timeout | Of the the lambda | `string` | `"100"` | no |
| tracing\_config | Sets the x-ray tracing mode | `string` | `"Active"` | no |
| vpc\_config | Optional Vpc attachment config | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| lambda | n/a |
| lambda\_arn | n/a |
| memory\_size | n/a |
| source\_code\_size | n/a |
| timeout | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Related Projects

Check out these related projects.

- [terraform-aws-codecommit](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Storing ones code

## Help

**Got a question?**

File a GitHub [issue](https://github.com/JamesWoolfenden/terraform-aws-lex-lambda/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/JamesWoolfenden/terraform-aws-lex-lambda/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2020 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage] |

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/in/jameswoolfenden/
[twitter]: https://twitter.com/JimWoolfenden
[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-lex-lambda&url=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-lex-lambda&url=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
[share_email]: mailto:?subject=terraform-aws-lex-lambda&body=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
