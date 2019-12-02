# apt-llvm-9-dev-repro

The [_llvm-9-dev_ apt package](https://packages.debian.org/sid/amd64/llvm-9-dev) is missing a file, which caused my builds against LLVM to fail like this:<br>
https://travis-ci.org/weliveindetail/apt-llvm-9-dev-repro/builds/619590445#L204

The `broken` branch provides a repro. The `master` branch shows a simple client-side fix:<br>
https://github.com/weliveindetail/apt-llvm-9-dev-repro/commit/86497a3b

Builds with the workaround succeed:<br>
https://travis-ci.org/weliveindetail/apt-llvm-9-dev-repro/builds/619603437

More info:<br>
https://llvm.org/PR43035
