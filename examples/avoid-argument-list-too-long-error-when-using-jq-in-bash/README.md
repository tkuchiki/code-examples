## Avoid "argument list too lang" error when using jq in bash

### Verified Environment

|   | Version |
| ----- | --- |
| OS  | Ubuntu 20.04.5 LTS |
| jq  | jq-1.6 |

### Why is the error occurring?

If you run the following scripts in bash, you will get `bash: /usr/bin/jq: Argument list too long` error.

<!-- include lang="bash" -->
[example of failure](./error.sh)
<!-- end -->


This is thought to be because when `--arg array "${array}"` is used, `${array}` is variable expanded and thus exceeds ARG_MAX.

```console
echo '{"array": null}' | jq --arg array "[1, 2, 3, ..., 1000000]" '.array = $array'
#                                       ^^^^^^^^^^^^^^^^^^^^^^^^^
#                                       huge array (about 6.6MB)
```

### How to resolve the error

You can use the following option.

- https://stedolan.github.io/jq/manual/

> --slurpfile variable-name filename:

> This option reads all the JSON texts in the named file and binds an array of the parsed JSON values to the given global variable. If you run jq with --slurpfile foo bar, then $foo is available in the program and has an array whose elements correspond to the texts in the file named bar.

The following script does not occur an error.

<!-- include lang="bash" -->
[example of success](./success.sh)
<!-- end -->
