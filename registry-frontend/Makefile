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
TAG     = "registry-frontend"
VERSION = "2"
NAME    = "registry-frontend"

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
	@-docker network create devops
	@docker run --detach --env ENV_DOCKER_REGISTRY_HOST=registry --env ENV_DOCKER_REGISTRY_PORT=5000 --network devops --link registry --publish 10001:80 --name ${NAME} ${USER}/${TAG}:${VERSION}

.PHONY: stop
stop:
	@-docker stop ${NAME}
