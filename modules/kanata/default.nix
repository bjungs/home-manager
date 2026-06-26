{ pkgs, config, ...}:

{
  home.packages = [ pkgs.kanata ];

  systemd.user.services.kanata = {
    Unit = {
      Description = "Kanata Service";
    };

    Install = {
      # The earliest target available to the user systemd instance
      WantedBy = [ "default.target" ];
    };

    Service = {
      Type = "simple";
      Restart = "always";
      RestartSec = "2s";
      ExecStart = "${pkgs.kanata}/bin/kanata -c ${config.xdg.configHome}/home-manager/modules/kanata/cfg.kbd";
    };
  };
}
