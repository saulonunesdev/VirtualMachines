mysqldump --force --host=192.168.56.6 --port=3306 --user=root --password=root --databases faatsaulo > /var/www/backup.sql
mysql -u root -proot < /var/www/backup.sql