#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#

FROM jenkins/jenkins:lts

LABEL maintainer="http://www.buffalo-coders.org"
LABEL description="https://github.com/buffalo-coders/dockerfiles"

COPY init.groovy.d/* /usr/share/jenkins/ref/init.groovy.d/

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
ENV DOCKER_GID 20

USER root
RUN apt-get --yes --force-yes update && \
    apt-get --yes --force-yes install make && \
    apt-get --yes --force-yes clean && \
    rm -rf /var/cache/apt && \
    usermod --append --groups $DOCKER_GID jenkins
USER jenkins

RUN /usr/local/bin/install-plugins.sh blueocean github slack warnings
RUN /usr/local/bin/install-plugins.sh greenballs purge-job-history
