{ pkgs, pkgs-unstable, ... }:
{
  # dev tools
  home.packages = with pkgs; [
    github-cli
    git-credential-manager
    azure-cli
    github-copilot-cli
    lazydocker

    (pkgs.callPackage ./conveyor-cli/default.nix {})

    spacetimedb
    pkgs-unstable.claude-code
  ];
}
