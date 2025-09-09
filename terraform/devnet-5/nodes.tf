# Lighthouse Fullnodes (390 fullnodes)
variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 117
    validator_start = 0
    validator_end   = 936
  }
}

variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
    count           = 117
    validator_start = 936
    validator_end   = 1872
  }
}

variable "lighthouse_besu" {
  default = {
    name            = "lighthouse-besu"
    count           = 78
    validator_start = 1872
    validator_end   = 2496
  }
}

variable "lighthouse_erigon" {
  default = {
    name            = "lighthouse-erigon"
    count           = 39
    validator_start = 2496
    validator_end   = 2808
  }
}

variable "lighthouse_reth" {
  default = {
    name            = "lighthouse-reth"
    count           = 39
    validator_start = 2808
    validator_end   = 3120
  }
}

# Teku Fullnodes (196 fullnodes)
variable "teku_geth" {
  default = {
    name            = "teku-geth"
    count           = 59
    validator_start = 3120
    validator_end   = 3592
  }
}

variable "teku_nethermind" {
  default = {
    name            = "teku-nethermind"
    count           = 59
    validator_start = 3592
    validator_end   = 4064
  }
}

variable "teku_besu" {
  default = {
    name            = "teku-besu"
    count           = 39
    validator_start = 4064
    validator_end   = 4376
  }
}

variable "teku_erigon" {
  default = {
    name            = "teku-erigon"
    count           = 20
    validator_start = 4376
    validator_end   = 4536
  }
}

variable "teku_reth" {
  default = {
    name            = "teku-reth"
    count           = 19
    validator_start = 4536 
    validator_end   = 4688
  }
}

variable "prysm_geth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "prysm-geth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_nethermind_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "prysm-nethermind-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_ethereumjs_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "prysm-ethereumjs-nonval"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_reth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "prysm-reth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_besu_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "prysm-besu-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_erigon_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "prysm-erigon-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "prysm_nimbusel_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "prysm-nimbusel-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_geth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lighthouse-geth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_nethermind_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lighthouse-nethermind-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_ethereumjs_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lighthouse-ethereumjs-nonval"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_reth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lighthouse-reth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_besu_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lighthouse-besu-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_erigon_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lighthouse-erigon-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lighthouse_nimbusel_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lighthouse-nimbusel-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_geth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "teku-geth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_nethermind_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "teku-nethermind-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_ethereumjs_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "teku-ethereumjs-nonval"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_reth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "teku-reth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_besu_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "teku-besu-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_erigon_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "teku-erigon-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "teku_nimbusel_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "teku-nimbusel-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_geth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lodestar-geth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_nethermind_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lodestar-nethermind-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_ethereumjs_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lodestar-ethereumjs-nonval"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_reth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lodestar-reth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_besu_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lodestar-besu-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_erigon_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lodestar-erigon-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "lodestar_nimbusel_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "lodestar-nimbusel-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_geth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "nimbus-geth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_nethermind_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "nimbus-nethermind-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_ethereumjs_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "nimbus-ethereumjs-nonval"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_reth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "nimbus-reth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_besu_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "nimbus-besu-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_erigon_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "nimbus-erigon-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "nimbus_nimbusel_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "nimbus-nimbusel-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_geth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "grandine-geth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_nethermind_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "grandine-nethermind-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_ethereumjs_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "grandine-ethereumjs-nonval"
    count           = 0
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_reth_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "grandine-reth-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_besu_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "grandine-besu-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_erigon_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "grandine-erigon-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}

variable "grandine_nimbusel_nonval" {
  default = {
    size = "s-4vcpu-8gb-amd"
    name            = "grandine-nimbusel-nonval"
    count           = 5
    validator_start = 0
    validator_end   = 0
  }
}