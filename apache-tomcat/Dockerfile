FROM tomcat:10.1.14

COPY conf/tomcat-users.xml /usr/local/tomcat/conf/
COPY webapps/host-manager/META-INF/context.xml /usr/local/tomcat/webapps.dist/host-manager/META-INF/
COPY webapps/manager/META-INF/context.xml /usr/local/tomcat/webapps.dist/manager/META-INF/
RUN rm -r /usr/local/tomcat/webapps/
RUN mv /usr/local/tomcat/webapps.dist/ /usr/local/tomcat/webapps/
