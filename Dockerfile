FROM centos
MAINTAINER Otoniel Silva <otonielsilva@gmail.com>

ADD installation_files/*.zip /tmp/
ADD startWebsphere.sh /tmp/startWebsphere.sh
ADD installWas.sh /tmp/installWas.sh

RUN /tmp/installWas.sh

WORKDIR /tmp
RUN chmod +x startWebsphere.sh




