# Note that there must be a tag
#FROM jupyter/scipy-notebook:cf6258237ff9
FROM tensorflow/tensorflow:latest-py3

RUN pip install --no-cache-dir notebook==5.*

ENV NB_USER vthuongt
ENV NB_UID 1000
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
    
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

#docker run <image> jupyter notebook <arguments from the mybinder launcher>
