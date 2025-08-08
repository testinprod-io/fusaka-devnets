variable "prysm_geth" {
  default = {
    name            = "prysm-geth"
    count           = 168
    validator_start = 1832
    validator_end   = 3176
  }
}

variable "lighthouse_geth" {
  default = {
    name            = "lighthouse-geth"
    count           = 229
    validator_start = 0
    validator_end   = 1832
  }
}
