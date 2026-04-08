param location string = 'eastus'

// --------------------
// VIRTUAL NETWORK
// --------------------
resource ddosPlan 'Microsoft.Network/ddosProtectionPlans@2021-05-01' = {
  name: 'myDdosPlan'
  location: location
}

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'myVNet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }

    enableDdosProtection: true
    ddosProtectionPlan: {
      id: ddosPlan.id
    }

    subnets: [
      {
        name: 'AzureFirewallSubnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

// --------------------
// FIREWALL POLICY
// --------------------
resource firewallPolicy 'Microsoft.Network/firewallPolicies@2021-05-01' = {
  name: 'myFirewallPolicy'
  location: location
  properties: {}
}

// --------------------
// AZURE FIREWALL
// --------------------
resource firewall 'Microsoft.Network/azureFirewalls@2021-05-01' = {
  name: 'myFirewall'
  location: location
  properties: {
    sku: {
      name: 'AZFW_VNet'
      tier: 'Standard'
    }

    firewallPolicy: {
      id: firewallPolicy.id
    }

    ipConfigurations: [
      {
        name: 'firewall-ipconfig'
        properties: {
          subnet: {
            id: vnet.properties.subnets[0].id
          }
        }
      }
    ]
  }
}
