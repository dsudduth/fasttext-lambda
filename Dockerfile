FROM amazonlinux:2

# Install tools and languages required for project.
RUN yum install -y amazon-linux-extras
RUN amazon-linux-extras enable python3.8
RUN yum install -y zip
RUN yum install -y git
RUN yum install -y python3.8
RUN yum install -y python3-devel
RUN yum install -y python38-devel
RUN alias python=python3

RUN yum groupinstall -y "Development Tools"

# Compile fastText
# RUN mkdir -p /dist/
# VOLUME /dist/
# RUN git clone https://github.com/facebookresearch/fastText.git
# WORKDIR  /fastText/
# RUN pip3.8 install . -t ../tmp/fasttext
# RUN pip3.8 install regex -t ../tmp/fasttext

RUN mkdir /src/
VOLUME /src/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
