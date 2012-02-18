realpath
========

by Morgan Aldridge <morgant@makkintosshu.com>

OVERVIEW
--------

A portable `realpath()` written in `bash`. The `realpath()` function in C (and many other languages) will return the absolute path when provided a relative path, but there's not an equivalent in `bash`. It's often suggested to use `readlink`, but while common under Linux, it's not available on many other platforms, esp. BSD-based platforms such as Mac OS X.

This is a simple implementation, originally based on [this solution](http://www.linuxquestions.org/questions/programming-9/bash-script-return-full-path-and-filename-680368/page2.html#post4239549), which uses `pwd`. Pass it one or more relative (or absolute, but that's somewhat pointless) file/directory paths and, if it exists, it'll output the absolute path to STDOUT. It'll also return 0 if successful or 1 if unsuccessful (also meaning the file/directory path doesn't exist).
