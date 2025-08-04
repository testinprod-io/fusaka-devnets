package main

import (
    "encoding/hex"
    "fmt"
    "io/ioutil"
    "os"

    "github.com/libp2p/go-libp2p/core/crypto"
    "github.com/libp2p/go-libp2p/core/peer"
)

// Use the following command to derive the peer ID from the Node.
// curl -s localhost:5052/eth/v1/node/identity | jq -r .data.peer_id
// Then, compare it with the peer ID computed with replaced key in hex format below.
func main() {
    if len(os.Args) != 2 {
        fmt.Println("Usage: derive_prysm_peerid <hex-key-file>")
        os.Exit(1)
    }

    hexData, err := ioutil.ReadFile(os.Args[1])
    if err != nil {
        panic(err)
    }

    raw, err := hex.DecodeString(string(hexData))
    if err != nil {
        panic("invalid hex: " + err.Error())
    }

    priv, err := crypto.UnmarshalSecp256k1PrivateKey(raw)
    if err != nil {
        panic("failed to parse secp256k1 key: " + err.Error())
    }

    pid, err := peer.IDFromPrivateKey(priv)
    if err != nil {
        panic(err)
    }
    fmt.Println(pid.String())
}