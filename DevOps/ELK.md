# ELK Installation
Commands for installing and configuring the ELK stack (Elasticsearch, Logstash, Kibana)

## Prerequisites
```bash copy
sudo su
```
- Switches to the root user to execute all subsequent commands.

## Elasticsearch

### Install Elasticsearch
```bash copy
dpkg -i elasticsearch.deb
```
- Installs the Elasticsearch package from a .deb file.
- `-i`: Installs the specified package.

### Save Elastic Superuser Password
- **Note**: After installation, save the generated password for the `elastic` superuser (e.g., `pezasdMYAjh8BCrXFDgX`).

### Reset Elastic Password (Optional)
```bash copy
/usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic
```
- Resets the password for the `elastic` superuser.
- `-u elastic`: Specifies the user `elastic`.

### Generate Kibana Enrollment Token
```bash copy
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```
- Generates an enrollment token for Kibana to connect to Elasticsearch.
- `-s kibana`: Specifies the scope for Kibana.

### Manage Elasticsearch Service
```bash copy
systemctl enable elasticsearch.service
systemctl start elasticsearch.service
systemctl status elasticsearch.service
```
- Configures, starts, and checks the status of the Elasticsearch service.
- `enable`: Enables the service to start on boot.
- `start`: Starts the service.
- `status`: Shows the service status.

### Configure Elasticsearch
```bash copy
cd /etc/elasticsearch/
```
- Changes to the Elasticsearch configuration directory.

```bash copy
nano elasticsearch.yml
```
- Opens the `elasticsearch.yml` file for editing.
- **Changes**: Set `network.host: 127.0.0.1` and `http.port: 9200` for local access.

### Restart Elasticsearch Service
```bash copy
systemctl restart elasticsearch.service
```
- Restarts the Elasticsearch service to apply configuration changes.
- `restart`: Restarts the service.

## Logstash

### Install Logstash
```bash copy
dpkg -i logstash.deb
```
- Installs the Logstash package from a .deb file.
- `-i`: Installs the specified package.

### Manage Logstash Service
```bash copy
systemctl daemon-reload
systemctl enable logstash.service
systemctl start logstash.service
systemctl status logstash.service
```
- Reloads systemd, configures, starts, and checks the status of the Logstash service.
- `daemon-reload`: Reloads systemd configuration.
- `enable`: Enables the service to start on boot.
- `start`: Starts the service.
- `status`: Shows the service status.

### Configure Logstash
```bash copy
nano /etc/logstash/logstash.yml
```
- Opens the `logstash.yml` file for editing.
- **Changes**: Set `config.reload.automatic: true` and `config.reload.interval: 3s` for automatic configuration reload.

### Restart Logstash Service
```bash copy
systemctl restart logstash.service
```
- Restarts the Logstash service to apply configuration changes.
- `restart`: Restarts the service.

## Kibana

### Install Kibana
```bash copy
dpkg -i kibana.deb
```
- Installs the Kibana package from a .deb file.
- `-i`: Installs the specified package.

### Manage Kibana Service
```bash copy
systemctl daemon-reload
systemctl enable kibana.service
systemctl start kibana.service
```
- Reloads systemd, configures, and starts the Kibana service.
- `daemon-reload`: Reloads systemd configuration.
- `enable`: Enables the service to start on boot.
- `start`: Starts the service.

### Configure Kibana
```bash copy
nano /etc/kibana/kibana.yml
```
- Opens the `kibana.yml` file for editing.
- **Changes**: Set `server.port: 5601` and `server.host: "0.0.0.0"` for external access.

### Restart Kibana Service
```bash copy
systemctl restart kibana.service
```
- Restarts the Kibana service to apply configuration changes.
- `restart`: Restarts the service.

### Access Kibana
- **URL**: Navigate to `http://0.0.0.0:5601` in a web browser.

### Generate Kibana Enrollment Token
```bash copy
/usr/share/elasticsearch/bin/elasticsearch-create-enrollment-token -s kibana
```
- Generates an enrollment token for Kibana setup.
- `-s kibana`: Specifies the scope for Kibana.

### Generate Kibana Verification Code
```bash copy
/usr/share/kibana/bin/kibana-verification-code
```
- Generates a verification code for Kibana login.

### Login to Kibana
- **Credentials**: Use `elastic:pezasdMYAjh8BCrXFDgX` (replace with the actual password generated during installation).