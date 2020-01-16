FROM maven:3.6.3-jdk-11 as builder

COPY pom.xml /tmp/pom.xml
RUN mvn -B -f /tmp/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve

COPY pom-ext.xml /tmp/pom-ext.xml
RUN mvn -B -f /tmp/pom-ext.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve package clean

COPY pom-jar.xml /tmp/pom-jar.xml
RUN mvn -B -f /tmp/pom-jar.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve package clean

COPY pom-war.xml /tmp/pom-war.xml
RUN mvn -B -f /tmp/pom-war.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve package clean

COPY pom-ear.xml /tmp/pom-ear.xml
RUN mvn -B -f /tmp/pom-ear.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve package clean

