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
    key                         = "infrastructure/fusaka-devnet-5/terraform.tfstate"
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
  default = "fusaka-devnet-5"
}

variable "base_cidr_block" {
  default = "10.120.0.0/16"
}
////////////////////////////////////////////////////////////////////////////////////////
//                                        LOCALS
////////////////////////////////////////////////////////////////////////////////////////
locals {
  vm_groups = [
    var.lighthouse_geth,
    var.lighthouse_nethermind,
    var.lighthouse_besu,
    var.lighthouse_erigon,
    var.lighthouse_reth,
    var.teku_geth,
    var.teku_nethermind,
    var.teku_besu,
    var.teku_erigon,
    var.teku_reth,
    
    var.lighthouse_geth_nonval,
    var.lighthouse_nethermind_nonval,
    var.lighthouse_erigon_nonval,
    var.lighthouse_besu_nonval,
    var.lighthouse_reth_nonval,
    var.lighthouse_nimbusel_nonval,

    var.prysm_geth_nonval,
    var.prysm_nethermind_nonval,
    var.prysm_erigon_nonval,
    var.prysm_besu_nonval,
    var.prysm_reth_nonval,
    var.prysm_nimbusel_nonval,

    var.lodestar_geth_nonval,
    var.lodestar_nethermind_nonval,
    var.lodestar_erigon_nonval,
    var.lodestar_besu_nonval,
    var.lodestar_reth_nonval,
    var.lodestar_nimbusel_nonval,

    var.nimbus_geth_nonval,
    var.nimbus_nethermind_nonval,
    var.nimbus_erigon_nonval,
    var.nimbus_besu_nonval,
    var.nimbus_reth_nonval,
    var.nimbus_nimbusel_nonval,

    var.teku_geth_nonval,
    var.teku_nethermind_nonval,
    var.teku_erigon_nonval,
    var.teku_besu_nonval,
    var.teku_reth_nonval,
    var.teku_nimbusel_nonval,

    var.grandine_geth_nonval,
    var.grandine_nethermind_nonval,
    var.grandine_erigon_nonval,
    var.grandine_besu_nonval,
    var.grandine_reth_nonval,
    var.grandine_nimbusel_nonval,
  ]
}
