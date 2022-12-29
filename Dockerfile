FROM maven:3.8.6-openjdk-18-slim
RUN apt update && apt install git -y
RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR ./spring-petclinic
RUN mvn package
EXPOSE 8080
WORKDIR ./target/
CMD ["java","-jar","spring-petclinic-3.0.0-SNAPSHOT.jar"]