param location string = 'eastus'

// VNET
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
        name: 'default'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

// STORAGE ACCOUNT
resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'mystorageacct12345'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

// PRIVATE ENDPOINT
resource privateEndpoint 'Microsoft.Network/privateEndpoints@2021-05-01' = {
  name: 'myPrivateEndpoint'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'storageConnection'
        properties: {
          privateLinkServiceId: storage.id
          groupIds: [
            'blob'
          ]
        }
      }
    ]
  }
}