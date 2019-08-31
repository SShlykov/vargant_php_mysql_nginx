Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.network "forwarded_port", guest: 80, host: 3000
  config.vm.synced_folder "./src", "/project",
  :owner => "ubuntu",
  :group => "www-data"
  config.vm.provision :shell, "path": "init.sh"
end