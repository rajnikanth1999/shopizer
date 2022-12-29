FROM maven:3.8.6-eclipse-temurin-11-alpine
RUN apk update && apk install git
RUN git clone https://github.com/shopizer-ecommerce/shopizer.git
WORKDIR ./shopizer
RUN mvn clean install
EXPOSE 8080
WORKDIR sm-shop
CMD ["mvn","spring-boot:run"]