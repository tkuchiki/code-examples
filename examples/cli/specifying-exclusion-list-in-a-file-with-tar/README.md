# Specify files and directories to exclude in a file when compressing with the tar

## Verified Environment

| OS  | tar |
| ----- | --- |
| Ubuntu 20.04.6 LTS | tar (GNU tar) 1.30 |
| macOS 13.2.1 (22D68) Darwin 22.3.0 | bsdtar 3.5.3 - libarchive 3.5.3 zlib/1.2.11 liblzma/5.0.5 bz2lib/1.0.8 |

## What to do

<!-- icon note -->
**Note**
<!-- end -->

```console
# Ubuntu
$ man tar
...
       -X, --exclude-from=FILE
              Exclude files matching patterns listed in FILE.
```

```console
# macOS
$ man tar
...
     -X filename, --exclude-from filename
             Read a list of exclusion patterns from the specified file.  See --exclude for more information about the handling of exclusions.
```

## Examples

```console
$ cat exclude.txt
./file1
./dir2
./.git

$ tar -zcvf archive.tar.gz --exclude="PATTERN" --exclude-from exclude.txt ./
```
