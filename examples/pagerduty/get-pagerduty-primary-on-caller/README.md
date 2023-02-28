# Get the primary on-caller of PagerDuty

## Verified Environment

|               | Version |
| ------------- | ------- |
| OS            | Ubuntu 20.04.5 LTS |
| bash          | GNU bash, version 5.0.17(1)-release (aarch64-unknown-linux-gnu) |
| jq            | jq-1.6 |
| curl          | curl 7.68.0 |
| PagerDuty API | V2 2023-02-14 |

## What to do

<!-- icon note -->
**Note**
<!-- end -->


It uses 2 APIs:

- [List all of the on-calls](https://developer.pagerduty.com/api-reference/3a6b910f11050-list-all-of-the-on-calls)
    - Filter by escalation policy and `escalation level = 1`
- [Get a user](https://developer.pagerduty.com/api-reference/2395ca1feb25e-get-a-user)

## Examples

Here is an example of getting the email of the primary on-caller:

<!-- include lang="bash" -->
[pagerduty.sh](./pagerduty.sh)
<!-- end -->

<!-- include lang="bash" -->
[main.sh](./main.sh)
<!-- end -->

```console
$ bash main.sh ESCALATION_POLICY_ID
```
