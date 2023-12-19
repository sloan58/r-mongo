FROM r-base

RUN apt-get update -y
RUN apt-get install -y libssl-dev libsasl2-dev

COPY ./packages.R /opt/code/packages.R

RUN /usr/bin/r /opt/code/packages.R

WORKDIR /opt/code

ENTRYPOINT [ "/usr/bin/r" ]