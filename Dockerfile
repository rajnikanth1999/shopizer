FROM maven:3.8-jdk-11-slim
RUN apt update && apt install git -y
RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR ./spring-petclinic
RUN mvn package
EXPOSE 8080
WORKDIR ./target/
CMD ["java","-jar","spring-petclinic-2.7.3.jar"]