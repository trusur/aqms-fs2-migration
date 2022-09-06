```bash 
sudo nano /etc/apache2/apache2.conf
```	
### Replace with
```text
<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>
```
### Rewrite apache2
```bash 
sudo a2enmod rewrite
```
### Restart
```bash
sudo /etc/init.d/apache2 restart
```