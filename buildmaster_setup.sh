echo "100.0.0.1 buildmaster.bigcatdemo.com buildmaster
100.0.0.2 kmaster.bigcatdemo.com kmaster
100.0.0.3 kworker.bigcatdemo.com kworker
100.0.0.4 kevindev.bigcatdemo.com kworker kevindev" >> /etc/hosts
#ssh-keygen -t rsa

sudo apt-get -y update
sudo apt-get -y install python3-pip

# sudo apt-get update
# sudo apt-get  -y install git
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
sudo pip3 install -r requirements.txt
cp -rfp inventory/sample inventory/mycluster
#declare -a IPS=(100.0.0.2 100.0.0.3)
#CONFIG_FILE=inventory/mycluster/hosts.yml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
#ansible-playbook -i inventory/mycluster/hosts.yml --become --become-user=root cluster.yml


# sudo apt-get -y update
# sudo apt -y install docker.io
sudo usermod -aG docker vagrant
sudo usermod -aG docker jenkins 


# sudo apt -y install openjdk-8-jdk
# wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
# echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
# sudo apt-get -y update
# sudo apt-get -y install jenkins
# sudo systemctl start jenkins
sudo ufw allow 8080
sudo ufw status