FROM debian:jessie
RUN apt-get update && \
    apt-get upgrade -y && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get install --no-install-recommends -y curl ca-certificates python pv jq python-pip && \
    rm -rf /var/lib/apt/lists/*
RUN pip install awscli
ENV PATH=/opt/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN curl -SsfL http://get.docker.io/builds/Linux/x86_64/docker-1.9.1 > /usr/local/bin/docker && \
    chmod a+x /usr/local/bin/docker
RUN mkdir -p /opt/google-cloud-sdk && \
    cd /opt/google-cloud-sdk && \
    curl -SsfL https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-118.0.0-linux-x86_64.tar.gz | tar xz --strip=1
