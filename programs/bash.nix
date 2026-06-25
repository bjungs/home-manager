{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    initExtra = ''
      eval "$(starship init bash)"
      eval "$(direnv hook bash)"
    '';
  };
}
