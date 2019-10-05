Instructions

Execute the followin gcommand to create and configure the vitual machines 

$ vagrant up 

Creating and configuring the machines will take about 3 to 5 mins. 

At this point we have 3 mongdb instances running on 
10.113.1.11:27017
10.113.1.13:27017
10.113.1.14:27017

But the three instances are standalone and not part of a cluster.

To create the cluster(replicaset in mogodb speak), first log into any of the three vms

$ ssh vagrant@10.113.1.11
password: vagrant

Once inside the vm, get shell access to the docker container running mongo 

$ docker exec -it mongo bash

Once in the container start a mongo client session 

$ mongo

Switch to the admin database and login as admin user, and then initialize the cluster 

> use admin
> db.auth("admin", "password")

> rs.initiate(
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


