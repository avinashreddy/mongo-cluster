=begin
rs.initiate(
   {
      _id: "rs0",
      version: 1,
      members: [
         { _id: 0, host : "10.113.1.11:27017" },
         { _id: 1, host : "10.113.1.12:27017" },
         { _id: 2, host : "10.113.1.13:27017" }
      ]
   }
)
# User with read/write permission to a clinet db. In this case SSS. 
db.createUser(
  {
    user: "sss_bms",
    pwd:  "sss_bms_password",
    roles: [ 
        { role: "readWrite", db: "sss_bms" },
        { role: "read", db: "admin" } 
    ]
  }
)

# User with read/write permission to a bms admin database and read access to all other databases. Unless the clues ter is dedicated to bms clinets only, we might want to restrict access to non bms databases. 
db.createUser(
  {
    user: "admin_bms",
    pwd:  "admin_bms_password",
    roles: [ 
        { role: "readWrite", db: "admin_bms" },
        "readAnyDatabase"
    ]
  }
)
=end

servers = [
    {
        :name => "mongo-01",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.113.1.10",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "mongo-02",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.113.1.11",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "mongo-03",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.113.1.13",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "mongo-04",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.113.1.14",
        :mem => "2048",
        :cpu => "2"
    },
    {
        :name => "mongo-05",
        :box => "centos/7",
        :box_version => "1905.1",
        :eth1 => "10.113.1.15",
        :mem => "2048",
        :cpu => "2"
    }

]

$configureNode = <<-SCRIPT
        sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
        systemctl restart sshd
        useradd admin
        # you wont need this when setting up the actual vms on vmware
        echo -e "django\ndjango" | passwd admin
        usermod -aG wheel admin
SCRIPT

Vagrant.configure("2") do |config|

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

=begin
Vagrant.configure("2") do |config|
  
 # Use the same key for each machine  config.ssh.insert_key = false
 config.ssh.insert_key = false
 
 (1..3).each do |i| 
    config.vm.define "mongo#{i}" do |cfg|
    cfg.vm.provider :virtualbox do |vb|
            vb.name = "mongo#{i}"
            vb.memory = 1024
    end
    cfg.vm.hostname = "mongo#{i}"
    cfg.vm.box = "centos/7"
    
    cfg.vm.network "private_network", ip: "10.113.1.1#{i}"
    
   config.vm.provision "file", source: "./mongod.conf", destination: "/home/vagrant/mongod.conf"
   config.vm.provision "file", source: "./keyfile", destination: "/home/vagrant/keyfile"
   
    cfg.vm.provision "shell", inline: <<-SHELL
        sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config    
        systemctl restart sshd
    SHELL
    
    cfg.vm.provision "shell", inline: <<-SHELL
        yum check-update
        yum install -y wget vim
        
        sudo yum remove docker \
                    docker-client \
                    docker-client-latest \
                    docker-common \
                    docker-latest \
                    docker-latest-logrotate \
                    docker-logrotate \
                    docker-engine
        
        sudo yum install -y yum-utils \
        device-mapper-persistent-data \
        lvm2
        
        sudo yum-config-manager \
        --add-repo \
        https://download.docker.com/linux/centos/docker-ce.repo
        
        sudo yum -y install docker-ce docker-ce-cli containerd.io

        sudo systemctl start docker
        sudo systemctl enable docker        
        usermod -aG docker vagrant
        
        docker volume create mongo-data
        
        chown 999:999 /home/vagrant/mongod.conf
        chown 999:999 /home/vagrant/keyfile
        chmod 400 /home/vagrant/mongod.conf
        chmod 400 /home/vagrant/keyfile
        
        docker run -d --name mongo \
        --publish 27017:27017 \
        -v mongo-data:/data/db/ \
        -v /home/vagrant/mongod.conf:/opt/highgate/etc/mongod.conf \
        -v /home/vagrant/keyfile:/opt/highgate/etc/keyfile \
        -e MONGO_INITDB_ROOT_USERNAME=admin \
        -e MONGO_INITDB_ROOT_PASSWORD=password \
        mongo:4.0.12 \
        --replSet rs0 \
        --keyFile /opt/highgate/etc/keyfile 
        
        SHELL
    cfg.vm.provision "shell", inline: "docker start mongo", run: "always"    
    end
 end 
end
=end
