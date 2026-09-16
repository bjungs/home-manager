{ pkgs, ... }:
{
  # currently Tibia package is not supported or maintained in nixpkgs, so we need to install its dependencies manually
  home.packages = with pkgs; [
    libjpeg_turbo
    libtiff

    # require ms fonts
    corefonts
    vista-fonts
  ];
}
