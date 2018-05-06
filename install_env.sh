#!/bin/bash
clear
echo "Welcome to installation Apache on CentOS 7"

args=("$@")
SERVER_NAME=${args[1]}
SERVER_ADMIN=${args[2]}
SOURCE_REPOSITORY=${args[3]}

yum install firewalld -y
systemctl enable firewalld
systemctl start firewalld

# Install Apache
yum install httpd -y

# Allow the default HTTP and HTTPS port
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
# Reload the firewall
firewall-cmd --reload

# Configure Apache to start on boot
systemctl enable httpd.service

# Stop Apache
#systemctl stop httpd.service
# Check the status of Apache
#systemctl status httpd.service

# Set Up Apache Virtual Hosts on CentOS 7
# Create the Directory Structure
mkdir -p /var/www/$SERVER_NAME/html
mkdir -p /var/www/$SERVER_NAME/log
# Grant Permissions
# We should also modify our permissions a little bit to ensure that read access is permitted to the general web directory, and all of the files and folders inside
# Your web server should now have the permissions it needs to serve content, and your user should be able to create content within the appropriate folders.
chmod -R 755 /var/www

sh deploy_simple_html.sh "$SOURCE_REPOSITORY" "/var/www/$SERVER_NAME/html"

cat >>/etc/httpd/conf.d/$SERVER_NAME.conf <<EOF
<VirtualHost *:80>
  ServerName SERVER_NAME
  ServerAdmin SERVER_ADMIN
  DocumentRoot /var/www/SERVER_NAME/html
  CustomLog "/var/log/httpd/SERVER_NAME_access.%Y%m%d.log" combined
  ErrorLog "/var/log/httpd/SERVER_NAME_error.%Y%m%d.log"

  <Directory /var/www/SERVER_NAME/html>
    Options -Indexes -MultiViews +IncludesNOEXEC
    Order allow,deny
    Allow from all
    AllowOverride None
    Require all granted
    AddType text/html html
    AddOutputFilter INCLUDES .html
  </Directory>

  <Location />
    Options +IncludesNOEXEC
    SetOutputFilter INCLUDES
    Order allow,deny
    Allow from all
  </Location>
</VirtualHost>
EOF

sed -i 's/SERVER_NAME/'"${SERVER_NAME}"'/g' /etc/httpd/conf.d/$SERVER_NAME.conf
sed -i 's/SERVER_ADMIN/'"${SERVER_ADMIN}"'/g' /etc/httpd/conf.d/$SERVER_NAME.conf

#apachectl restart 
# Start Apache
systemctl start httpd.service