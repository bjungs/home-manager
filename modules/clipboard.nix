{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      wl-clipboard
    ];

    shellAliases = {
      cbc = "wl-copy";
      cbp = "wl-paste";
    };
  };
}
