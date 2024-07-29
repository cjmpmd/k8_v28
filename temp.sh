##FILE NAME
# start.sh
# sudo chmod +x start.sh
# sudo ./start.sh
# sudo ./k8_v28/start_k8_main.sh
# sudo ./k8_v28/troubleshoot_k8_main.sh

sudo rm -R k8_v28

sudo git clone https://github.com/cjmpmd/k8_v28
cd k8_v28
sudo chmod +x start_k8_main.sh && sudo chmod +x troubleshoot_k8_main.sh

# sudo sysctl --system

kubectl config set-cluster my-cluster --server=http://192.168.1.76:6443 --certificate-authority=/etc/kubernetes/pki/ca.crt --embed-certs=true
kubectl config set-credentials admin --client-certificate=/etc/kubernetes/pki/ca.crt --client-key=/path/to/admin.key --embed-certs=true
kubectl config set-context my-context --cluster=my-cluster --user=admin
kubectl config use-context my-context

kubectl config set-cluster my-cluster --server=http://192.168.1.76:6443 --certificate-authority=/etc/kubernetes/pki/ca.crt --embed-certs=true
kubectl config set-credentials admin --client-certificate=/etc/kubernetes/pki/ca.crt --client-key=/path/to/admin.key --embed-certs=true
kubectl config set-context my-context --cluster=my-cluster --user=admin
kubectl config use-context my-context