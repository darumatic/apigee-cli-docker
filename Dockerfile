# Multi-stage build based on https://softwarejourneyman.com/docker-python-install-wheels.html
FROM python:3-alpine as base
LABEL maintainer="Matthew Delotavo <matthew@darumatic.com>"

# Create a wheel for apigeecli
RUN pip wheel --wheel-dir=/root/wheels apigeecli>=0.51.1

###########################################
# Image with apigeecli
FROM python:3-alpine

COPY --from=base /root/wheels /root/wheels

# Install apigeecli from /root/wheels directory and clean up the wheels directory
RUN apk add --no-cache libstdc++ \
 && pip install \
      --no-index \
      --find-links=/root/wheels \
      "apigeecli>=0.51.1" \
 && rm -rf /root/wheels
