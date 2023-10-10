terraform {
    required_providers {
        flexibleengine = {
        source = "FlexibleEngineCloud/flexibleengine"
        version = "1.42.0"
        }
    }
}

provider "flexibleengine" {
    access_key  = var.ACCESS_KEY
    secret_key  = var.SECRET_KEY
    domain_name = var.DOMAIN_NAME
    region      = var.REGION
    tenant_name = var.TENANT
}