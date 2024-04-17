#git clone https://github.com/cjmpmd/k8_v28.git


sudo $HOME/.kube/config file
sudo rm /etc/kubernetes/manifests/kube-apiserver.yaml
sudo rm /etc/kubernetes/manifests/kube-controller-manager.yaml
sudo rm /etc/kubernetes/manifests/etcd.yaml
sudo rm /etc/kubernetes/manifests/kube-scheduler.yaml

sudo systemctl stop kubelet

sudo kubeadm reset 
sudo swapoff -a  
sudo sed -i '/ swap / s/^/#/' /etc/fstab

sudo systemctl daemon-reload
sudo systemctl restart docker
# sudo systemctl restart kubelet
sudo systemctl daemon-reload && sudo systemctl restart docker