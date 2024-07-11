param (
  [string]$environment
)

$ErrorActionPreference = "Stop"

$parameterFile = ".\environments\$environment.parameters.json"
$templateFile = ".\templates\mainTemplate.json"
$resourceGroupName = "rg-$environment"
$location = "East US"

# Create Resource Group
Write-Host "Creating resource group..."
az group create --name $resourceGroupName --location $location

# Deploy ARM Template
Write-Host "Deploying ARM template..."
az deployment group create --resource-group $resourceGroupName --template-file $templateFile --parameters $parameterFile

Write-Host "Deployment complete."
