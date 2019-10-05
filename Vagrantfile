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
=end

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
