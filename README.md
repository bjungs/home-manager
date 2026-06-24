# Introduction

Home-Manager (HM) is configured to install binaries and configure some of them through nix.
However, some of these programs have more volatile configurations that are better maintained
outside HM. For this purpose we use [chezmoi](https://www.chezmoi.io/).

## Setting up new environments

`chezmoi`can run custom scripts when setting up a new environment.

Below is a list of things that will need to be included in said script before this setup is truly portable:

  + shell configuration
    + set user shell (via `chsh`)
    + home-manager cannot control system-level configuration
  + run `non-nixos-gpu-setup` script to support hardware-accelerated programs (e.g. alacritty)
    ```
    sh sudo /nix/store/dm2yff1a9b73zr2wm289yz2cjakparcg-non-nixos-gpu/bin/non-nixos-gpu-setup
    ```
