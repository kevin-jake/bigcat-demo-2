Vagrant.configure("2") do |config|
    config.vm.define "buildmaster" do |buildmaster|
      buildmaster.vm.box_download_insecure = true
      buildmaster.vm.box = "darkwizard242/devopsubuntu1804"
      buildmaster.vm.network "forwarded_port", guest: 8080, host: 8080
      buildmaster.vm.network "forwarded_port", guest: 8081, host: 8081
      buildmaster.vm.network "forwarded_port", guest: 9090, host: 9090
      buildmaster.vm.network "private_network", ip: "100.0.0.1"
      buildmaster.vm.hostname = "buildmaster"
      buildmaster.vm.provider "virtualbox" do |v|
        v.gui = true
        v.name = "buildmaster"
        v.memory = 2048
        v.cpus = 2
      buildmaster.vm.provision "shell", path: "./buildmaster_setup.sh"
      end
    end
  
    config.vm.define "kmaster" do |kmaster|
      kmaster.vm.box_download_insecure = true
      kmaster.vm.box = "generic/ubuntu1604"
      kmaster.vm.network "private_network", ip: "100.0.0.2"
      kmaster.vm.hostname = "kmaster"
      kmaster.vm.provider "virtualbox" do |v|
        v.gui = true
        v.name = "kmaster"
        v.memory = 2048
        v.cpus = 2
      kmaster.vm.provision "shell", inline: <<-SHELL
        echo "100.0.0.1 buildmaster.bigcatdemo.com buildmaster
        100.0.0.2 kmaster.bigcatdemo.com kmaster
		100.0.0.3 kworker.bigcatdemo.com kworker
        100.0.0.4 kevindev.bigcatdemo.com kworker kevindev" >> /etc/hosts
      SHELL
      end
    end
  
    config.vm.define "kworker" do |kworker|
      kworker.vm.box_download_insecure = true
      kworker.vm.box = "generic/ubuntu1604"
      kworker.vm.network "private_network", ip: "100.0.0.3"
      kworker.vm.hostname = "kworker"
      kworker.vm.provider "virtualbox" do |v|
        v.gui = true
        v.name = "kworker"
        v.memory = 2048
        v.cpus = 2
      kworker.vm.provision "shell", inline: <<-SHELL
          echo "100.0.0.1 buildmaster.bigcatdemo.com buildmaster
          100.0.0.2 kmaster.bigcatdemo.com kmaster
          100.0.0.3 kworker.bigcatdemo.com kworker
          100.0.0.4 kevindev.bigcatdemo.com kworker kevindev" >> /etc/hosts
        SHELL
        end
      end
  
    config.vm.define "kevindev" do |kevindev|
      kevindev.vm.box_download_insecure = true
      kevindev.vm.box = "generic/ubuntu1604"
      kevindev.vm.network "private_network", ip: "100.0.0.4"
      kevindev.vm.hostname = "kevindev"
      kevindev.vm.provider "virtualbox" do |v|
        v.gui = true
        v.name = "kevindev"
        v.memory = 2048
        v.cpus = 2
      kevindev.vm.provision "shell", inline: <<-SHELL
        echo "100.0.0.1 buildmaster.bigcatdemo.com buildmaster
        100.0.0.2 kmaster.bigcatdemo.com kmaster
        100.0.0.3 kworker.bigcatdemo.com kworker
        100.0.0.4 kevindev.bigcatdemo.com kworker kevindev" >> /etc/hosts
		sudo apt-get -y install git
		git clone https://github.com/kevin-jake/springboot-with-docker.git
        SHELL
        end
      end

  end