# Darumatic ApigeeCLI Docker Image

**Please note that this project was created as a temporary experiment and is no longer actively maintained.**

This repository contains a Dockerfile to create a lightweight Docker image with apigeecli, a command-line interface for managing Apigee Edge entities.

## Features

The following dependencies are installed in the Docker image:

- Based on python:3-alpine for a small image footprint
- Utilizes multi-stage builds to optimize layers and reduce image size
- Installs apigeecli version >=0.51.1

## Usage

To pull the Docker image from Docker Hub, run the following command:

```bash
docker pull darumatic/apigee:latest
```

To use the Docker image and run apigeecli commands, you can use the following command:

```bash
docker run --rm -it darumatic/apigee apigee <command> [options]
```

Replace with the appropriate apigeecli command and [options] with any relevant options for the command.

## Example

To list all the API proxies in your organization:

```bash
# docker run --rm -it apigee apigee apis list -u <your-username> -p <your-password> -o <your-organization>
docker run --rm -it darumatic/apigee apigee apis list -h
```

Replace <your-username>, <your-password>, and <your-organization> with your Apigee Edge account credentials and organization name.

## Maintainer
This Dockerfile is maintained by Matthew Delotavo:

Email: matthew@darumatic.com

## Contributing

As this project is being archived, we are not accepting contributions or pull requests at this time.
