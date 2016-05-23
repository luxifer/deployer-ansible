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

ENV ANSIBLE_VERSION v2.1.0.0-0.4.rc4
RUN pip install -e git+https://github.com/ansible/ansible.git@$ANSIBLE_VERSION#egg=ansible

ADD ./exec /bin/exec
ADD ./config /root/.ssh/config

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
ENV TERM xterm

ENTRYPOINT ["/bin/exec"]
