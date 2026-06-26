{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zed-editor

    # language servers
    nil  # nix
    nixd # nix
  ];
}
