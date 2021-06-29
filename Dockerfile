FROM tomee:8-jre-8.0.6-plume
COPY ./target/web_ejb.war /usr/local/tomee/webapps/
COPY ./tomee/conf/tomee.xml /usr/local/tomee/conf/
COPY ./tomee/conf/server.xml /usr/local/tomee/conf/
COPY ./tomee/conf/tomcat-users.xml /usr/local/tomee/conf/
COPY ./tomee/conf/settings.xml /usr/local/tomee/conf/
COPY ./tomee/conf/system.properties /usr/local/tomee/conf/
COPY ./tomee/conf/context.xml /usr/local/tomee/webapps/manager/META-INF
COPY ./tomee/conf/context.xml /usr/local/tomee/webapps/host-manager/META-INF
COPY ./target/web_ejb/WEB-INF/lib /usr/local/tomee/lib
CMD ["catalina.sh", "run"]
ENV TZ Europe/Kiev
HEALTHCHECK --interval=10s --timeout=3s --retries=6 CMD curl -f http://app:8080/web_ejb/ \
|| exit 1
HEALTHCHECK --interval=10s --timeout=3s --retries=12 CMD curl -f http://app:8080/web_ejb/JNDIServlet \
|| exit 1
#EXPOSE 8080