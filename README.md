# Introduction

Home-Manager (HM) is configured to install binaries and configure some of them through nix.
However, some of these programs have more volatile configurations that are better maintained
outside HM. For this purpose we use [chezmoi](https://www.chezmoi.io/).

## Setting up new environments

We need a script to install a few tools system-wide (flatpak, nix, home-manager, ...) before we can use home-manager.

Below is a list of things that will need to be included in said script before this setup is truly portable:

  + run `non-nixos-gpu-setup` script to support hardware-accelerated programs (e.g. alacritty)
    ```bash
    # the script path will be printed from home-manager output after trying to switch
    sh sudo /nix/store/dm2yff1a9b73zr2wm289yz2cjakparcg-non-nixos-gpu/bin/non-nixos-gpu-setup
    ```
  + install udev stuff for kanata (see https://www.johnling.me/blog/Unix-Keyboards)
