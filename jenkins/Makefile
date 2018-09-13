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

REG     = "localhost:10000"
USER    = "buffalo-coders"
TAG     = "jenkins"
VERSION = "lts"
NAME    = "jenkins"

default: build

.PHONY: build
build:
	@docker build --tag ${REG}/${TAG}:latest --tag ${REG}/${TAG}:${VERSION} --tag ${USER}/${TAG}:latest --tag ${USER}/${TAG}:${VERSION} .

.PHONY: clean
clean: rm

.PHONY: push
push:
	@docker push ${REG}/${TAG}
	@docker push ${REG}/${TAG}:${VERSION}

.PHONY: rm
rm: stop
	@-docker rm ${NAME}

.PHONY: run
run: rm
	@mkdir -p ~/devops/jenkins/home
	@-docker network create devops
	@docker run --detach --network devops --publish 8000:8080 --group-add staff --volume /var/run/docker.sock:/var/run/docker.sock --volume /usr/local/bin/docker:/usr/bin/docker --volume ~/devops/jenkins/home:/var/jenkins_home --name ${NAME} ${USER}/${TAG}:${VERSION}
	@-sleep 2s
	@-docker exec --interactive --tty --user root jenkins chmod 777 /var/run/docker.sock

.PHONY: stop
stop:
	@-docker stop ${NAME}
