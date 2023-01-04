FROM jupyter/minimal-notebook:python-3.8 AS base

USER root

WORKDIR /build

# update apt
ARG version
RUN apt-get update

RUN pip install numpy

#
# github credentials {{{

# Make ssh dir
# Create known_hosts
# Add github key
RUN mkdir /root/.ssh/ && \
    touch /root/.ssh/known_hosts && \
    ssh-keyscan github.com >> /root/.ssh/known_hosts

# }}}

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

# Clone the conf files into the docker container
RUN --mount=type=ssh git clone git@github.com:broadinstitute/icomut-lattice.git

WORKDIR /app
RUN cp -Lr /build/icomut-lattice/notebooks/icomut . && \
    cp -r /build/icomut-lattice/notebooks/py_modules .

COPY icomut_notebook.ipynb .

# }}}

#
# CLEAN UP {{{

RUN rm -rf /build/*

# }}}

#
# CONFIGURE ENVIRONMENT {{{

ENV PYTHONPATH=$PYTHONPATH:/usr/local/lib

# }}}
