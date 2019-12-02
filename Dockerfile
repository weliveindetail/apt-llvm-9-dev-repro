FROM ubuntu:19.04

RUN apt-get update && apt-get install -y --no-install-recommends \
            ca-certificates wget gnupg software-properties-common

RUN wget https://apt.llvm.org/llvm-snapshot.gpg.key && \
    apt-key add llvm-snapshot.gpg.key && \
    apt-add-repository "deb http://apt.llvm.org/disco/ llvm-toolchain-disco-9 main" && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
            build-essential cmake cmake-data \
            llvm-9-dev llvm-9-tools ninja-build && \
    rm -rf /var/lib/apt/lists/*

# llvm-9-tools comes without yaml-bench, but LLVMExports.cmake in the llvm-9-dev
# package requires it. The bug report https://llvm.org/PR43035 explains the
# issue and the solution. The workaround that was taken instead is insufficient.
# Use a dummy file to silence the error:
#RUN touch /usr/lib/llvm-9/bin/yaml-bench

COPY CMakeLists.txt /workspace/CMakeLists.txt

CMD set -x && cmake -G Ninja -S /workspace -B /workspace/build
