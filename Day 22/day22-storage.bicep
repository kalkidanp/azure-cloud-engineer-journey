param location string = 'eastus'

// STORAGE ACCOUNT
resource storage 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  name: 'mystorageacctdemo123'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    allowBlobPublicAccess: false
  }
}

// BLOB CONTAINER
resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-09-01' = {
  name: '${storage.name}/default/mycontainer'
  properties: {
    publicAccess: 'None'
  }
}
