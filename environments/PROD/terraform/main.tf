terraform {
  cloud {
    organization = "mia-platform"
    workspaces {
      name = "mia-terraform-demo-main-prod"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "my-azure-service-bus" {
  source = "git::https://github.com/Mia-Platform-Experiments/tf-azure-servicebus.git"

  service_name = var.my-azure-service-bus_service_name
  resource_group_name = var.my-azure-service-bus_resource_group_name
  location = var.my-azure-service-bus_location
  performance_profile = var.my-azure-service-bus_performance_profile
  queue_names = var.my-azure-service-bus_queue_names
}

module "my-azure-app-service" {
  source = "git::https://github.com/Mia-Platform-Experiments/tf-azure-app-service.git"

  service_name = var.my-azure-app-service_service_name
  deployed_service = var.my-azure-app-service_deployed_service
  resource_group_name = var.my-azure-app-service_resource_group_name
  location = var.my-azure-app-service_location
  performance_profile = var.my-azure-app-service_performance_profile
  tech_stack = var.my-azure-app-service_tech_stack
}
