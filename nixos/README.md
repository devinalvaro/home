# rome

Wasn't built in a day.

## Setup

Sources:
- [NixOS 20.09 manual](https://nixos.org/manual/nixos/stable/)
- [Nix & NixOS: Installation with encrypted root](https://pablo.tools/posts/computers/nixos-encrypted-install/)

### Creating partitions

``` sh
gdisk /dev/sda
> o
> n # default, default, +500M, ef00
> n # default, default, default, 8e00
> w
```

### Encrypting partitions

``` sh
cryptsetup luksFormat /dev/sda2
cryptsetup luksOpen /dev/sda2 enc-pv
```

### Creating logical volumes

```sh
pvcreate /dev/mapper/enc-pv
vgcreate vg /dev/mapper/enc-pv
lvcreate -L 8G -n swap vg
lvcreate -l '100%FREE' -n root vg
```

### Formatting partitions

``` sh
mkfs.fat -F 32 /dev/sda1
mkfs.ext4 -L root /dev/vg/root
mkswap -L swap /dev/vg/swap
```

### Mounting partitions

``` sh
mount /dev/vg/root /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
swapon /dev/vg/swap
```

### Cloning configurations

```sh
nixos-generate-config --root /mnt
wget https://gitlab.com/devinalvaro/home/-/raw/master/nixos/configuration.nix -O /etc/nixos/configuration.nix
```

### Adding luks-devices.nix

Create `/etc/nixos/luks-devices.nix` containing:

``` nix
{ config, lib, pkgs, ... }:

{
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/fdd9add5-9a0b-4845-9ce9-9fca1c954d75";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
```

where `boot.initrd.luks.devices.root.device`'s value is `/dev/sda2`'s UUID:

``` sh
$ blkid /dev/sda2

/dev/sda2: UUID="fdd9add5-9a0b-4845-9ce9-9fca1c954d75" TYPE="crypto_LUKS" PARTLABEL="Linux LVM" PARTUUID="fd45f14d-9cb5-4978-a620-d45ff4ec669a"
```
