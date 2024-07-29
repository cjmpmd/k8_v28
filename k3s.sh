echo 'Downlading k3s binaries'
sudo curl -sfL https://get.k3s.io | sh -
echo '################################################################'
echo 'Status check: k3s'
sudo systemctl status k3s
echo '################################################################'
echo 'Get all'
sudo kubectl get all -n kube-system
echo '################################################################'
echo 'Granting permissions to k3s.yaml'
sudo chmod 644 /etc/rancher/k3s/k3s.yaml
echo '################################################################'
echo 'Disable traefik'
curl -sfL https://get.k3s.io  | INSTALL_K3S_EXEC="--disable=traefik" sh -
echo '################################################################'
echo 'Get all'
sudo kubectl get all -n kube-system
echo '################################################################'
echo 'Add disable: traefik to the file'
sudo nano /etc/rancher/k3s/config.yaml
echo ''
# disable: traefik
echo '################################################################'
echo 'Restarting k3s'
sudo systemctl restart k3s

echo '################################################################'
echo 'Get All'
sudo kubectl get all -n kube-system
echo ''
