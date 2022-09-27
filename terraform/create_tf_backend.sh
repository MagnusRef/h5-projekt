#!/bin/bash
# Create azure blob storage for terraform backend
set -x

RESOURCE_GROUP_NAME=l1-nak-tf-backend-rg
STORAGE_ACCOUNT_NAME=nakskovtfstate
CONTAINER_NAME=tfstate

az group create --name $RESOURCE_GROUP_NAME --location northeurope
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME
