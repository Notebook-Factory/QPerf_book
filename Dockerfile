# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

USER $NB_UID

# R packages including IRKernel which gets installed globally.
RUN conda install --quiet --yes \
    'r-base=3.6.3' \
    'r-caret=6.0*' \
    'r-crayon=1.3*' \
    'r-devtools=2.3*' \
    'r-forecast=8.12*' \
    'r-hexbin=1.28*' \
    'r-htmltools=0.4*' \
    'r-htmlwidgets=1.5*' \
    'r-irkernel=1.1*' \
    'r-nycflights13=1.0*' \
    'r-plyr=1.8*' \
    'r-randomforest=4.6*' \
    'r-rcurl=1.98*' \
    'r-reshape2=1.4*' \
    'r-rmarkdown=2.1*' \
    'r-rsqlite=2.2*' \
    'r-shiny=1.4*' \
    'r-tidyverse=1.3*' \
    'rpy2=3.1*' \
    && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"


WORKDIR $HOME

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        emacs \
        git \
        inkscape \
        jed \
        libsm6 \
        libxext-dev \
        libxrender1 \
        lmodern \
        netcat \
        unzip \
        nano \
        curl \
        wget \
        cmake \
        rsync \
        gnuplot \
		ghostscript \
        libopenblas-base \
        octave \
        liboctave-dev  \
        octave-info \
        octave-parallel \
        octave-struct \
        octave-io \
        octave-statistics \
        octave-optim \
        octave-image \
        python3-dev \
        ttf-dejavu && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN cd $HOME/work;\
    pip install --upgrade pip; \
    pip install octave_kernel;   \
    pip install sos\
                sos-notebook \
                sos-python \
                sos-bash \
                sos-matlab \
                sos-sas \
                scipy \
                plotly \
                dash \
                dash_core_components \
                dash_html_components \
                dash_dangerously_set_inner_html \
                dash-renderer \
                flask \
                ipywidgets \
                nibabel; \
	pip install jupyter-book==0.6.4; \
	pip install	imageio==2.9.0; \
	pip install	matplotlib==3.1.3; \
	pip install	nbconvert==6.0.7; \
	pip install	notebook==6.0.3; \
	pip install	numpy==1.19.2; \
	pip install	pandas==1.2.0; \
	pip install	Pillow==8.0.1; \
	pip install	pytz==2020.5; \
	pip install	pyzmq==18.1.1; \
	pip install	rsa==4.0; \
	pip install	scikit-image==0.18.1; \
	pip install	scikit-learn==0.24.0; \
	pip install	scipy==1.5.4; \
	pip install	six==1.14.0; \
	pip install	sklearn==0.0; \
	pip install	sympy==1.5.1; \
	pip install	tensorboardX==2.1; \
	pip install	torch==1.7.1; \
	pip install	torchvision==0.8.2; \
	pip install	tornado==6.0.3; \
	pip install	tqdm==4.55.0; \
	pip install	urllib3==1.26.2; \
	pip install	virtualenv==20.0.4; \
	pip install	zipp==3.0.0; \
	pip install	nbinteract; \
    python -m sos_notebook.install;\
    jupyter labextension install --minimize=False jupyterlab-sos; \
    git clone --single-branch -b main https://github.com/dimitarmileski/QPerf_book.git; \
    cd QPerf_book; \
    chmod -R 777 $HOME/work/QPerf_book
    
WORKDIR $HOME/work/QPerf_book

USER $NB_UID