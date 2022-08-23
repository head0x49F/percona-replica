# percona-replica



## Prerequisites

- Ansible
- Terraform


First, run:
```bash
gcloud auth application-default login
```
so you don’t need set up GCP access manually.

## Generate SSH Key Pair

- Run the following command to generate elliptic curve ssh key pair

```bash
ssh-keygen -t ed25519 -f ~/.ssh/ansbile_ed25519 -C ansible
```

- **Optionally**, you can generate RSA key pair

```bash
ssh-keygen -t rsa -f ~/.ssh/ansbile -C ansible -b 2048
```

## Add SSH Key to GCP Project

- Go to compute engine section
- Click Metadata
- Select `SSH KEYS` tab and click `ADD SSH KEY`
- Upload public `ansbile_ed25519.pub` key
  - `cat ~/.ssh/ansbile_ed25519.pub`


## Add SSH Key to /ansible/ansible.cfg

```bash
private_key_file = <path_to_your_private_key>


And don't forget about project_id in main.tf and IP adresses in /ansible/invenory.
