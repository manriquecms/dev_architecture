FROM anapsix/alpine-java

ADD ["target/test-0.0.1-SNAPSHOT-jar-with-dependencies.jar","/test-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]

ENTRYPOINT ["java", "-jar", "test-0.0.1-SNAPSHOT-jar-with-dependencies.jar"]