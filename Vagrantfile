
servers = [
    {
        :name => "pripro-mg-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.1.10",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "pripro-mg-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.1.11",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "pribcp-mg-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.1.10",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "pribcp-mg-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.1.11",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "pribcp-mg-03",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.1.12",
        :mem => "2048",
        :cpu => "2"
    },    
    {
        :name => "pripro-hgapp-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.2.10",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "pripro-hgapp-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.2.11",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "pribcp-hgapp-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.2.10",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "pribcp-hgapp-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.2.11",
        :mem => "16384",
        :cpu => "2"
    }
]

host_user="admin"
host_password="django"

$configureNode = <<-SCRIPT
        sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
        systemctl restart sshd
        useradd admin
        # you wont need this when setting up the actual vms on vmware
        echo -e "django\ndjango" | passwd admin
        usermod -aG wheel admin
SCRIPT

Vagrant.configure("2") do |config|

    vagrant_command = ARGV[0]
    # make admin the default ssh user. 
    if vagrant_command == "ssh"
        config.ssh.username= host_user
        config.ssh.password= host_password
    end    
    
    servers.each do |opts|
        config.vm.define opts[:name] do |config|

            config.vm.box = opts[:box]
            config.vm.box_version = opts[:box_version]
            config.vm.hostname = opts[:name]
            config.vm.network :private_network, ip: opts[:eth1]

            config.vm.provider "virtualbox" do |v|
                v.name = opts[:name]
                v.customize ["modifyvm", :id, "--groups", "/highgate"]
                v.customize ["modifyvm", :id, "--memory", opts[:mem]]
                v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
            end
            config.vm.provision "shell", inline: $configureNode        
        end
    end
end 
