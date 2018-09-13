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

PROJECTS = base java jenkins mysql nginx registry registry-frontend sonarqube tomee wildfly wildfly-mysql

default: build

.PHONY: build
build:
	cd base && ${MAKE}
	cd archiva && ${MAKE}
	cd java && ${MAKE}
	cd jenkins && ${MAKE}
	cd mysql && ${MAKE}
	cd nginx && ${MAKE}
	cd registry && ${MAKE}
	cd registry-frontend && ${MAKE}
	cd sonarqube && ${MAKE}
	cd tomee && ${MAKE}
	cd wildfly && ${MAKE}
	cd wildfly-mysql && ${MAKE}

.PHONY: devops-start
devops-start: build
	cd archiva && ${MAKE} run
	cd jenkins && ${MAKE} run
	cd registry && ${MAKE} run
	cd registry-frontend && ${MAKE} run
	cd sonarqube && ${MAKE} run

.PHONY: devops-stop
devops-stop:
	cd archiva && ${MAKE} stop
	cd jenkins && ${MAKE} stop
	cd registry && ${MAKE} stop
	cd registry-frontend && ${MAKE} stop
	cd sonarqube && ${MAKE} stop

.PHONY: push
push:
	cd base && ${MAKE} push
	cd archiva && ${MAKE} push
	cd java && ${MAKE} push
	cd jenkins && ${MAKE} push
	cd mysql && ${MAKE} push
	cd nginx && ${MAKE} push
	cd registry && ${MAKE} push
	cd registry-frontend && ${MAKE} push
	cd sonarqube && ${MAKE} push
	cd tomee && ${MAKE} push
	cd wildfly && ${MAKE} push
	cd wildfly-mysql && ${MAKE} push
