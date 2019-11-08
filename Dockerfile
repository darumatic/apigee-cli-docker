###########################################
# Multi-stage build based on https://softwarejourneyman.com/docker-python-install-wheels.html
FROM python:3-alpine as base
LABEL maintainer="Matthew Delotavo <matthew@darumatic.com>"

# install pandas dependencies
# https://stackoverflow.com/a/57842166
RUN apk add --no-cache --update \
      python3 python3-dev gcc \
      gfortran musl-dev g++ \
      libffi-dev openssl-dev \
      libxml2 libxml2-dev \
      libxslt libxslt-dev \
      libjpeg-turbo-dev zlib-dev

# instead of installing, create a wheel
RUN pip wheel --wheel-dir=/root/wheels apigeecli

###########################################
# Image WITHOUT pandas dependencies but WITH apigeecli
FROM python:3-alpine

COPY --from=base /root/wheels /root/wheels

# Ignore the Python package index
# and look for archives in
# /root/wheels directory
RUN apk add --no-cache libstdc++ \
 && pip install \
      --no-index \
      --find-links=/root/wheels \
      apigeecli
