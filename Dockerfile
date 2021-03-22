FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    libssl-dev \
    python3.7-dev \
    python3-distutils \
    python3-pip \
    unzip \
    locales

RUN pip3 install --upgrade flake8 mypy setuptools pip pre-commit requests pytest

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 - -y
ENV PATH="${PATH}:/ci/home/.poetry/bin"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN mkdir -p /root/.cache
VOLUME /root/.cache
