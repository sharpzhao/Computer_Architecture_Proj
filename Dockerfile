from ubuntu
RUN apt-get update \
    && apt-get install -y git \
    linux-tools-generic \
    python \
    python-pip \
    zip \
    && rm -f /usr/bin/perf \
    && ln -s /usr/lib/linux-tools/4.4.0-116-generic/perf /usr/bin/perf \
    && cd ~ \
    && git clone https://github.com/andikleen/pmu-tools.git \
    && echo "export PATH=~/pmu-tools:$PATH" >> ~/.bashrc \
    && dpkg --print-architecture \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y iceweasel:i386 \
    && apt update && apt install -y libsm6 libxext6 libxrender-dev
