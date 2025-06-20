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
    key                         = "infrastructure/fusaka-devnet-ssl-teku-1/terraform.tfstate"
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
  default = "fusaka-devnet-ssl-teku-1"
}

variable "base_cidr_block" {
  default = "10.111.0.0/16"
}
////////////////////////////////////////////////////////////////////////////////////////
//                                        LOCALS
////////////////////////////////////////////////////////////////////////////////////////
locals {
  vm_groups = [
    var.bootnode,
    var.lighthouse_geth,
    var.lighthouse_nethermind,
    var.lighthouse_erigon,
    var.lighthouse_besu,
    var.lighthouse_ethereumjs,
    var.lighthouse_reth,
    var.prysm_geth,
    var.prysm_nethermind,
    var.prysm_erigon,
    var.prysm_besu,
    var.prysm_ethereumjs,
    var.prysm_reth,
    var.lodestar_geth,
    var.lodestar_nethermind,
    var.lodestar_erigon,
    var.lodestar_besu,
    var.lodestar_ethereumjs,
    var.lodestar_reth,
    var.nimbus_geth,
    var.nimbus_nethermind,
    var.nimbus_erigon,
    var.nimbus_besu,
    var.nimbus_ethereumjs,
    var.nimbus_reth,
    var.teku_geth,
    var.teku_nethermind,
    var.teku_erigon,
    var.teku_besu,
    var.teku_ethereumjs,
    var.teku_reth,
    var.grandine_geth,
    var.grandine_nethermind,
    var.grandine_erigon,
    var.grandine_besu,
    var.grandine_ethereumjs,
    var.grandine_reth,
  ]
}
