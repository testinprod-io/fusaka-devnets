From <https://github.com/ethpandaops/template-devnets>

## Useful References
- ethpandaops ansible collection: https://github.com/ethpandaops/ansible-collection-general
- Ethereum kurtosis setup: https://github.com/ethpandaops/ethereum-package/
- devnet templates: https://github.com/ethpandaops/template-devnets

## Pyenv
```bash
python3 -m venv devnet
source devnet/bin/activate
pip install -r requirements.txt
```

## Install dependencies
```bash
./setup.sh
```

You may have to install the following if you don't have one
```bash
# Install ansible
brew install ansible

# Install asdf
brew install coreutils curl git
brew install asdf

# Install terraform
asdf plugin add terraform
asdf install terraform latest
asdf global terraform latest
```

## Terraform
Need the following access to these components:
- S3(any provider) for terraform backend
- Cloudflare access for DNS
- digitalocean / hetzner access key & ssh key
```bash
terraform init

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""

terraform plan
terraform apply
```

This will:
- create the servers on digitalocean/hetzner per EL/CL combination. 
- create `ansible/inventories/devnet-7/inventory.ini` inventory file

## Sops
Install Sops and create keys with GPG

Open `.sops.yaml` in project root, and modify the pgp key like: 
```
creation_rules:
  - pgp: >-
      ABDCE15BD6212E579B3813B78DC0A30AA95F49A1
```

Create a separate `secrets.yaml` file like: 
```yaml
secret_prometheus_remote_write:
    endpoint:
	username:
	password: 
secret_loki:
	endpoint: 
	username: 
	password: 
cl_bootnode_privkey: 
secret_zerossl:
	ACME_EAB_KID: 
	ACME_EAB_HMAC_KEY: 
secret_nginx_shared_basic_auth:
	name: 
	password:
secret_genesis_mnemonic: 
tx_fuzz_blobs_privkey:
tx_fuzz_txs_privkey:
```

Then, encrypt it to the ansible yaml by:
```bash
sops encrypt secrets.yaml --output ansible/inventories/devnet-7/group_vars/all/all.sops.yaml
```
This will encrypt the elements in the yaml file and put it as the ansible yaml file. Each element in the yaml file will be decrypted and used as variables using the configured PGP key. 

## ZeroSSL
Configure ZeroSSL to be used for nginx proxy. 
- Create `EAB Credentials for ACME Clients`: [ref](https://rohinpandey.medium.com/zerossl-an-alternative-acme-for-cert-manager-31bb4e7a1ae2)
- Add the secret to the secrets.yaml like:
```
secret_zerossl:
    ACME_EAB_KID: ""
    ACME_EAB_HMAC_KEY: ""
```

## Ansible
```bash
./install_dependencies.sh
ansible-playbook -i inventories/devnet-7/inventory.ini playbook.yaml
```
Running ansible requires all variables in the playbook files to be present. Some of them are defined implicitly in all.sops.yaml, so they must be prepared beforehand. 

Also, make sure you have `docker` running.

Running the above will:
- Create a new default user account: `devops`
	- Fetch the ssh public keys from github accounts / configured ssh keys, and set it as the ssh key for each server
	- You can ssh into each server like `ssh devops@IP` if you have the github ssh configured on your machine
- Create genesis files / configuration / etc needed for each server
- Go through the [playbook](https://github.com/ethpandaops/template-devnets/blob/master/ansible/playbook.yaml) to download and configure the server

Artifacts include: 
- Validator keys created under `ansible/inventories/devnet-7/files`
- Temporary directory under `ansible/inventories/tmp/devnet-7`
- Result network config under `network-configs/devnet-7`

If something isn't working, ssh into the machine and view the docker container logs

### Hetzner
When setting up with Hetzner, the created machines have names like `-arm`


# Spin up a new devnet

## Copy Terraform & Ansible definitions
First, start by copy-pasting the existing terraform and ansible definitions for the new devnet. This is easier than manually setting up the configurations from scratch. 
- `terraform/pectra-devnet-ssl-1`
- `ansible/inventories/pectra-devnet-ssl-1`

## Update Terraform definition
Go to `terraform/new-devnet-1/digitalocean.tf` and update the following items if you're setting up for a whole new project:

> If you plan to use hetzner, modify the corresponding variables in `hetzner/`

```diff
variable "digitalocean_project_name" {
  type    = string
- default = "ethereum-devnets"
+ default = "new-devnets"
}
```

```diff
variable "digitalocean_ssh_key_name" {
  type    = string
- default = "sunnyside-shared"
+ default = "new-key"
}
```

```diff
data "cloudflare_zone" "default" {
- name = "yolkie.xyz"
+ name = "newdomain.com
}
```

```diff
resource "local_file" "ansible_inventory" {
  content = templatefile("ansible_inventory.tmpl",
    {
      ethereum_network_name = "${var.ethereum_network}"
      groups = merge(
        { for group in local.digitalocean_vm_groups : "${group.group_name}" => true... },
      )
      hosts = merge(
        {
          for key, server in digitalocean_droplet.main : "do.${key}" => {
            ip              = "${server.ipv4_address}"
            ipv6            = try(server.ipv6_address, "none")
            group           = try(split(":", tolist(server.tags)[3])[1], "unknown")
            validator_start = try(split(":", tolist(server.tags)[5])[1], 0)
            validator_end   = try(split(":", tolist(server.tags)[4])[1], 0) # if the tag is not a number it will be 0 - e.g no validator keys
            bandwidth       = try(split(":", tolist(server.tags)[2])[1], 0)
            tags            = "${server.tags}"
            hostname        = "${split(".", key)[0]}"
            cloud           = "digitalocean"
            region          = "${server.region}"
          }
        }
      )
    }
  )
-  filename = "../../ansible/inventories/pectra-devnet-ssl-1/inventory.ini"
+  filename = "../../ansible/inventories/new-devnet-1/inventory.ini"
}
```

In `main.tf`, update the following: 

```diff
terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoints                   = { s3 = "https://nyc3.digitaloceanspaces.com" }
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    region                      = "us-east-1"
-    bucket                      = "ethereum-devnets"
-    key                         = "infrastructure/pectra-devnet-ssl-1/terraform.tfstate"
+    bucket                      = "new-bucket"
+    key                         = "infrastructure/new-devnet-1/terraform.tfstate"
  }
}
```

```diff
variable "ethereum_network" {
  type    = string
-  default = "pectra-devnet-ssl-1"
+  default = "new-devnet-1"
}
```

Now, we have to modify the number of nodes and the validator ranges for each node at `node.tf`. In `node.tf`, assess each variable and adjust the count and validator ranges to your configuration. You can also use the `scripts/split-calculator.py` to quickly generate the validator ranges for large number of clients. 

```diff
# i.e
variable "lighthouse_nethermind" {
  default = {
    name            = "lighthouse-nethermind"
-    count           = 3
+    count 			 = 4
    validator_start = 10500
    validator_end   = 13125
  }
}
```


After adjusting the variables, make sure that they are included in the `vm_groups` of `main.tf`: 
```diff
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
+   var.prysm_nethermind,
...
```

## Apply Terraform definitionn
Apply the terraform definition by running the following in `terraform/new-devnet-1`:
```bash
terraform apply -var-file=../local.tfvars
```

the `local.tfvars` contains secrets like api tokens. 

After running terraform apply, a new `ansible/new-devnet-1/inventory.ini` file will have been created. This contains definitions for each host nodes for ansible.

## Update Ansible definition
The full ansible definition is spread throughout `ansible/inventories/group_vars`. 

Update the following at `all/all.yaml`: 
- `domain`: Cloudflare DNS update in terraform.
- `ethereum_genesis_timestamp`: Time to start genesis at. Run `date +%s` to get the current timestamp on Unix
- `ethereum_genesis_generator_config_files.values.env.NUMBER_OF_VALIDATORS`: Number of validators created and assigned to the nodes.
- `bootstrap_default_user_authorized_keys`: ssh keys bootstraped to each nodes. 

Other ethereum-related configurations under `ethereum_genesis_generator_config_files` to modify the behavior of the devnet. 

Then, update the docker images at `images.yaml`.

Next, create the ansible configuration file by copy-pasting from `ansible/pectra-ansible.cfg`. 
- Modify the `inventory`, `fast_caching_connection` variable in the config. 

## Update secrets
Ansible use sops-encoded secrets, which are located in `ansible/inventories/pectra-devnet-ssl-1/group_vars/all/all.sops.yaml`.

You need a separate `secrets.yaml` file containing the actual secrets data. Then, use sops to encode the secrets into this file: 
1. Create and add your GPG public key to `.sops`
2. Encode the secret.
```bash
sops encrypt secrets.yaml --output ansible/inventories/new-devnet-1/group_vars/all/all.sops.yaml
```

## Run Ansible

Now, run the following command in `ansible`:
```bash
ANSIBLE_CONFIG=~/ethereum-devnets/ansible/pectra-ansible.cfg ansible-playbook -i inventories/new-devnet-1/inventory.ini playbook.yaml
```

This will run the contents of `playbook.yaml` for all host targets defined in `inventory.ini`. 

### Useful tips 

- Run ansible for specific host: 
```bash
ANSIBLE_CONFIG=~/ethereum-devnets/ansible/pectra-ansible.cfg ansible-playbook -i inventories/new-devnet-1/inventory.ini playbook.yaml --limit lighthouse-geth-1
```

- Run ansible from specific task: 
```bash
ANSIBLE_CONFIG=~/ethereum-devnets/ansible/pectra-ansible.cfg ansible-playbook -i inventories/new-devnet-1/inventory.ini playbook.yaml --start-at-task "ethpandaops.general.grandine : Create data dir"
```

- Run ansible for specific tag: 
```bash
ANSIBLE_CONFIG=~/ethereum-devnets/ansible/pectra-ansible.cfg ansible-playbook -i inventories/new-devnet-1/inventory.ini playbook.yaml --tags "ethereum_node"
```

### Attaching to nodes

First, locate the node address at `inventory.ini`. 
Then, ssh into the nodes:
```bash
ssh devops@x.x.x.x
```

### Ansible artifacts

After running `ansible-playbook`, there will be following artifacts:

- `ansible/inventories/new-devnet-1/files`: Files like validator keys for each node
- `ansible/tmp/new-devnet-1`: Cache used during ansible run.
- `network-configs/new-devnet-1`: Network configurations like genesis files.
- `kubernetes/new-devnet-1`: Auto-generated k8s files which can used to host other devnet-related toolings to a k8s cluster.

### Common errors
ERROR! [Errno 24] Too many open files
Unable to remove temporary file [Errno 24] Too many open files: '[some_address]/.ansible/tmp/ansible-local-21830_1ye4bca/ansiballz_cache'
-> Run the following to increase the max number of files to be opened.
```bash
ulimit -n 4096
```
