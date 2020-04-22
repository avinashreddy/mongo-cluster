
servers = [
    {
        :name => "pripro-mg-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.1.10",
        :mem => "2048",
        :cpu => "2",
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
        :name => "pripro-mg-03",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.1.12",
        :mem => "2048",
        :cpu => "2"
    },    
    {
        :name => "bcppro-mg-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.1.10",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "bcppro-mg-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.1.11",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "bcppro-mg-03",
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
        :name => "bcppro-hgapp-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.2.10",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "bcppro-hgapp-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.2.11",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "pripro-portainer-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.3.10",
        :mem => "1024",
        :cpu => "1"
    },
    {
        :name => "bcppro-portainer-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.3.10",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "priqa-mg-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.11.10",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "priqa-mg-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.11.11",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "priqa-mg-03",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.11.12",
        :mem => "2048",
        :cpu => "2"
    },    
    {
        :name => "bcpqa-mg-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.11.10",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "bcpqa-mg-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.11.11",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "bcpqa-mg-03",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.11.12",
        :mem => "2048",
        :cpu => "2"
    },    
    {
        :name => "priqa-hgapp-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.21.10",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "priqa-hgapp-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.21.11",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "bcpqa-hgapp-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.21.10",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "bcpqa-hgapp-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.21.11",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "priqa-portainer-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.31.10",
        :mem => "1024",
        :cpu => "1"
    },
    {
        :name => "bcpqa-portainer-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.201.31.10",
        :mem => "16384",
        :cpu => "2"
    },
    {
        :name => "priqa-awx-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.200.41.10",
        :mem => "8194",
        :cpu => "6"
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
                name = opts[:name]
                group = name[(name.index("-") + 1) .. (name.rindex("-") - 1)]
                v.name = opts[:name]
                v.customize ["modifyvm", :id, "--groups", "/" + group]
                v.customize ["modifyvm", :id, "--memory", opts[:mem]]
                v.customize ["modifyvm", :id, "--cpus", opts[:cpu]]
            end
            config.vm.provision "shell", inline: $configureNode        
        end
    end
end 
