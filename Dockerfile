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
	pip install	appdirs==1.4.3; \
	pip install	argon2-cffi==20.1.0; \
	pip install	astor==0.8.1; \
	pip install	async-generator==1.10; \
	pip install	attrs==20.3.0; \
	pip install	backcall==0.1.0; \
	pip install	bleach==3.1.1; \
	pip install	brotlipy==0.7.0; \
	pip install	cachetools==4.0.0; \
	pip install	certifi==2020.12.5; \
	pip install	cffi==1.14.4; \
	pip install	chardet==4.0.0; \
	pip install	cloudpickle==1.6.0; \
	pip install	colorama==0.4.3; \
	pip install	cryptography==3.3.1; \
	pip install	cycler==0.10.0; \
	pip install	decorator==4.4.1; \
	pip install	defusedxml==0.6.0; \
	pip install	distlib==0.3.0; \
	pip install	entrypoints==0.3; \
	pip install	filelock==3.0.12; \
	pip install	future==0.18.2; \
	pip install	google-auth==1.11.2; \
	pip install	google-auth-oauthlib==0.4.1; \
	pip install	google-pasta==0.1.8; \
	pip install	grpcio==1.27.2; \
	pip install	hyperopt==0.2.3; \
	pip install	idna==2.10; \
	pip install	imageio==2.9.0; \
	pip install	importlib-metadata==1.5.0; \
	pip install	ipykernel==5.1.4; \
	pip install	ipython==7.12.0; \
	pip install	ipython-genutils==0.2.0; \
	pip install	ipywidgets==7.5.1; \
	pip install	jedi==0.16.0; \
	pip install	Jinja2==2.11.2; \
	pip install	joblib==1.0.0; \
	pip install	json5==0.9.5; \
	pip install	jsonschema==3.2.0; \
	pip install	kiwisolver==1.1.0; \
	pip install	Markdown==3.2.1; \
	pip install	MarkupSafe==1.1.1; \
	pip install	matplotlib==3.1.3; \
	pip install	mistune==0.8.4; \
	pip install	mpmath==1.1.0; \
	pip install	nbconvert==6.0.7; \
	pip install	nest-asyncio==1.4.3; \
	pip install	networkx==2.2; \
	pip install	nose==1.3.7; \
	pip install	notebook==6.0.3; \
	pip install	numpy==1.19.2; \
	pip install	oauthlib==3.1.0; \
	pip install	olefile==0.46; \
	pip install	opt-einsum==3.1.0; \
	pip install	packaging==20.8; \
	pip install	pandas==1.2.0; \
	pip install	pandocfilters==1.4.2; \
	pip install	parso==0.6.1; \
	pip install	pickleshare==0.7.5; \
	pip install	Pillow==8.0.1; \
	pip install	prometheus-client==0.7.1; \
	pip install	prompt-toolkit==3.0.3; \
	pip install	protobuf==3.14.0; \
	pip install	pyasn1==0.4.8; \
	pip install	pyasn1-modules==0.2.8; \
	pip install	pycparser==2.20; \
	pip install	Pygments==2.5.2; \
	pip install	pyOpenSSL==20.0.1; \
	pip install	pyparsing==2.4.6; \
	pip install	pyrsistent==0.17.3; \
	pip install	PySocks==1.7.1; \
	pip install	python-dateutil==2.8.1; \
	pip install	pytz==2020.5; \
	pip install	PyWavelets==1.1.1; \
	pip install	pywinpty==0.5.7; \
	pip install	pyzmq==18.1.1; \
	pip install	qtconsole==4.6.0; \
	pip install	requests==2.25.1; \
	pip install	requests-oauthlib==1.3.0; \
	pip install	rsa==4.0; \
	pip install	scikit-image==0.18.1; \
	pip install	scikit-learn==0.24.0; \
	pip install	scipy==1.5.4; \
	pip install	Send2Trash==1.5.0; \
	pip install	six==1.14.0; \
	pip install	sklearn==0.0; \
	pip install	Skperopt==0.0.74; \
	pip install	sympy==1.5.1; \
	pip install	tensorboardX==2.1; \
	pip install	termcolor==1.1.0; \
	pip install	terminado==0.8.3; \
	pip install	testpath==0.4.4; \
	pip install	threadpoolctl==2.1.0; \
	pip install	tifffile==2020.12.8; \
	pip install	torch==1.7.1; \
	pip install	torchvision==0.8.2; \
	pip install	tornado==6.0.3; \
	pip install	tqdm==4.55.0; \
	pip install	traitlets==4.3.3; \
	pip install	typing-extensions==3.7.4.3; \
	pip install	urllib3==1.26.2; \
	pip install	virtualenv==20.0.4; \
	pip install	wcwidth==0.1.8; \
	pip install	webencodings==0.5.1; \
	pip install	widgetsnbextension==3.5.1; \
	pip install	win-inet-pton==1.1.0; \
	pip install	nbinteract; \
	pip install	wincertstore==0.2; \
	pip install	zipp==3.0.0; \
    python -m sos_notebook.install;\
    jupyter labextension install --minimize=False jupyterlab-sos; \
    git clone --single-branch -b main https://github.com/dimitarmileski/QPerf_book.git; \
    cd QPerf_book; \
    chmod -R 777 $HOME/work/QPerf_book
    
WORKDIR $HOME/work/QPerf_book

USER $NB_UID