{ pkgs, ... }:
{
  # dev tools
  home.packages = with pkgs; [
    kubectl
    azure-cli
    github-copilot-cli
    lazydocker
  ];
}
