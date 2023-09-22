# fastText Lambda

![logo](./assets/logo/cover.png)

A purpose-built Docker container to compile and bundle fastText for use with AWS Lambda.

## QuickStart

```bash
docker login ...
docker pull

docker run -v "$(pwd):/src/" fasttext-lambda:latest
```

When executed, the container will generate a zip file containing a new lambda layer.The archive will be stored locally in `./dist/layers`.

## Description

This container leverages `amazonlinux:2` as its base, allowing fastText can be compiled in a similar environment to AWS Lambda. Without this, fastText will fail to resolve linked libraries and dependencies. As an output, this container produces a pre-packaged lambda layer ready to upload.

## Supported Runtimes

At this time only the `python3.8` runtime is supported.

## Building the container

To build the container, clone this repository and build the container.

```bash
docker build -t fasttext-lambda .
```

## Versioning

We use [SemVer](http://semver.org/) for versioning.
