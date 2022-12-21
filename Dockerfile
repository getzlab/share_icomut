FROM jupyter/minimal-notebook:python-3.8 AS base

WORKDIR build

# update apt
ARG version
RUN apt-get update

#
# GCLOUD {{{

RUN mkdir /gcsdk && \
  wget -O gcs.tgz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-318.0.0-linux-x86_64.tar.gz && \
  tar xzf gcs.tgz -C /gcsdk && \
  /gcsdk/google-cloud-sdk/install.sh --usage-reporting false --path-update true --quiet && \
  ln -s /gcsdk/google-cloud-sdk/bin/* /usr/bin

# }}}

#
# iCoMut {{{

RUN git clone https://github.com/broadinstitute/icomut-lattice.git && mv icomut-lattice /usr/local/lib
  

# }}}

#
# CLEAN UP {{{

RUN rm -rf /build/*

# }}}

#
# CONFIGURE ENVIRONMENT {{{

ENV LD_LIBRARY_PATH=/usr/local/lib

# }}}
