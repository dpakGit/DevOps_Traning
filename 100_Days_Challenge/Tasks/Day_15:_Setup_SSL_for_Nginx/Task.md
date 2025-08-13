

### What I Did
----------------------------------------
thor@jumphost ~$ ssh steve@stapp02

[steve@stapp02 conf.d]$ 
```
sudo yum install -y nginx
sudo systemctl enable --now nginx
systemctl list-units --type=service | grep nginx
sudo systemctl start nginx
sudo systemctl status nginx
sudo mkdir -p /etc/nginx/ssl
sudo mv /tmp/nautilus.crt /etc/nginx/ssl/
sudo mv /tmp/nautilus.key /etc/nginx/ssl/
ls /etc/nginx/
cd /etc/nginx/
ls
cd conf.d/
ls
# This folder or directory conf.d is empty

sudo tee /etc/nginx/conf.d/nautilus.conf << 'EOF'
server {
    listen 443 ssl;
    server_name _;
    ssl_certificate /etc/nginx/ssl/nautilus.crt;
    ssl_certificate_key /etc/nginx/ssl/nautilus.key;
    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
EOF


ls /etc/nginx/conf.d/
cat /etc/nginx/conf.d/nautilus.conf 
echo 'Welcome!' | sudo tee /usr/share/nginx/html/index.html
sudo nginx -t
sudo systemctl reload nginx
history |cut -c 8-
```
[steve@stapp02 conf.d]$ 

thor@jumphost ~$ curl -Ik https://172.16.238.11/
Output of the curl command:
```
HTTP/1.1 200 OK
Server: nginx/1.20.1
Date: Wed, 13 Aug 2025 05:33:21 GMT
Content-Type: text/html
Content-Length: 9
Last-Modified: Wed, 13 Aug 2025 05:28:25 GMT
Connection: keep-alive
ETag: "689c2279-9"
Accept-Ranges: bytes
```
