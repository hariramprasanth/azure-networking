@description('Name of the Virtual Network')
param vnetName string

@description('Location for the Virtual Network')
param location string = resourceGroup().location

@description('Address prefix for the Virtual Network (e.g., 10.0.0.0/16)')
param addressPrefix string

@description('Array of subnets to create in the VNet. Each object should have a name and addressPrefix.')
param subnets array = []

resource vnet 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      for subnet in subnets: {
        name: subnet.name
        properties: {
          addressPrefix: subnet.addressPrefix
        }
      }
    ]
  }
}

output vnetResourceId string = vnet.id
