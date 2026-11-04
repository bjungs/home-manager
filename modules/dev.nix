{ pkgs, pkgs-stable, ... }:
{
  # dev tools
  home.packages = with pkgs; [
    github-cli
    git-credential-manager
    pkgs-stable.azure-cli
    github-copilot-cli
    lazydocker

    (pkgs.callPackage ./conveyor-cli/default.nix {})

    spacetimedb
    claude-code
  ];
}
