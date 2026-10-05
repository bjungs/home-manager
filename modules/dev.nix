{ pkgs, ... }:
{
  # dev tools
  home.packages = with pkgs; [
    github-cli
    git-credential-manager
    azure-cli
    github-copilot-cli
    lazydocker
  ];
}
