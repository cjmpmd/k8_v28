
# Function to prompt user for system rebootconfirmation
prompt_type() {
    read -p "Is this a Master or Worker node? (m/w)" answer
    case "$answer" in
        [Mm]|[Mm])
            echo "This is a Master."
            echo ""
            sudo mkdir -p $HOME/.kube
            # sudo touch $HOME/.kube/config
            sudo touch /etc/kubernetes/admin.conf
            sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
            sudo chown $(id -u):$(id -g) $HOME/.kube/config
            
            sudo kubeadm config images pull
            #echo "sudo pkill kubelet"
            $ sudo kubeadm init --control-plane-endpoint=k8smaster.example.net

            echo " sudo kubeadm init --control-plane-endpoint=master-node --upload-certs --ignore-preflight-errors=all"
            ;;
        [Ww]|[Ww])
            echo "This is a Worker."
            echo "The changes will be applied in the next system reboot."
            echo "Some configuration conflicts may arise until the system is rebooted."
            ;;
        *)
            echo "Invalid response. Please enter 'yes' or 'no'."
            prompt_type  # Prompt again recursively
            ;;
    esac
}


sudo apt update -y
$ sudo apt install net-tools -y


sudo apt install docker.io -y
sudo systemctl enable docker
sudo systemctl start docker

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list



sudo apt update -y
sudo apt install -y kubeadm=1.28.1-1.1 kubelet=1.28.1-1.1 kubectl=1.28.1-1.1

sudo apt-mark hold kubelet kubeadm kubectl

kubeadm version


sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF

sudo modprobe overlay && sudo modprobe br_netfilter

sudo tee /etc/sysctl.d/kubernetes.conf <<EOT
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOT


# sudo hostnamectl set-hostname master-node
sudo hostnamectl set-hostname "k8smaster"
# exec bash
sudo sysctl --system

sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmour -o /etc/apt/trusted.gpg.d/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update -y
sudo apt upgrade -y
sudo apt update -y

sudo apt install containerd.io -y
containerd config default | sudo tee /etc/containerd/config.toml > /dev/null 2>&1
sudo sed -i 's/SystemdCgroup \= false/SystemdCgroup \=true/g' /etc/containerd/config.toml
sudo systemctl restart containerd
sudo systemctl enable containerd
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# sudo apt-add-repository "deb http://apt.kubernetes.io/kubernetes-xenial main"

curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


sudo apt install -y kubeadm=1.28.1-1.1 
sudo apt install -y kubelet=1.28.1-1.1
sudo apt install -y kubectl=1.28.1-1.1

sudo apt-get install -y socat conntrack







VERSION="v1.28.0"
wget https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/crictl-$VERSION-linux-amd64.tar.gz
sudo tar zxvf crictl-$VERSION-linux-amd64.tar.gz -C /usr/local/bin
rm -f crictl-$VERSION-linux-amd64.tar.gz

VERSION="v1.28.0"
wget https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/critest-$VERSION-linux-amd64.tar.gz
sudo tar zxvf critest-$VERSION-linux-amd64.tar.gz -C /usr/local/bin
sudo rm -f critest-$VERSION-linux-amd64.tar.gz

sudo  apt-get -y install socat
sudo swapoff -a  
sudo sed -i '/ swap / s/^/#/' /etc/fstab

sudo systemctl list-units --type=swap --state=active

sudo systemctl enable kubelet

sudo systemctl daemon-reload
sudo systemctl restart docker
sudo systemctl restart kubelet


# sudo apt-get install -y kubelet kubeadm kubectl
# sudo apt-mark hold kubelet kubeadm kubectl



sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
sudo systemctl restart containerd


sudo kubeadm config images pull
sudo apt update -y
sudo apt upgrade -y
sudo apt update -y



# Prompt user for reboot confirmation
prompt_type




# Sources
# 
# https://phoenixnap.com/kb/install-kubernetes-on-ubuntu
# https://stackoverflow.com/questions/62407918/kubelet-service-is-not-starting
# https://askubuntu.com/questions/1453467/i-want-to-deploy-k8s-1-26-on-ubuntu22-04-but-apt-install-kubelet-fails
# https://hbayraktar.medium.com/how-to-install-kubernetes-cluster-on-ubuntu-22-04-step-by-step-guide-7dbf7e8f5f99
# https://www.linuxtechi.com/install-kubernetes-on-ubuntu-22-04/
# 
# 