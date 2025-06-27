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
