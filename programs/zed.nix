{ pkgs, ... }:
{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zed-editor
    nil # language server for Nix
    nixd # nix language server as well
  ];
}
