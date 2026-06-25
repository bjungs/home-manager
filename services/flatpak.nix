{ config, pkgs, ... }:
{
  # managed by nix-flatpak
  # service must point to cacerts
  home.packages = [ pkgs.cacert ];
  systemd.user.services.flatpak-managed-install = {
    Service = {
      Environment = [
        "SSL_CERT_FILE=${config.home.homeDirectory}/.nix-profile/etc/ssl/certs/ca-bundle.crt"
        "CURL_CA_BUNDLE=${config.home.homeDirectory}/.nix-profile/etc/ssl/certs/ca-bundle.crt"
      ];
    };
  };

  services.flatpak = {
    enable = true;

    update.onActivation = false;
    update.auto = {
      enable = false;
      onCalendar = "daily";
    };

    packages = [
      "org.mozilla.firefox"
      "com.discordapp.Discord"
    ];
  };
}
