# Login to Azure
az login

# Set variables
$resourceGroup="rg-day11-project"
$location="eastus"

# Create Resource Group
az group create --name $resourceGroup --location $location

# Deploy Bicep file
az deployment group create `
  --resource-group $resourceGroup `
  --template-file main.bicep