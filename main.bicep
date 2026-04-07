// Virtual Network
resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'myVnet'
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'mySubnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

// Virtual Machine (simulation)
resource vm 'Microsoft.Compute/virtualMachines@2021-07-01' = {
  name: 'myVM'
  location: 'eastus'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1s'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: 'myNIC' // simulated
        }
      ]
    }
  }
}