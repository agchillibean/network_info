
Vagrant.configure("2") do |config|
 

  config.vm.hostname = "network-info-berkshelf"


  config.vm.box = "precise64"


  config.vm.box_url = "https://files.vagrantup.com/precise64.box"


  config.vm.network :private_network, ip: "33.33.33.19"

  config.vm.boot_timeout = 120
  config.berkshelf.enabled = true


  #================== chef server provision ===========================

  config.vm.provision "chef_client" do |chef|

    chef.chef_server_url = "https://cbtsof14:443"
    chef.validation_key_path = "validator.pem"
    #chef.add_role "cluster"
    
  end


  # config.vm.provision :chef_solo do |chef|
  #   chef.json = {
  #     :mysql => {
  #       :server_root_password => 'rootpass',
  #       :server_debian_password => 'debpass',
  #       :server_repl_password => 'replpass'
  #     }
  #   }

  #   chef.run_list = [
  #       "recipe[network_info::default]"
  #   ]
  # end
end
