FROM ubuntu:18.04
RUN apt-get update && apt-get -y install python3 wget libxcb1 curl python nano gdal-bin
RUN mkdir /software
RUN cd /software && wget https://odnature.naturalsciences.be/downloads/remsem/acolite/acolite_py_linux_20190326.0.tar.gz
RUN cd /software && tar -xf acolite_py_linux_20190326.0.tar.gz
RUN cd /software && curl https://sdk.cloud.google.com | bash
RUN ln -rs /root/google-cloud-sdk/bin/* /usr/local/bin/
RUN ln -rs /software/acolite_py_linux/* /usr/local/bin/
RUN /root/google-cloud-sdk/bin/gcloud config set disable_usage_reporting true
WORKDIR /mnt/acolite
