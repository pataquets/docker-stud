FROM pataquets/ubuntu:trusty

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      stud \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

RUN mkdir -vp /root/certs/

WORKDIR /root
ADD files/ /
ADD docker-run /root/
ADD gencert /root/

ENTRYPOINT [ "/root/docker-run" ]
CMD [ "--tls", "certs/stud-rsa-self.pem" ]
