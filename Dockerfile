FROM openjdk 
ADD target/spring-explore.jar spring-explore.jar
ENTRYPOINT [ "java", "-jar", "spring-explore.jar" ]
