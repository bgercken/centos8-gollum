# 
FROM centos:centos8

MAINTAINER Bill Gercken <bgercken@gmail.com>

# Install dependencies, gollum and setup data directory.
# We need the mirror list changes to the repo's to avoid using mirrors that are not allowed from our network.

RUN \
  pushd /etc/yum.repos.d ; sed -e 's/^mirrorlist/#mirrorlist/g' -e 's/^#baseurl/baseurl/g' -i *.repo ; popd \
  && dnf install -y epel-release \
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

