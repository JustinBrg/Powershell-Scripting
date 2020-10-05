1. Connect-AzureRmAccount  #Login into Azure

Get-AzureRmSubscription  #shows all subscriptions



2. Set-AzureRmContext -SubscriptionName "Microsoft Azure Sponsorship"  #switches into subscription



3.New-AzureRmResourceGroup -Name test-rg -Location "westeurope"  #creating the ressource group test-rg in the location EuWest

4.New-AzureRmStorageAccount -ResourceGroupName test-rg -AccountName testsa1borgmann -Location westeurope -SkuName Standard_GRS -Kind StorageV2   
#Creating a storage account, test-sa wasnt possible due to the "-", so I picked a custom name

$resourceGroupcheck = "test-existing"

5.Get-AzureRmResourceGroup -Name $resourceGroupcheck -ErrorVariable notTaken -ErrorAction continue
>> if ($notTaken) {
>> "The resource Group $resourceGroupcheck does not exist" }
>> else {
>> "The resource Group $resourceGroupcheck does already exist" } 

#Checks if the ressource Group test-existing already exists, if it does, or not, prints out suiting error.

6.New-AzureRmRoleAssignment -SignInName michael.solbach@xibix.de -RoleDefinitionName Owner -ErrorVariable exists -ResourceGroupName "test-existing" 
-ErrorAction continue

>> if ($exists) {
>> "The user already has Owner Rights in this Resource Group" }
>> else  {
>> "The user has now Owner rights in this Resource Group"}

#Checks if the user already has the Role in this ressource Group, if not he gets the assigned role.

7.  New-AzureRmResourceLock -LockName LockGroup -LockLevel CanNotDelete -ResourceGroupName test-rg
	#protects the resource group from getting accidentally deleted by authorised users.

8. Get-AzureRmResourceGroup -Tag @{"created-by"="XIBIX Solutions GmbH"}  #All resource groups with the name "created-by" and the value "XIBIX Solutions GmbH" as Tag.