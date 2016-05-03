FROM debian:jessie

RUN apt-get -y update && apt-get -y install git \
                openssh-client \
                locales \
                python-dev \
                python-pip \
                python-paramiko \
                python-jinja2 \
                python-httplib2 \
                python-six \
                build-essential \
                libffi-dev \
                libssl-dev \
                libyaml-dev \
        --no-install-recommends && rm -r /var/lib/apt/lists/*

ENV ANSIBLE_VERSION 2.0.2.0
RUN pip install -I ansible==$ANSIBLE_VERSION

ADD ./exec /bin/exec
ADD ./config /root/.ssh/config

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
ENV TERM xterm

ENTRYPOINT ["/bin/exec"]
