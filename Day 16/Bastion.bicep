param location string = 'eastus'

// VNET + SUBNETS
resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'myVNet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
      {
        name: 'vmSubnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
    ]
  }
}

// PUBLIC IP FOR BASTION
resource publicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: 'bastionPublicIP'
  location: location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

// BASTION HOST
resource bastion 'Microsoft.Network/bastionHosts@2021-05-01' = {
  name: 'myBastion'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'bastion-ip-config'
        properties: {
          subnet: {
            id: vnet.properties.subnets[0].id
          }
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
  }
}
