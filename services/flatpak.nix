{
  # nix-flatpak
  services.flatpak = {
    update.onActivation = false;
    update.auto = {
        enable = false;
        onCalendar = "daily";
      };

    enable = true;
    packages = [
      "org.mozilla.firefox"
      "com.discordapp.Discord"
    ];
  };
}
