FROM nvidia/cuda:11.1-cudnn8-devel-ubuntu18.04
LABEL	maintainer="erp_depth"
 
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

# Install Dependencies of anaconda3
RUN apt-get update && \
    apt-get install -y wget bzip2 curl git &&\
    apt-get install -y libgl1-mesa-glx &&\ 
    apt clean &&\
    rm -rf /var/lib/apt/lists/*

# Install anaconda3
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm -f ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    conda update -n base -c defaults conda
    #if you want, you can add any other requirements.\
    #conda create -n syniez python=3.7 && \
    #echo "conda activate syniez" >> ~/.bashrc