# Introduction

My custom [home-manager](https://github.com/nix-community/home-manager) (hm) configuration.

# Pre-Requisites

+ [nix](https://github.com/nixos/nix)
  + Home-Manager requires `nix`. Make sure it's installed with following experimental features enabled before proceeding
    + nix-command
    + flakes

# Installation

Once `nix` is installed, run the following command to install home-manager and set up the home environment using this configuration:

```bash
nix run --extra-experimental-features "nix-command flakes" --no-write-lock-file github:nix-community/home-manager -- switch --flake "github:bjungs/home-manager"
```

# System Configuration

Some programs and services configured here do require some extra system-level configuration.

+ Flatpak needs to be installed at system level, even though its applications will be installed at user level
+ kanata udev rules
  + to enable Kanata to capture input devices, we need to allow it to interact with them at system-level
+ non-nixos-gpu-setup
  + some applications require GPU support (e.g. `alacritty`), and thus access to system libraries
