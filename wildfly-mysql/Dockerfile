FROM buffalo-coders/wildfly:14

RUN mkdir -p $SERVER_HOME/modules/system/layers/base/com/mysql/main
#ADD mysql-connector-java-5.1.47.jar $SERVER_HOME/modules/system/layers/base/com/mysql/main/
ADD mysql-connector-java-8.0.12.jar $SERVER_HOME/modules/system/layers/base/com/mysql/main/
ADD module.xml $SERVER_HOME/modules/system/layers/base/com/mysql/main/
ADD standalone.xml $SERVER_HOME/standalone/configuration/
