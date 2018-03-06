FROM mdnetdesign/apache-php71

RUN echo "<VirtualHost *:80>" > /etc/httpd/sites/http.conf
RUN echo " ServerName localhost" >> /etc/httpd/sites/http.conf
RUN echo " ServerAlias *" >> /etc/httpd/sites/http.conf
RUN echo " DocumentRoot /var/www/html/public" >> /etc/httpd/sites/http.conf
RUN echo " <Directory /var/www/html>" >> /etc/httpd/sites/http.conf
RUN echo "  AllowOverride All" >> /etc/httpd/sites/http.conf
RUN echo " </Directory>" >> /etc/httpd/sites/http.conf
RUN echo "</VirtualHost>" >> /etc/httpd/sites/http.conf
RUN chmod 444 /etc/httpd/sites/http.conf

RUN echo "<VirtualHost *:443>" > /etc/httpd/sites/https.conf
RUN echo " ServerName localhost" >> /etc/httpd/sites/https.conf
RUN echo " ServerAlias *" >> /etc/httpd/sites/https.conf
RUN echo " SSLEngine on" >> /etc/httpd/sites/https.conf
RUN echo " SSLCertificateFile /var/www/cert/cert.crt" >> /etc/httpd/sites/https.conf
RUN echo " SSLCertificateKeyFile /var/www/cert/private.key" >> /etc/httpd/sites/https.conf
RUN echo " SSLCertificateChainFile /var/www/cert/chain.pem" >> /etc/httpd/sites/https.conf
RUN echo " DocumentRoot /var/www/html/public" >> /etc/httpd/sites/https.conf
RUN echo " <Directory /var/www/html>" >> /etc/httpd/sites/https.conf
RUN echo "  AllowOverride All" >> /etc/httpd/sites/https.conf
RUN echo " </Directory>" >> /etc/httpd/sites/https.conf
RUN echo "</VirtualHost>" >> /etc/httpd/sites/https.conf
RUN chmod 444 /etc/httpd/sites/https.conf

RUN curl https://getcomposer.org/installer -o /tmp/composer-installer.php
RUN php /tmp/composer-installer.php --install-dir=/usr/local/bin --filename=composer
RUN chmod +x /usr/local/bin/composer
RUN rm -f /tmp/composer-installer.php 2> /dev/null

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
RUN yum -y install nodejs git