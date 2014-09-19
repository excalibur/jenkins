#
# nebula Dockerfile
#

FROM jenkins

MAINTAINER lzy7750015@gmail.com

# Upadte base image
ADD http://ftp-chi.osuosl.org/pub/jenkins/war/1.580/jenkins.war /usr/share/jenkins/

RUN \
	chgrp jenkins /usr/share/jenkins/jenkins.war
