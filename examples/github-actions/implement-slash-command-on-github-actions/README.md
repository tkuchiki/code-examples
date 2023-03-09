# Implement slash command on GitHub Actions

## Verified Environment

|       | Version |
| ----- | ------- |
| image | ubuntu-20.04 |

## What to do

<!-- icon note -->
**Note**
<!-- end -->

- [`github.event_name == 'issue_comment'`](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows#issue_comment)
    - Issue or Pull request
        - https://docs.github.com/ja/actions/using-workflows/events-that-trigger-workflows#issue_comment-on-issues-only-or-pull-requests-only
            - Issue only: `github.event_name == 'issue_comment' && !github.event.issue.pull_request`
            - Pull Request only: `github.event_name == 'issue_comment' && github.event.issue.pull_request`
- `startsWith(github.event.comment.body, '/my-slash-command')`
    - Check if the comment starts with `/my-slash-command`

## Examples

<!-- include lang="yaml" -->
[slash-command.yaml](./slash-command.yaml)
<!-- end -->

Add :eyes: and :rocket: reactions are optional.
