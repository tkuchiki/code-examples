# Google Sheets: How to copy(duplicate) worksheet to same spreadsheet in Go

## Verified Environment

|    | Version |
| ---| ------- |
| OS | macOS 13.2.1 (22D68) Darwin 22.3.0 |
| Go | go1.20.1 darwin/arm64 |

## What to do

<!-- icon note -->
**Note**
<!-- end -->

- [SpreadsheetsValuesService.BatchUpdate](https://pkg.go.dev/google.golang.org/api/sheets/v4#SpreadsheetsValuesService.BatchUpdate)
- [DuplicateSheetRequest](https://pkg.go.dev/google.golang.org/api/sheets/v4#DuplicateSheetRequest)

## Examples

<!-- include lang="go" -->
[main.go](./main.go)
<!-- end -->

```console
go run SPREADSHEET_ID SHEET_ID "NEW_SHEET_NAME"
```
