{ pkgs, ... }:
{
  home.packages = with pkgs; [
    podman
    podman-compose
    podman-desktop

    # creates an executable named 'docker' that calls podman instead
    (writeShellScriptBin "docker" ''
      exec ${podman}/bin/podman "$@"
    '')
  ];

  home.shellAliases = {
    ll = "ls -lAh";
    py = "python";
    hm = "home-manager";
  };
}
