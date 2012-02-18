realpath
========

by Morgan Aldridge <morgant@makkintosshu.com>

OVERVIEW
--------

A portable `realpath()` written in `bash`. The `realpath()` function in C (and many other languages) will return the absolute path when provided a relative path, but there's not an equivalent in `bash`. It's often suggested to use `readlink`, but while common under Linux, it's not available on many other platforms, esp. BSD-based platforms such as Mac OS X.

This is a simple implementation, originally based on [this solution](http://www.linuxquestions.org/questions/programming-9/bash-script-return-full-path-and-filename-680368/page2.html#post4239549), which uses `pwd`. Pass it one or more relative (or absolute, but that's somewhat pointless) file/directory paths and, if it exists, it'll output the absolute path to STDOUT. It'll also return 0 if successful or 1 if unsuccessful (also meaning the file/directory path doesn't exist).

LICENSE
-------

Copyright (c) 2012, Morgan Aldridge
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.