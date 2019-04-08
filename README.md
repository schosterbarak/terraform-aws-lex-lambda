<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

[![Slalom][logo]](https://slalom.com)

terraform-aws-lex-lambda [![Build Status](https://api.travis-ci.com/JamesWoolfenden/terraform-aws-lex-lambda.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-lex-lambda) [![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-lex-lambda.svg)](https://github.com/JamesWoolfenden/terraform-aws-lex-lambda/releases/latest)

The terraform module creates a lex lambda combination. To use a lambda with an intent a number of other objects are either required. In this module I have included a number of reasonable default values and policies.
This should make it easier to build the lambdas that go with your lex objects.
The lamda permission is a array/list this means you can add as many permissions to lambda as you need to.
The create of roles and or/ policy is configurable with switches.

How to use this project:

---

This project uses the "build-harness" a modified version of the project ["SweetOps"](https://cpco.io/sweetops) from Cloudposse. Sweet indeed.

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

```hcl
module "lexlambda" {
source = "github.com/jameswoolfenden/terraform-aws-lex-lambda"

lambdapermmisions = [{
  action       = "lambda:InvokeFunction"
  statementid  = "Pizza"
  functionname = "${var.name}"
  sourcearn    = "arn:aws:lex:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:intent:Pizza:*"
  principal    = "lex.amazonaws.com"
}]

description      = "${var.description}"
name             = "${var.name}"
filename         = "${path.cwd}/lambda.zip"
policyname       = "${var.name}"
region_name      = "${data.aws_region.current.name}"
role_name        = "${var.name}"
account_id       = "${data.aws_caller_identity.current.account_id}"
source_code_hash = "${data.archive_file.lambda.output_base64sha256}"
common_tags      = "${var.common_tags}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| account_id | The Aws account the policy or object should target | string | - | yes |
| common_tags | Tags | map | - | yes |
| description | Of the the Lambda | string | - | yes |
| envvar | Optional set of environmental variables for the lambda | list | `<list>` | no |
| handler | The file the lambda should import | string | `index.handler` | no |
| lambdapermmisions | This takes a list object with values to set permissions of a lambda. Can take multiple permission objects | list | - | yes |
| layers | Optional add in up 5 lambda layers | list | `<list>` | no |
| memory_size | Of the the lambda | string | `128` | no |
| name | Name of Lambda object | string | - | yes |
| policy | This policy will be applied supplant default if given | string | `` | no |
| policyname | Attached to the role of the lambda | string | - | yes |
| region_name | Aws region name, eu-west-1... | string | - | yes |
| role_name | The name you want your IAM role to have | string | - | yes |
| runtime | Language the code runs in | string | `nodejs8.10` | no |
| s3_bucket | path to the lambda bucket | string | `` | no |
| s3_key | path to the lambda zip | string | `` | no |
| source_code_hash | Had of the Lambda source code | string | `` | no |
| timeout | Of the the lambda | string | `100` | no |
| vpc_config | Optional Vpc attachment config | list | `<list>` | no |

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

Copyright © 2019-2019 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

### Contributors

|  [![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage] |
|---|

  [jameswoolfenden_homepage]: https://github.com/jameswoolfenden
  [jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-lex-lambda&url=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-lex-lambda&url=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
[share_reddit]: https://reddit.com/submit/?url=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
[share_googleplus]: https://plus.google.com/share?url=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
[share_email]: mailto:?subject=terraform-aws-lex-lambda&body=https://github.com/JamesWoolfenden/terraform-aws-lex-lambda
