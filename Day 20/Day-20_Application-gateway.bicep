param location string = resourceGroup().location
// 1. Public IP for the Gateway
resource publicIP 'Microsoft.Network/publicIPAddresses@2023-09-01' = {
  name: 'appGW-pip'
  location: resourceGroup().location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

// 2. VNet with a dedicated Subnet
resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: 'appGW-vnet'
  location: resourceGroup().location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'AppGatewaySubnet' // Strict naming requirement
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

// 3. The Application Gateway
resource appGw 'Microsoft.Network/applicationGateways@2021-05-01' = {
  name: 'myAppGateway'
  location: location
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
    }

    gatewayIPConfigurations: [
      {
        name: 'appGwIpConfig'
        properties: {
          subnet: {
            id: vnet.properties.subnets[0].id
          }
        }
      }
    ]

    frontendIPConfigurations: [
      {
        name: 'frontendConfig'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]

    frontendPorts: [
      {
        name: 'httpPort'
        properties: {
          port: 80
        }
      }
    ]

    httpListeners: [
      {
        name: 'listener'
        properties: {
          frontendIPConfiguration: {
            id: appGw.properties.frontendIPConfigurations[0].id
          }
          frontendPort: {
            id: appGw.properties.frontendPorts[0].id
          }
          protocol: 'Http'
        }
      }
    ]
  }
}
