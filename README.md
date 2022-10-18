# linux-stuff

Linux scripts and configuration files that had been done and worth keeping for future reference

1. sar 1 5
2. sar -o ./file 1 5
3. nohup sar -o ./file
4. explaination for "> /dev/null 2>&1"

\>\> /dev/null redirects standard output (stdout) to /dev/null, which discards it.

(The >> seems sort of superfluous, since >> means append while > means truncate and write, and either appending to or writing to /dev/null has the same net effect. I usually just use > for that reason.)

2>&1 redirects standard error (2) to standard output (1), which then discards it as well since standard output has already been redirected.

5. pidstat -p 32627,32629,360,444,11509,32732 1 1800
6. nohup sar -u 1 1800 > cpuUtil.out 2> cpuUtil.err
7. echo -n 'splunk' | base64 -w 0 -- base64 encoding
