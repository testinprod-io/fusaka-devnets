package main

import (
    "fmt"
    "io/ioutil"
    "os"

    "github.com/libp2p/go-libp2p/core/crypto"
    "github.com/libp2p/go-libp2p/core/peer"
)

// Use the following command to derive the peer ID from the Node.
// curl -s localhost:5052/eth/v1/node/identity | jq -r .data.peer_id
// Then, compare it with the peer ID computed with replaced key in protobuf format below.
func main() {
    if len(os.Args) != 2 {
        fmt.Println("Usage: derive_peerid <keyfile>")
        os.Exit(1)
    }

    data, err := ioutil.ReadFile(os.Args[1])
    if err != nil {
        panic(err)
    }

    // Try the standard protobuf format
    priv, err := crypto.UnmarshalPrivateKey(data)
    if err != nil {
        // Fallback to raw secp256k1 key format
        priv, err = crypto.UnmarshalSecp256k1PrivateKey(data)
        if err != nil {
            fmt.Println("Error: could not parse private key:", err)
            os.Exit(1)
        }
    }

    pid, err := peer.IDFromPrivateKey(priv)
    if err != nil {
        panic(err)
    }
    fmt.Println(pid.String())
}