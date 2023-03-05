# Convert 2d array JSON to array with objects

## Verified Environment

|   | Version |
| ----- | --- |
| OS  | Ubuntu 20.04.5 LTS |
| jq  | jq-1.6 |

## What to do

<!-- icon note -->
**Note**
<!-- end -->

- https://stedolan.github.io/jq/manual/

> --slurp/-s:
> Instead of running the filter for each JSON object in the input, read the entire input stream into a large array and run the filter just once.

> `to_entries`, `from_entries`, `with_entries`
> These functions convert between an object and an array of key-value pairs. If `to_entries` is passed an object, then for each `k: v` entry in the input, the output array includes `{"key": k, "value": v}`.
>
> `from_entries` does the opposite conversion, and `with_entries(foo)` is a shorthand for `to_entries | map(foo) | from_entries`, useful for doing some operation to all keys and values of an object. from_entries accepts key, Key, name, Name, value and Value as keys.

## Examples

<!-- include lang="json" -->
[example.json](./example.json)
<!-- end -->

<!-- include lang="bash" -->
[convert.sh](./convert.sh)
<!-- end -->

`bash convert.sh example.json`

<!-- include lang="json" -->
[result.json](./result.json)
<!-- end -->

### Explanation

> `.[0] as $headers`

```json
[ "key1", "key2", "key3" ]
```

> .[1:][]

```json
[ "aa", "bb", "cc" ]
[ "dd", "ee", "ff" ]
[ "gg", "hh", "ii" ]
[ "jj", "kk", "ll" ]
```

> `with_entries(.key = $headers[.key])`
> = `to_entries | map(.key = $headers[.key]) | from_entries`

`to_entries`

```json
[
  { "key": 0, "value": "aa" },
  { "key": 1, "value": "bb" },
  { "key": 2, "value": "cc" }
]
[
  { "key": 0, "value": "dd" },
  { "key": 1, "value": "ee" },
  { "key": 2, "value": "ff" }
]
[
  { "key": 0, "value": "gg" },
  { "key": 1, "value": "hh" },
  { "key": 2, "value": "ii" }
]
[
  { "key": 0, "value": "jj" },
  { "key": 1, "value": "kk" },
  { "key": 2, "value": "ll" }
]
```

`to_entries | map(.key = $headers[.key]`

```json
[
  { "key": "key1", "value": "aa" },
  { "key": "key2", "value": "bb" },
  { "key": "key3", "value": "cc" }
]
[
  { "key": "key1", "value": "dd" },
  { "key": "key2", "value": "ee" },
  { "key": "key3", "value": "ff" }
]
[
  { "key": "key1", "value": "gg" },
  { "key": "key2", "value": "hh" },
  { "key": "key3", "value": "ii" }
]
[
  { "key": "key1", "value": "jj" },
  { "key": "key2", "value": "kk" },
  { "key": "key3", "value": "ll" }
]
```

`to_entries | map(.key = $headers[.key]) | from_entries`

```json
{ "key1": "aa", "key2": "bb", "key3": "cc" }
{ "key1": "dd", "key2": "ee", "key3": "ff" }
{ "key1": "gg", "key2": "hh", "key3": "ii" }
{ "key1": "jj", "key2": "kk", "key3": "ll" }
```

> `jq -s .`

```json
[
  { "key1": "aa", "key2": "bb", "key3": "cc" }
  { "key1": "dd", "key2": "ee", "key3": "ff" }
  { "key1": "gg", "key2": "hh", "key3": "ii" }
  { "key1": "jj", "key2": "kk", "key3": "ll" }
]
```
