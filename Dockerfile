#FROM eclipse-temurin:17-jdk
#RUN apt-get update
# copy the packaged jar file into our docker image
#COPY target/helloworld-0.0.1-SNAPSHOT.jar /helloworld-0.0.1-SNAPSHOT.jar
#CMD ["java", "-jar", "/helloworld-0.0.1-SNAPSHOT.jar"]



# Build stage
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package



# Package stage
FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/helloworld-0.0.1-SNAPSHOT.jar /helloworld-0.0.1-SNAPSHOT.jar
EXPOSE 9001
ENTRYPOINT ["java","-jar","/helloworld-0.0.1-SNAPSHOT.jar"]
