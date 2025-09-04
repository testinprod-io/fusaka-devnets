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

variable "prysm_geth" {
  default = {
    name            = "prysm-geth"
    count           = 2
    validator_start = 0
    validator_end   = 16
  }
}

variable "prysm_nethermind" {
  default = {
    name            = "prysm-nethermind"
    count           = 2
    validator_start = 16
    validator_end   = 32
  }
}

variable "prysm_ethereumjs" {
  default = {
    name            = "prysm-ethereumjs"
    count           = 0
    validator_start = 32
    validator_end   = 32
  }
}

variable "prysm_reth" {
  default = {
    name            = "prysm-reth"
    count           = 2
    validator_start = 32
    validator_end   = 48
  }
}

variable "prysm_besu" {
  default = {
    name            = "prysm-besu"
    count           = 2
    validator_start = 48
    validator_end   = 64
  }
}

variable "prysm_erigon" {
  default = {
    name            = "prysm-erigon"
    count           = 2
    validator_start = 64
    validator_end   = 80
  }
}

variable "prysm_nimbusel" {
  default = {
    name            = "prysm-nimbusel"
    count           = 0
    validator_start = 80
    validator_end   = 80
  }
}

variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 2
    validator_start = 80
    validator_end   = 96
  }
}

variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
    count           = 2
    validator_start = 96
    validator_end   = 112
  }
}

variable "lighthouse_ethereumjs" {
  default = {
    name            = "lighthouse-ethereumjs"
    count           = 0
    validator_start = 112
    validator_end   = 112
  }
}

variable "lighthouse_reth" {
  default = {
    name            = "lighthouse-reth"
    count           = 2
    validator_start = 112
    validator_end   = 128
  }
}

variable "lighthouse_besu" {
  default = {
    name            = "lighthouse-besu"
    count           = 2
    validator_start = 128
    validator_end   = 144
  }
}

variable "lighthouse_erigon" {
  default = {
    name            = "lighthouse-erigon"
    count           = 2
    validator_start = 144
    validator_end   = 160
  }
}

variable "lighthouse_nimbusel" {
  default = {
    name            = "lighthouse-nimbusel"
    count           = 0
    validator_start = 160
    validator_end   = 160
  }
}

variable "teku_geth" {
  default = {
    name            = "teku-geth"
    count           = 2
    validator_start = 160
    validator_end   = 176
  }
}

variable "teku_nethermind" {
  default = {
    name            = "teku-nethermind"
    count           = 2
    validator_start = 176
    validator_end   = 192
  }
}

variable "teku_ethereumjs" {
  default = {
    name            = "teku-ethereumjs"
    count           = 0
    validator_start = 192
    validator_end   = 192
  }
}

variable "teku_reth" {
  default = {
    name            = "teku-reth"
    count           = 2
    validator_start = 192
    validator_end   = 208
  }
}

variable "teku_besu" {
  default = {
    name            = "teku-besu"
    count           = 2
    validator_start = 208
    validator_end   = 224
  }
}

variable "teku_erigon" {
  default = {
    name            = "teku-erigon"
    count           = 2
    validator_start = 224
    validator_end   = 240
  }
}

variable "teku_nimbusel" {
  default = {
    name            = "teku-nimbusel"
    count           = 0
    validator_start = 240
    validator_end   = 240
  }
}

variable "lodestar_geth" {
  default = {
    name            = "lodestar-geth"
    count           = 2
    validator_start = 240
    validator_end   = 256
  }
}

variable "lodestar_nethermind" {
  default = {
    name            = "lodestar-nethermind"
    count           = 2
    validator_start = 256
    validator_end   = 272
  }
}

variable "lodestar_ethereumjs" {
  default = {
    name            = "lodestar-ethereumjs"
    count           = 0
    validator_start = 272
    validator_end   = 272
  }
}

variable "lodestar_reth" {
  default = {
    name            = "lodestar-reth"
    count           = 2
    validator_start = 272
    validator_end   = 288
  }
}

variable "lodestar_besu" {
  default = {
    name            = "lodestar-besu"
    count           = 2
    validator_start = 288
    validator_end   = 304
  }
}

variable "lodestar_erigon" {
  default = {
    name            = "lodestar-erigon"
    count           = 2
    validator_start = 304
    validator_end   = 320
  }
}

variable "lodestar_nimbusel" {
  default = {
    name            = "lodestar-nimbusel"
    count           = 0
    validator_start = 320
    validator_end   = 320
  }
}

variable "nimbus_geth" {
  default = {
    name            = "nimbus-geth"
    count           = 2
    validator_start = 320
    validator_end   = 336
  }
}

variable "nimbus_nethermind" {
  default = {
    name            = "nimbus-nethermind"
    count           = 2
    validator_start = 336
    validator_end   = 352
  }
}

variable "nimbus_ethereumjs" {
  default = {
    name            = "nimbus-ethereumjs"
    count           = 0
    validator_start = 352
    validator_end   = 352
  }
}

variable "nimbus_reth" {
  default = {
    name            = "nimbus-reth"
    count           = 2
    validator_start = 352
    validator_end   = 368
  }
}

variable "nimbus_besu" {
  default = {
    name            = "nimbus-besu"
    count           = 2
    validator_start = 368
    validator_end   = 384
  }
}

variable "nimbus_erigon" {
  default = {
    name            = "nimbus-erigon"
    count           = 2
    validator_start = 384
    validator_end   = 400
  }
}

variable "nimbus_nimbusel" {
  default = {
    name            = "nimbus-nimbusel"
    count           = 0
    validator_start = 400
    validator_end   = 400
  }
}

variable "grandine_geth" {
  default = {
    name            = "grandine-geth"
    count           = 2
    validator_start = 400
    validator_end   = 416
  }
}

variable "grandine_nethermind" {
  default = {
    name            = "grandine-nethermind"
    count           = 2
    validator_start = 416
    validator_end   = 432
  }
}

variable "grandine_ethereumjs" {
  default = {
    name            = "grandine-ethereumjs"
    count           = 0
    validator_start = 432
    validator_end   = 432
  }
}

variable "grandine_reth" {
  default = {
    name            = "grandine-reth"
    count           = 2
    validator_start = 432
    validator_end   = 448
  }
}

variable "grandine_besu" {
  default = {
    name            = "grandine-besu"
    count           = 2
    validator_start = 448
    validator_end   = 464
  }
}

variable "grandine_erigon" {
  default = {
    name            = "grandine-erigon"
    count           = 2
    validator_start = 464
    validator_end   = 480
  }
}

variable "grandine_nimbusel" {
  default = {
    name            = "grandine-nimbusel"
    count           = 0
    validator_start = 480
    validator_end   = 480
  }
}
