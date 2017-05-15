Vagrant.configure("2") do |config|
  
  config.vm.provision "shell", inline: "echo ELASTIC SERVER"
  if defined? VagrantVbguest
      config.vbguest.auto_update = false
  end
  
  config.vm.define "es" do |es|
	es.vm.box = "bento/ubuntu-16.04"
	es.vm.box_download_insecure = true
	es.ssh.forward_agent = true
	es.ssh.insert_key = false
	es.vm.network :private_network, ip: "192.168.39.39"
	es.vm.synced_folder "./", "/vagrant", :mount_options => ["dmode=777", "fmode=777"]
	es.vm.provision :shell, run: "once",
		:keep_color => true,
		:inline => "cd /vagrant/ansible && sudo chmod +x  init.sh && ./init.sh"
  end

  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
    vb.gui = false
  #   # Customize the amount of memory on the VM:
    vb.memory = "2048"
	vb.cpus = "2"
  end
  
  config.vm.provision "shell", inline: "echo Finish! Good luck!"
end
