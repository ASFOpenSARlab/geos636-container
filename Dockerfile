FROM ghcr.io/asfopensarlab/deployment-opensarlab-container_sar:v1.0.1

USER root

# add cmake
RUN apt-get update -y &&\
    apt-get update &&\
    apt-get install -y cmake

# install pygmt, openpyxl, cartopy
RUN mamba install -c conda-forge \
    cartopy \
    numpy \
    openpyxl \
    pygmt \
    scipy \
    sqlite==3.46.0 \
     -y

# install nvector and igrf
RUN python -m pip install nvector \
    igrf &&\
    # elevate path permission for igrf
    chmod -R 777 /opt/conda/lib/python3.11/site-packages/igrf

WORKDIR /home/jovyan
USER jovyan
