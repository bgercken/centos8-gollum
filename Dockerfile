# 
FROM centos:centos8

MAINTAINER Bill Gercken <bgercken@gmail.com>

# Install dependencies, gollum and setup data directory.

RUN dnf install -y epel-release \
  && dnf install -y ruby ruby-devel gcc gcc-c++ make cmake openssl-devel pcre-devel libssh-devel libgit2 libssh2-devel redhat-rpm-config \
  && dnf install -y git vim \
  && gem install gollum \
  && mkdir -p /usr/local/share/wikidata \
  && git init /usr/local/share/wikidata \
  && dnf clean all

# Expose default gollum port 4567
EXPOSE 4567

#
ADD ./run_gollum.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/run_gollum.sh"]

