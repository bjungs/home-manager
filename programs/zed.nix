{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zed-editor

    # language server for Nix
    nil
    nixd
  ];
}
