{ config, pkgs, ... }:
{
  ## currently does not work because:
  # error: Unable to load summary from remote flathub: While fetching https://dl.flathub.org/repo/summary.idx: [60] SSL peer certificate or SSH remote key was not OK
  # Seems relatred to ssl CA certificates but I could not for the life of me fix it.
  # this *can* work if we call the service manually
  # systemctl --user start

  # nix-flatpak

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
