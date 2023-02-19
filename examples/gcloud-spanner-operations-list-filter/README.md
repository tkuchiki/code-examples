# Example of `gcloud spanner operations list --filter`

## Verified Environment

|   | Version |
| ----- | --- |
| spanner-emulator | v1.4.9(ae507799872a) |
| Google Cloud SDK | 416.0.0              |

## Examples

### Not completed operations

```console
gcloud spanner operations list --filter="done = false"
```

### Completed operations

```console
gcloud spanner operations list --filter="done = true"
```

### Statements

```console
gcloud spanner operations list --filter="metadata.statements ~ PART_OF_SQL"
```
