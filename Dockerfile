from ubuntu
RUN apt-get update \
# install basement tools
    && apt-get install -y git \
    linux-tools-generic \
    python \
    python-pip \
    zip \
    python-tk \
# link perf to new version
    && rm -f /usr/bin/perf \
    && ln -s /usr/lib/linux-tools/4.4.0-116-generic/perf /usr/bin/perf \
# download project and config path
    && cd ~ \
    && git clone https://github.com/andikleen/pmu-tools.git \
    && git clone https://github.com/sharpzhao/pix2code.git \
    && echo "export PATH=~/pmu-tools:$PATH" >> ~/.bashrc \
# download dependencies
    && dpkg --print-architecture \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y iceweasel:i386 \
    && apt update && apt install -y libsm6 libxext6 libxrender-dev \
    && pip install -r ~/pix2code/requirements.txt \
    && pip install matplotlib \
# process project data
    && cd ~/pix2code/datasets \
    && zip -F pix2code_datasets.zip --out datasets.zip && unzip datasets.zip \
    && cd ../bin \
    && cat parametersa* > pix2code.h5 \
    && mkdir code && cp ../datasets/ios/all_data/A964B1B0-4E8B-4326-ABC0-F2F3A2730AB0.png ../test.png
#    && cd ../model \
#    && ./build_datasets.py ../datasets/ios/all_data \
#    && ./convert_imgs_to_arrays.py ../datasets/ios/training_set ../datasets/ios/training_features \
#    && cd .. && mkdir bin \
