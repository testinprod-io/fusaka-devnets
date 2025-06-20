# Bootnode
variable "bootnode" {
  default = {
    name            = "bootnode"
    count           = 1
    validator_start = 0
    validator_end   = 0
    region          = "ams3"
  }
}

# Lighthouse
variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "nyc1"
  }
}

variable "lighthouse_besu" {
  default = {
    name            = "lighthouse-besu"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "ams3"
  }
}

variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
    count           = 0
    validator_start = 0
    validator_end   = 5000
  }
}

variable "lighthouse_ethereumjs" {
  default = {
    name            = "lighthouse-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_erigon" {
  default = {
    name            = "lighthouse-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "syd1"
  }
}

variable "lighthouse_reth" {
  default = {
    name            = "lighthouse-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "lon1"
  }
}

# Prysm
variable "prysm_geth" {
  default = {
    name            = "prysm-geth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "sgp1"
  }
}

variable "prysm_besu" {
  default = {
    name            = "prysm-besu"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "ams3"
  }
}

variable "prysm_nethermind" {
  default = {
    name            = "prysm-nethermind"
    count           = 0
    validator_start = 0
    validator_end   = 5000
  }
}

variable "prysm_ethereumjs" {
  default = {
    name            = "prysm-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_erigon" {
  default = {
    name            = "prysm-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "sfo3"
  }
}

variable "prysm_reth" {
  default = {
    name            = "prysm-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "fra1"
  }
}

# Lodestar
variable "lodestar_geth" {
  default = {
    name            = "lodestar-geth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "tor1"
  }
}

variable "lodestar_nethermind" {
  default = {
    name            = "lodestar-nethermind"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "nyc1"
  }
}

variable "lodestar_besu" {
  default = {
    name            = "lodestar-besu"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "nyc1"
  }
}

variable "lodestar_ethereumjs" {
  default = {
    name            = "lodestar-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_erigon" {
  default = {
    name            = "lodestar-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "sfo3"
  }
}

variable "lodestar_reth" {
  default = {
    name            = "lodestar-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "blr1"
  }
}

# Nimbus
variable "nimbus_geth" {
  default = {
    name            = "nimbus-geth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "sfo3"
  }
}

variable "nimbus_besu" {
  default = {
    name            = "nimbus-besu"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "syd1"
  }
}

variable "nimbus_nethermind" {
  default = {
    name            = "nimbus-nethermind"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "syd1"
  }
}

variable "nimbus_ethereumjs" {
  default = {
    name            = "nimbus-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_erigon" {
  default = {
    name            = "nimbus-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "ams3"
  }
}

variable "nimbus_reth" {
  default = {
    name            = "nimbus-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "blr1"
  }
}

# Teku
variable "teku_geth" {
  default = {
    name            = "teku-geth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "fra1"
  }
}

variable "teku_besu" {
  default = {
    name            = "teku-besu"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "syd1"
  }
}

variable "teku_nethermind" {
  default = {
    name            = "teku-nethermind"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "ams3"
  }
}

variable "teku_ethereumjs" {
  default = {
    name            = "teku-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_erigon" {
  default = {
    name            = "teku-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "tor1"
  }
}

variable "teku_reth" {
  default = {
    name            = "teku-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "syd1"
  }
}

variable "grandine_geth" {
  default = {
    name            = "grandine-geth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "fra1"
  }
}

variable "grandine_besu" {
  default = {
    name            = "grandine-besu"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "syd1"
  }
}

variable "grandine_nethermind" {
  default = {
    name            = "grandine-nethermind"
    count           = 50
    validator_start = 0
    validator_end   = 5000
  }
}

variable "grandine_ethereumjs" {
  default = {
    name            = "grandine-ethereumjs"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_erigon" {
  default = {
    name            = "grandine-erigon"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "fra1"
  }
}

variable "grandine_reth" {
  default = {
    name            = "grandine-reth"
    count           = 0
    validator_start = 0
    validator_end   = 0
    region          = "lon1"
  }
}
