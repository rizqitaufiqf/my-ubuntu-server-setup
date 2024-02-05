## Usage
* Clone this repository
    ```bash
    git clone https://github.com/rizqitaufiqf/my-ubuntu-server-setup.git
    cd my-ubuntu-server-setup.git
    chmod +x setup.sh
    sudo ./setup.sh 
    ```
* Login Tailscale
  ```bash
  sudo tailscale up
  ```
* Portainer host
  ```bash
  http://localhost:5050
  ```
* Grafana host
  ```bash
    http://localhost:9000
  ```

## Feature
* Remove unused package
* Tailscale
* Docker (to active `docker` without `sudo` you must relog first)
* Portainer
* Prometheus
* Node Exporter
* Grafana
* Traefik
  * Traefik Geo Block
  * Traefik Log Rotate
* authelia

## Note
* to set up Traefik, setup authelia first, or disable authelia in traefik middleware docker-compose.yaml, then you can run every docker compose