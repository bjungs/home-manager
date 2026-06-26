# Introduction

My custom [home-manager](https://github.com/nix-community/home-manager) (hm) configuration.

# Installation

First, install `nix` and start the daemon service.

```sh
## on fedora we use the pre-packaged version to avoid issues with selinux
dnf install nix

## on other distributions we're probably fine with the official installer
# check for most recent script @ https://nixos.org/download/
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --daemon

# make sure the daemon is enabled and running
sudo systemctl enable --now nix-daemon
```

Run home-manager directly from github using nix:

```sh
nix run --extra-experimental-features "nix-command flakes" --no-write-lock-file github:nix-community/home-manager -- switch --flake "github:bjungs/home-manager"
```

This will already install all packages and configurations. However, some apps and services need some extra configuration on system-level and home-manager alone cannot do this.

## enable nix gpu support

When running nix on non-nixos environemnts, we need to provide system libraries for gpu-accelerated apps installed through nix to function properly (e.g. `alacritty`).

Thankfully, the home-manager installation output from the previous cmd already provides the script we need to run. It should look something like the following:

```sh
sudo /nix/store/dm2yff1a9b73zr2wm289yz2cjakparcg-non-nixos-gpu/bin/non-nixos-gpu-setup
```

## kanata udev configuration

For the kanata service to work properly, we need to give the user some extra permissions.

Run the commands below to set it up ([source](github.com/jtroo/kanata/blob/main/docs/setup-linux.md)).

```sh
# create `uinput` group if it doesn't exist
sudo groupdel uinput 2>/dev/null
sudo groupadd --system uinput

# add input and uinput groups to current user
sudo usermod -aG input $USER
sudo usermod -aG uinput $USER

# verify the changes
# (at this point we might need to start a new terminal session for it to take place)
groups 

# make sure the uinput kernel module is loaded
sudo modprobe uinput


# create udev rule to make sure the uinput device file has the right permissions
sudo tee /etc/udev/rules.d/99-input.rules > /dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF

# reload udev rules
sudo udevadm control --reload-rules && sudo udevadm trigger

# finally, rerun `home-manager switch` to make sure everything is installed correctly
home-manager switch

# rebooting might also be a good idea
sudo reboot now
```
