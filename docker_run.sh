#!/bin/bash
nvidia-docker run -it --entrypoint /bin/bash  \
    -p 9191:9191 \
    -p 8097:8097 \
    -v /home/$USER:/home/$USER \
    syniez/erp_depth:latest