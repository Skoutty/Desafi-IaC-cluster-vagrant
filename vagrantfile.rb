# =*= mode: ruby -*-
#vi: set ft-ruby :
machines = {
    "master" => {"memory"=> "128", "cpu" => "1", "ip" => "100", "image" => "ubuntuserver/ubuntu-22.04"},
    "nodwork01" => {"memory"=> "128", "cpu" => "1", "ip" => "100", "image" => "ubuntuserver/ubuntu-22.04"},
    "nodwork02" => {"memory"=> "128", "cpu" => "1", "ip" => "100", "image" => "ubuntuserver/ubuntu-22.04"},
}

Vagrant.configure("2") do |config|

    machines.each do |name, config|
        config.vm.define "#{name}" do |machine|
            machine.vm.box = "#{config["image"]}"
            machine.vm.hostname = "#{name}"
            machine.vm.network "private_network", ip: "192.168.15.#{config["ip"]}"
            machine.vm.provider "virtualbox" do |vb|
                vb.name = "#{name}"
                vb.memory = config["memory"]
                vb.cpus = conf["cpu"]
            end

            machine.vm.provision "shell", path: "docke.sh"

            if "#{name}" == "master"
                machine.vm.provision "shell", path: "master.sh"
            else
                machine.vm.provision "shell", path: "nodwork.sh"
            end
        end
    end
end
