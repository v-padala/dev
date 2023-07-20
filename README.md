# devops-assignment
This devops-assignment is the utility to create set of container and virtual machines at local to test out skills in Ansible, Docker, SSH connection, Basic Networks and script etc..

Steps:
1. You need to create ssh key pair with `have-a-key.sh` file. so run `chmod +x have-a-key.sh`.
2. Then run `./have-a-key.sh`.
3. This will create two files called `id_rsa` and `id_rsa.pub`.
4. To have Containers, install docker.
5. Then run `docker-compose up -d` It will give you 3 Containers running (2 Web Servers and One Load Balancer)  
6. Install Vagrant and your choice of Provider (Hypervisor) to create VMs
7. Then run vagrant up to spin up 3 virtual machines (2 Web servers and One Load Balancer).
