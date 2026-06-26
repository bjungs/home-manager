{ pkgs, ... }:
{
  targets.genericLinux.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home = {
    username = "bjungs";
    homeDirectory = "/home/bjungs";

    # These will be explicitly sourced when using a
    # shell provided by Home Manager.
    # If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/bjungs/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      EDITOR = "zeditor";
      TERMINAL = "alacritty";
    };

    packages = with pkgs; [
      # adds an executable to PATH to open home-manager repo in $EDITOR
      (writeShellScriptBin "hmedit" ''
        exec $EDITOR "$HOME/.config/home-manager"
      '')
    ];

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "26.05"; # Please read the comment before changing.
  };

  imports = [
   	./modules
  ];
}
