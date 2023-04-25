FROM ubuntu:20.04

WORKDIR /app

ENV TZ="America/Sao_Paulo"

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update -y \
    &&  apt install -y python3-pip libpq-dev python-dev ant make

COPY makefile makefile
COPY notebook notebook
COPY mallet mallet
COPY tcc tcc
COPY output output
COPY init-docker.py .

RUN pip3 install --upgrade pip \
    && pip3 install -r notebook/requirements.txt \
    && pip3 install jupyterlab

CMD jupyter-lab --ip='*' --port=8888 --allow-root --NotebookApp.token='' --NotebookApp.password=''