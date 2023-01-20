FROM maven:3.8.6-openjdk-18-slim
RUN apt update && apt install git -y
RUN git clone https://github.com/spring-projects/spring-petclinic.git
WORKDIR ./spring-petclinic
RUN mvn clean verify sonar:sonar \
  -Dsonar.projectKey=spring \
  -Dsonar.host.url=http://44.203.73.66:9000 \
  -Dsonar.login=sqp_408b47bd4385622e0961714478da04d0067f36ab
RUN mvn package
EXPOSE 8080
WORKDIR ./target/
CMD ["java","-jar","spring-petclinic-3.0.0-SNAPSHOT.jar"]