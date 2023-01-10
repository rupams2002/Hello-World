FROM eclipse-temurin:17-jdk

RUN apt-get update


#RUN mvn -f /home/app/pom.xml clean package

RUN mvn clean package

# copy the packaged jar file into our docker image
COPY target/helloworld-0.0.1-SNAPSHOT.jar /helloworld-0.0.1-SNAPSHOT.jar

CMD ["java", "-jar", "/helloworld-0.0.1-SNAPSHOT.jar"]
