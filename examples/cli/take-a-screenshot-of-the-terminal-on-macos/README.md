# Take a screenshot of the terminal on macOS

## Verified Environment

|    | Version |
| ---| ------- |
| OS | macOS 13.2.1 (22D68) Darwin 22.3.0 |

## What to do

<!-- icon note -->
**Note**
<!-- end -->

```console
$ man screencapture
...
     -c      Force screen capture to go to the clipboard.
     -T      <seconds> Take the picture after a delay of <seconds>, default is 5.
     -x      Do not play sounds.
     -l      <windowid> Captures the window with windowid.
...
```

```bash
# Get window id
osascript -e "tell app \"APPLICATION_NAME\" to id of window 1"
```

- `window 1` means foreground window

## Examples

### Run command and take a screenshot

<!-- include lang="bash" -->
[run_command_and_take_screenshot.sh](./run_command_and_take_screenshot.sh)
<!-- end -->

```console
$ run_command_and_take_screenshot.sh file find ./ -name '*.sh'

$ run_command_and_take_screenshot.sh clipboard find ./ -name '*.sh'
```
