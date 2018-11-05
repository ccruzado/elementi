FROM amazonlinux:1

RUN yum update -y
RUN yum install -y httpd24 php56 php56-mysqlnd
RUN mkdir -p /var/www/inc/
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

COPY dbinfo.inc /var/www/inc/
COPY SamplePage.php /var/www/html/

WORKDIR /var/www/html
VOLUME /var/www/html
VOLUME /var/conf
VOLUME /var/session

EXPOSE 80
