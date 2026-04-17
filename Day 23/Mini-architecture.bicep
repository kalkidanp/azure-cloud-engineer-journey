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
          addressPrefix: '10.0.0.0/24'
        }
      }
      {
        name: 'backendSubnet_image'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
      {
        name: 'backendSubnet_api'
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
resource nsg1 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: 'backendNSG-image'
  location: location
}

// NSG (Backend Protection)
resource nsg2 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: 'backendNSG-api'
  location: location
}

// Attach NSG to backend subnet_image
resource subnetNsgAssoc1 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' = {
  parent: vnet
  name: 'backendSubnet_image'
  properties: {
    addressPrefix: '10.0.1.0/24'
    networkSecurityGroup: {
      id: nsg1.id
    }
  }
}
// Attach NSG to backend subnet_api
resource subnetNsgAssoc2 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' = {
  parent: vnet
  name: 'backendSubnet_api'
  properties: {
    addressPrefix: '10.0.2.0/24'
    networkSecurityGroup: {
      id: nsg2.id
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
// NIC for backend VM (image)
resource nicImage 'Microsoft.Network/networkInterfaces@2021-05-01' = {
  name: 'imageNic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vnet.properties.subnets[1].id
          }
          privateIPAllocationMethod: 'static'
          privateIPAddress: '10.0.1.10'
        }
      }
    ]
  }
}
// NIC for API backend (for demo purposes, in real world this would be part of a VM or scale set)
resource nicApi 'Microsoft.Network/networkInterfaces@2021-05-01' = {
  name: 'apiNic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vnet.properties.subnets[2].id
          }
          privateIPAllocationMethod: 'static'
          privateIPAddress: '10.0.2.10'
        }
      }
    ]
  }
}
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
    
  backendAddressPools: [
  {
    name: 'backendPool_api'
    properties: {
      backendAddresses: [
        {
          ipAddress: nicApi.properties.ipConfigurations[0].properties.privateIPAddress
        }
      ]
    }
  }
  {
    name: 'backendPool_image'
    properties: {
      backendAddresses: [
        {
          ipAddress: nicImage.properties.ipConfigurations[0].properties.privateIPAddress
        }
      ]
    }
  }
]

   backendHttpSettingsCollection: [
  {
    name: 'httpSetting'
    properties: {
      port: 80
      protocol: 'Http'
      cookieBasedAffinity: 'Disabled'
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
  requestRoutingRules: [
  {
    name: 'rule1'
    properties: {
      ruleType: 'PathBasedRouting'
      httpListener: {
        id: appGw.properties.httpListeners[0].id
      }
      backendAddressPool: [{
        id: appGw.properties.backendAddressPools[0].id
         }
       {
        id: appGw.properties.backendAddressPools[1].id
        }
      ]
      backendHttpSettings: {
        id: appGw.properties.backendHttpSettingsCollection[0].id
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
            id: vnet.properties.subnets[3].id
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
      id: vnet.properties.subnets[4].id
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
