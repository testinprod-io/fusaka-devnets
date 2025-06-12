# Bootnode
variable "bootnode" {
  default = {
    name            = "bootnode"
    count           = 1
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_geth" {
  default = {
    name            = "prysm-geth"
    count           = 4
    validator_start = 0
    validator_end   = 400
  }
}

variable "prysm_nethermind" {
  default = {
    name            = "prysm-nethermind"
    count           = 4
    validator_start = 400
    validator_end   = 800
  }
}

variable "prysm_ethereumjs" {
  default = {
    name            = "prysm-ethereumjs"
    count           = 0
    validator_start = 800
    validator_end   = 800
  }
}

variable "prysm_reth" {
  default = {
    name            = "prysm-reth"
    count           = 4
    validator_start = 800
    validator_end   = 1200
  }
}

variable "prysm_besu" {
  default = {
    name            = "prysm-besu"
    count           = 4
    validator_start = 1200
    validator_end   = 1600
  }
}

variable "prysm_erigon" {
  default = {
    name            = "prysm-erigon"
    count           = 0
    validator_start = 1600
    validator_end   = 1600
  }
}

variable "prysm_erigonTwo" {
  default = {
    name            = "prysm-erigonTwo"
    count           = 0
    validator_start = 1600
    validator_end   = 1600
  }
}

variable "prysm_nimbusel" {
  default = {
    name            = "prysm-nimbusel"
    count           = 0
    validator_start = 1600
    validator_end   = 1600
  }
}

variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 4
    validator_start = 1600
    validator_end   = 2000
  }
}

variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
    count           = 4
    validator_start = 2000
    validator_end   = 2400
  }
}

variable "lighthouse_ethereumjs" {
  default = {
    name            = "lighthouse-ethereumjs"
    count           = 0
    validator_start = 2400
    validator_end   = 2400
  }
}

variable "lighthouse_reth" {
  default = {
    name            = "lighthouse-reth"
    count           = 4
    validator_start = 2400
    validator_end   = 2800
  }
}

variable "lighthouse_besu" {
  default = {
    name            = "lighthouse-besu"
    count           = 4
    validator_start = 2800
    validator_end   = 3200
  }
}

variable "lighthouse_erigon" {
  default = {
    name            = "lighthouse-erigon"
    count           = 0
    validator_start = 3200
    validator_end   = 3200
  }
}

variable "lighthouse_erigonTwo" {
  default = {
    name            = "lighthouse-erigonTwo"
    count           = 0
    validator_start = 3200
    validator_end   = 3200
  }
}

variable "lighthouse_nimbusel" {
  default = {
    name            = "lighthouse-nimbusel"
    count           = 0
    validator_start = 3200
    validator_end   = 3200
  }
}

variable "teku_geth" {
  default = {
    name            = "teku-geth"
    count           = 4
    validator_start = 3200
    validator_end   = 3600
  }
}

variable "teku_nethermind" {
  default = {
    name            = "teku-nethermind"
    count           = 4
    validator_start = 3600
    validator_end   = 4000
  }
}

variable "teku_ethereumjs" {
  default = {
    name            = "teku-ethereumjs"
    count           = 0
    validator_start = 4000
    validator_end   = 4000
  }
}

variable "teku_reth" {
  default = {
    name            = "teku-reth"
    count           = 4
    validator_start = 4000
    validator_end   = 4400
  }
}

variable "teku_besu" {
  default = {
    name            = "teku-besu"
    count           = 4
    validator_start = 4400
    validator_end   = 4800
  }
}

variable "teku_erigon" {
  default = {
    name            = "teku-erigon"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "teku_erigonTwo" {
  default = {
    name            = "teku-erigonTwo"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "teku_nimbusel" {
  default = {
    name            = "teku-nimbusel"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "lodestar_geth" {
  default = {
    name            = "lodestar-geth"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "lodestar_nethermind" {
  default = {
    name            = "lodestar-nethermind"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "lodestar_ethereumjs" {
  default = {
    name            = "lodestar-ethereumjs"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "lodestar_reth" {
  default = {
    name            = "lodestar-reth"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "lodestar_besu" {
  default = {
    name            = "lodestar-besu"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "lodestar_erigon" {
  default = {
    name            = "lodestar-erigon"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "lodestar_erigonTwo" {
  default = {
    name            = "lodestar-erigonTwo"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "lodestar_nimbusel" {
  default = {
    name            = "lodestar-nimbusel"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "nimbus_geth" {
  default = {
    name            = "nimbus-geth"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "nimbus_nethermind" {
  default = {
    name            = "nimbus-nethermind"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "nimbus_ethereumjs" {
  default = {
    name            = "nimbus-ethereumjs"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "nimbus_reth" {
  default = {
    name            = "nimbus-reth"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "nimbus_besu" {
  default = {
    name            = "nimbus-besu"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "nimbus_erigon" {
  default = {
    name            = "nimbus-erigon"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "nimbus_erigonTwo" {
  default = {
    name            = "nimbus-erigonTwo"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "nimbus_nimbusel" {
  default = {
    name            = "nimbus-nimbusel"
    count           = 0
    validator_start = 4800
    validator_end   = 4800
  }
}

variable "grandine_geth" {
  default = {
    name            = "grandine-geth"
    count           = 4
    validator_start = 4800
    validator_end   = 5200
  }
}

variable "grandine_nethermind" {
  default = {
    name            = "grandine-nethermind"
    count           = 4
    validator_start = 5200
    validator_end   = 5600
  }
}

variable "grandine_ethereumjs" {
  default = {
    name            = "grandine-ethereumjs"
    count           = 0
    validator_start = 5600
    validator_end   = 5600
  }
}

variable "grandine_reth" {
  default = {
    name            = "grandine-reth"
    count           = 4
    validator_start = 5600
    validator_end   = 6000
  }
}

variable "grandine_besu" {
  default = {
    name            = "grandine-besu"
    count           = 4
    validator_start = 6000
    validator_end   = 6400
  }
}

variable "grandine_erigon" {
  default = {
    name            = "grandine-erigon"
    count           = 0
    validator_start = 6400
    validator_end   = 6400
  }
}

variable "grandine_erigonTwo" {
  default = {
    name            = "grandine-erigonTwo"
    count           = 0
    validator_start = 6400
    validator_end   = 6400
  }
}

variable "grandine_nimbusel" {
  default = {
    name            = "grandine-nimbusel"
    count           = 0
    validator_start = 6400
    validator_end   = 6400
  }
}