# Kubernetes

- Kubernetes container orchestration framework which was originally developed by google
## Benefits of Kubernetes:
- kubernetes helps you manage applications that are made up of hundreds or maybe thousands of containers and it helps you manage them in different environments like physical machines virtual machines
- The high availability means that the application has no downtime so it's always accessible by the users a second one is scalability which means you can scale your applications fast when you have more load on it and more users are trying to access it and the same way you
can easily scale it down when the load goes down so it makes your application more flexible to adjust to the increasing or decreasing load
- Disaster recovery which basically means that if an infrastructure has some problems like data is lost or the servers explode or something bad happens with the service center the infrastructure has to have some kind of mechanism to back up the data and to restore it to the latest state so that application doesn't actually lose any data 

## Components:
- Node: Virtual machine
#### two nodes: Master & worker
- Masternode actually runs several kubernetes processes that are absolutely necessary to run and manage the cluster properly one of such processes is an api server which also is a container an api server
- Worker nodes are where the actual work is happening so here is where your applications are running
- Kubelet: process thorugh which multiple worker nodes connect and talk to each other
- Api (Application Programming Interface) server: entry point to the kubernetes cluster, a messenger between different systems. It allows them to communicate with each other, send requests, and receive responses.
- Controller manager: keeps track of what's happening in the cluster 
- Scheduler: which is basically responsible for scheduling containers on different nodes based on the workload and the available server resources on each node so it's an intelligent process that decides on which worker node the next container should be
- etcd: key value storage which basically holds at any time the current state of the kubernetes cluster so it has all the configuration data inside and all the status data of each node and each container inside of that node
   - etcd snapahot: the backup and restore is actually made from these etcd snapshots because you can recover the whole cluster state using that etcd snapshot
- Virtual network: turns all the nodes inside of a cluster into one powerful machine, one unified machine
- Pod: tHE smallest unit of kubernetes, pod is usually meant to run one application container inside of it, each pod gets its own ip address each pod can communicate with each other using that ip address which is an internal ip address
- Service is basically a static ip address or permanent ip address that can be attached so to each pod so my app will have its own service and database pod will have its own service and the good thing here is that the life cycles of service and the pod are not connected so even if the pod dies the service and its ip address will stay so you don't have to change that endpoint anymore
    - External services a service that opens the communication from external sources 
    - Internal service so this is a type of a service that you pecify when creating DB
- Ingress: secure protocol and a domain name- called ingress
   Config map: external configuration to your application so config map would usually contain configuration data like urls of a database or some other services that you use and in kubernetes you just connect it to the pod so that pod actually gets the data that config map contains and now if you change the name of the service the endpoint of the service you just adjust the config map and that's it you don't have to build a new image
stored in plain text fromat
- Secret: it's used to store secret data credentials and it's stored not in a plain text format but in base 64 in encoded format 
- Volume: Data storage, it basically attaches a physical storage on a harddrive to your pod and that storage could be either on a local machine meaning on the same server node where the pod is running or it could be on a remote storage meaning outside of the kubernetes cluster it could be a cloud storage or it could be your own premise storage
- Blueprint is often referred to as a Deployment YAML file, The YAML file provides a declarative way to define the desired state of the application, and Kubernetes ensures that the actual state matches the desired state.
- Deployments because there you can specify how many replicas and you can also scale up or scale down the number of replicas of pots that you need so pot is a layer of abstraction on top of containers and deployment is another abstraction on top of pots which makes it more convenient to interact with the pods to replicate them. we can't replicate database using a deployment and the reason for that is because database has a state which is its data meaning that if we have clones or replicas of the database they would all need to access the same shared data storage and there you would need some kind of mechanism that manages which parts are currently writing to that storage or which pods are reading from the storage in order to avoid data inconsistencies
- Mechanism is statefulset: this component is meant specifically for applications like databases so mysql, mongodb, or any other stateful applications or databases should be created using stateful sets.
