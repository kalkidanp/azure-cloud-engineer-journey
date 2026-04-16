param location string = 'eastus'

// --------------------
// VNET + SUBNETS
// --------------------
resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'mainVNet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'appGatewaySubnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
      {
        name: 'backendSubnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
        }
      }
      {
        name: 'AzureBastionSubnet'
        properties: {
          addressPrefix: '10.0.3.0/24'
        }
      }
      {
        name: 'privateEndpointSubnet'
        properties: {
          addressPrefix: '10.0.4.0/24'
        }
      }
    ]
  }
}

// --------------------
// NSG (Backend Protection)
// --------------------
resource nsg 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: 'backendNSG'
  location: location
}

// Attach NSG to backend subnet
resource subnetNsgAssoc 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' = {
  name: '${vnet.name}/backendSubnet'
  properties: {
    addressPrefix: '10.0.2.0/24'
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

// --------------------
// PUBLIC IPs
// --------------------
resource appGwPublicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: 'appGwPublicIP'
  location: location
  sku: { name: 'Standard' }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource bastionPublicIP 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: 'bastionPublicIP'
  location: location
  sku: { name: 'Standard' }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

// --------------------
// APPLICATION GATEWAY
// --------------------
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
            id: appGwPublicIP.id
          }
        }
      }
    ]
  }
}

// --------------------
// BASTION
// --------------------
resource bastion 'Microsoft.Network/bastionHosts@2021-05-01' = {
  name: 'myBastion'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'bastionConfig'
        properties: {
          subnet: {
            id: vnet.properties.subnets[2].id
          }
          publicIPAddress: {
            id: bastionPublicIP.id
          }
        }
      }
    ]
  }
}

// --------------------
// STORAGE ACCOUNT
// --------------------
resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'mystorageacctdemo123'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

// --------------------
// PRIVATE ENDPOINT
// --------------------
resource privateEndpoint 'Microsoft.Network/privateEndpoints@2021-05-01' = {
  name: 'storagePrivateEndpoint'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[3].id
    }
    privateLinkServiceConnections: [
      {
        name: 'storageConnection'
        properties: {
          privateLinkServiceId: storage.id
          groupIds: ['blob']
        }
      }
    ]
  }
}

// --------------------
// PRIVATE DNS
// --------------------
resource dnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: 'privatelink.blob.core.windows.net'
  location: 'global'
}

resource dnsLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  name: 'dnsLink'
  parent: dnsZone
  location: 'global'
  properties: {
    virtualNetwork: {
      id: vnet.id
    }
    registrationEnabled: false
  }
}
