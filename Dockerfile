# Use AFLplusplus as the base image
FROM aflplusplus/aflplusplus:latest

# Set environment variable
ENV TERM=xterm-256color

# Set up QEMU mode with AFL++
WORKDIR /AFLplusplus/qemu_mode
RUN NO_CHECKOUT=1 CPU_TARGET=aarch64 STATIC=1 ./build_qemu_support.sh && \
    cd /AFLplusplus && \
    mv afl-qemu-trace afl-qemu-trace-aarch64 && \
    make install

WORKDIR /
RUN wget https://raw.githubusercontent.com/maoyixie/ebcorbos-fuzzing_arm/main/emu_aarch64.tar.gz && \
    tar -xzvf emu_aarch64.tar.gz