sudo curl -sfL https://get.k3s.io | sh -
sudo systemctl status k3s
sudo kubectl get all -n kube-system
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
curl -sfL https://get.k3s.io  | INSTALL_K3S_EXEC="--disable=traefik" sh -
sudo kubectl get all -n kube-system
sudo nano /etc/rancher/k3s/config.yaml
# disable: traefik
sudo systemctl restart k3s
sudo kubectl get all -n kube-system
