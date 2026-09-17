{ pkgs, ... }:
{
  # required dependencies for the Tibia client
  home.packages = with pkgs; [
    corefonts
    vista-fonts
  ];
}
