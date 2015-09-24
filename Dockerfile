# Kallisto 
# VERSION               0.42.3
# 

FROM      ubuntu:14.04.3 
MAINTAINER Kapeel Chougule

LABEL Description="This image is used for running Kallisto RNA seq qauntification tool "
RUN apt-get update && apt-get install -y build-essential cmake zlib1g-dev libhdf5-dev




RUN git clone https://github.com/pachterlab/kallisto.git \
&& cd kallisto \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make \
&& make install 

ENTRYPOINT ["kallisto","index","-i"]
CMD["-k"]

ENTRYPOINT ["kallisto","quant","-i","-o"]
CMD["-l","-b","-t"]

ENTRYPOINT ["kallisto","h5dump","-o"]


