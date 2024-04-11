## Auto update docs from git

First clone your repository with a mkdocs.yml file and then
add the following cronjob to your crontab (edit <path> to your git directory)

```bash
# Run every 5 minutes
0-59/5 * * * * git -C <path>/wiki-files fetch && git -C <path>/wiki-files pull
```