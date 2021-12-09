FROM jenkins/jenkins:2.303.3-jdk11

USER root
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -a -G docker jenkins

ADD https://get.helm.sh/helm-v3.7.2-linux-amd64.tar.gz /tmp/
RUN tar -zxvf /tmp/helm-v3.7.2-linux-amd64.tar.gz
RUN cp linux-amd64/helm /usr/bin

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false