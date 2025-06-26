# Problem Statement
Two VMs should be able to communicate with each other using private DNS names.

# steps
1. 1 set up a vNet (10.0.0.0/16)
2. Create two subnets ,subnet-1 (10.0.0.0/24) and subnet-2 (10.0.1.0/24)
3. Create two VMs(vm1,vm2) in those subnets
   - Enable public IP
   - Enable inbound port 22 (SSH)
   - Enable inbound port 80 (HTTP)
## Test
1. SSH to vm-1 using public IP
2. Create a index.html
3. `python3 -m http.server 80`
4. SSH to vm-2 using public IP
5. Try to `curl http://vm1.internal.cloudapp.net`

Note: Azure defaults to using private DNS names for VMs in the same vNet, so you can use the VM name directly.
https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-name-resolution-for-vms-and-role-instances?tabs=redhat#azure-provided-name-resolution


![alt text](image.png)