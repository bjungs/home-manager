{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      starship init fish | source
      direnv hook fish | source
    '';

    shellAliases = {
      ll = "ls -lAh";
      py = "python";
    };
  };
}
