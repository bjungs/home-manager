{ pkgs, ... }:
{
  home.sessionVariables = {
    PATH = "$HOME/.cargo/bin:$PATH";
  };

  home.packages = with pkgs; [
    rustup
    gcc
    cargo-binstall
  ];
}
