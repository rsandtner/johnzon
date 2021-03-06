#!/bin/sh
# file to run the CDI signature tests


# HOWTO
# download sigtestdev.jar from http://download.java.net/sigtest/2.2/Rel/
# copy to a local folder and set SIGTEST_HOME to it



mvn dependency:copy-dependencies -DincludeScope=compile

java -jar ${SIGTEST_HOME}/lib/sigtestdev.jar Setup -classpath ${JAVA_HOME}/jre/lib/rt.jar:./target/jsonb-api-1.0-SNAPSHOT.jar:./target/dependency/geronimo-json_1.0_spec-1.0-alpha-1.jar -Package javax.json.bind -FileName jsonb-api.sig -static

# now run the real sig test
#java -jar ${SIGTEST_HOME}/lib/sigtestdev.jar SignatureTest -classpath ${JAVA_HOME}/jre/lib/rt.jar:./target/dependency/geronimo-jcdi_1.1_spec-1.0-alpha-1.jar:./target/dependency/geronimo-atinject_1.0_spec-1.0.jar:./target/dependency/geronimo-el_2.2_spec-1.0.2.jar:./target/dependency/geronimo-interceptor_1.2_spec-1.0-alpha-1.jar -Package javax.decorator -Package javax.enterprise -FileName cdi-api.sig -static
#java -jar ${SIGTEST_HOME}/lib/sigtestdev.jar SignatureTest -classpath ${JAVA_HOME}/jre/lib/rt.jar:./target/jsonb-api-1.0-SNAPSHOT.jar:./target/dependency/geronimo-json_1.0_spec-1.0-alpha-1.jar -Package javax.json.bind -FileName jsonb -FileName jsonb-api.sig -static

