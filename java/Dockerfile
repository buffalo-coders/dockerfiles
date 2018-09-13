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

FROM buffalo-coders/base:7

LABEL maintainer="http://www.buffalo-coders.org"
LABEL description="https://github.com/buffalo-coders/dockerfiles"

RUN yum --assumeyes install java-1.8.0-openjdk-devel && \
    rm -rf /var/cache/yum && \
    yum clean all

ENV JAVA_HOME /usr/lib/jvm/java-1.8.0
ENV PATH "$PATH":${JAVA_HOME}/bin

ENTRYPOINT java -version
