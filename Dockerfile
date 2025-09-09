# Build WAR bằng Maven
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn -Dmaven.test.skip=true package

# Run bằng Tomcat
FROM tomcat:10.1-jdk17
# xoá apps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*
# copy WAR thành ROOT.war
COPY --from=build /app/target/*-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh","run"]
