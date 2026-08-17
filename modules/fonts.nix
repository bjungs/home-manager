{ pkgs, ... }:
{
  home.packages = with pkgs; [
    corefonts # some ms fonts
    vista-fonts # some ms fonts
  ];

  fonts.fontconfig.enable = true;
}
