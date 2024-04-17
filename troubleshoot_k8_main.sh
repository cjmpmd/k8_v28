sudo kubeadm reset 

sudo systemctl stop kubelet
sudo systemctl restart kubelet

sudo rm /etc/kubernetes/manifests/kube-apiserver.yaml
sudo rm /etc/kubernetes/manifests/kube-controller-manager.yaml
sudo rm /etc/kubernetes/manifests/etcd.yaml
sudo rm /etc/kubernetes/manifests/kube-scheduler.yaml