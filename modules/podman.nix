{ pkgs, ... }:
{
  home.packages = with pkgs; [
    podman
    podman-compose
    podman-desktop
  ];

  home.shellAliases = {
    ll = "ls -lAh";
    py = "python";
    hm = "home-manager";
    docker = "podman";
  };
}
