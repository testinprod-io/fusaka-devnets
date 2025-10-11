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