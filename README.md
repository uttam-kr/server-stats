# server-stats
script to analyse basic server performance stats.
https://roadmap.sh/projects/server-stats


This command sets the refresh interval for top to 2 seconds. By default, top updates every 3 seconds. You can change the refresh interval by specifying a different value after the -d flag.
top -o %MEM -c -d 2

To display process for specific user:
top -o %MEM -c -d 2 -u username
