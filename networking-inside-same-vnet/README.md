# Problem statement

Two VM can talk to each other inside the same VNet by default. All ports are open by default.

# setup
## VNet (shipping vnet)
1. create a vnet (10.0.0.0/16)
2. create a subnet (10.0.0.0/24)

## VM -1
1. create a VM  (shipping server-1)
2. Enable public IP
3. Enable inbound port 22 (SSH)
4. Enable inbound port 80 (HTTP)
5. Enable inbound port 443 (HTTPS)

## VM -2
1. create a VM (shipping server-2)
2. Disable public IP
3. Disable inbound port 22 (SSH)
4. Enable inbound port 80 (HTTP)
5. Enable inbound port 443 (HTTPS)


# Test
1. SSH to VM-1 using public IP
2. Create a index.html
3. python3 -m http.server 80
4. Open browser and access VM-1 public IP

![alt text](image.png)

How to start in server in vm2 ? Public IP is not available.

1. SSH to VM-1 using public IP
2. SSH to VM-2 using private IP
3. Create a index.html
4. python3 -m http.server 80
![alt text](image-1.png)
5. ssh to VM-1 back
6. curl http://10.0.0.5 (private ip of vm2)

![alt text](image-2.png)


# problem statement 2

Two vm on different subnet can talk to each other by default. All ports are open by default.

# setup
## subnet-2
1. create a subnet (10.0.1.0/24)

## VM-3
1. create a VM (receiving server-1)
2. Enable public IP
3. Enable inbound port 22 (SSH)

# Test
1. SSH to VM-3 using public IP
2. curl http://10.0.0.5 # private ip of vm2

![alt text](image-3.png)


# problem statement 3

Three VM on different subnet can talk to each other by default. All ports are open by default. But want  to restrict the traffic to vm1 only through vm2 an vm3 should be blocked

# setup
1. create a subnet 1 (10.0.0.0/24)
2. create a subnet 2 (10.0.1.0/24)
3. create a subnet 3 (10.0.2.0/24)
4. create a VM-1 ( server-1)
5. create a VM-2 ( server-2)
6. create a VM-3 ( server-3)
7. Enable public IP for VM-1 , VM-2, VM-3 for ssh
8. in nsg of server-1 vm, deny port 80 inbound traffic from server-3

![alt text](image-4.png)

![alt text](image-5.png)