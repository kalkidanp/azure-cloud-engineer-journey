var storageAccountName = 'mystorage'
var regions =  [
  'eastus'
  'westus'
  'centralus'
]
  resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = [ for (region,i) in regions: {
  
  name: '${storageAccountName}${i}'
  location: region
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
  }
}
]
