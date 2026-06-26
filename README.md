# Introduction

My custom [home-manager](https://github.com/nix-community/home-manager) (hm) configuration.

# Pre-Requisites

+ nix
  + Required by Home-Manager. Make sure it's installed before proceeding
    e.g. `dnf install nix`
  You might also need to enable/start the nix daemon
    ```sh
    # check status
    systemctl status nix-daemon.service

    # restart if necessary
    systemctl restart nix-daemon.service
    ``` 

# Installation

First, install `nix` and start `nix-daemon.service`.

```sh
## on fedora we use the pre-packages veresion to avoid issues with selinux
dnf install nix
sudo systemctl enable --now nix-daemon

## on other distributions we're probably fine with the official installer
# check for most recent script @ https://nixos.org/download/
curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install | sh -s -- --daemon
```

Once `nix` is installed, we can use it to install home-manager directly from github:

```sh
nix run --extra-experimental-features "nix-command flakes" --no-write-lock-file github:nix-community/home-manager -- switch --flake "github:bjungs/home-manager"
```

However, this will **not** work alone. Next, we need to perform some extra configuration steps to make sure the home-manager configuration is fully supported.

## nix gpu support

When running nix on non-nixos environemnts, we need to provide system libraries for gpu-accelerated apps installed through nix to function properly.

Thankfully, the home-manager installation output from the previous cmd already prints out the script we need to run. It should look something like the following:

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

# verify the changes with
# at this point we need to start a new terminal session for it to take place
groups 

# make sure the uinput kernel module is loaded
sudo modprobe uinput

# create udev rule
sudo tee /etc/udev/rules.d/99-input.rules > /dev/null <<EOF
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
EOF

# reload udev rules
sudo udevadm control --reload-rules && sudo udevadm trigger

# finally, rerun home-manager switch to make sure everything is installed correctly
home-manager switch

# rebooting might also be a good idea
sudo reboot now
```
