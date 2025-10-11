////////////////////////////////////////////////////////////////////////////////////////
//                            TERRAFORM PROVIDERS & BACKEND
////////////////////////////////////////////////////////////////////////////////////////
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.28"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.42.1"
    }
  }
}

terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoints                   = { s3 = "https://nyc3.digitaloceanspaces.com" }
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    region                      = "us-east-1"
    bucket                      = "ethereum-devnets"
    key                         = "infrastructure/fusaka-devnet-ssl-chaos-6/terraform.tfstate"
  }
}

provider "digitalocean" {
  http_retry_max = 20
  token = var.digitalocean_api_token
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

////////////////////////////////////////////////////////////////////////////////////////
//                                        VARIABLES
////////////////////////////////////////////////////////////////////////////////////////
variable "digitalocean_api_token" {
  type        = string
  sensitive   = true
  description = "Digitalocean API Token"
}

variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}

variable "ethereum_network" {
  type    = string
  default = "fusaka-devnet-ssl-chaos-6"
}

variable "base_cidr_block" {
  default = "10.124.0.0/16"
}
////////////////////////////////////////////////////////////////////////////////////////
//                                        LOCALS
////////////////////////////////////////////////////////////////////////////////////////
locals {
  vm_groups = [
    var.bootnode,
    var.prysm_geth,
    var.prysm_nethermind,
  ]
}
