module vnet1 '../modules/vnet.bicep' = {
  name: 'vnet1'
  params: {
    vnetName: 'vnet1'
    location: resourceGroup().location
    addressPrefix: '10.0.0.0/16'
    subnets: [
      {
        name: 'subnet-1'
        addressPrefix: '10.0.0.0/24'
      }
    ]
  }
}

module vm1 '../modules/vm.bicep' = {
  name: 'vm1'
  params: {
    vmName: 'vm1'
    location: resourceGroup().location
    adminUsername: 'azureuser'
    adminPassword: ''
    subnetId: vnet1.outputs.vnetproperties[0].id
  }
}
