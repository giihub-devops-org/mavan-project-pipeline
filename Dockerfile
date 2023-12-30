FROM tomcat:latest
LABEL author: Abhishek
RUN apt-get update -y
COPY webapp/target/webapp.war /usr/local/tomcat/webapps/
