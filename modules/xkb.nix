{
  # custom xkb layout
  xdg.configFile."xkb/symbols/br" = {
    text = ''
      default partial alphanumeric_keys

      xkb_symbols "br-custom" {
          // base layout
          include "br(abnt2)"
          name[Group1]= "Portuguese (Brazil, Custom)";

          // key overrides
          key <AD03> { [ e, E, bar, degree ] };
          key <AD04> { [ r, R, backslash, registered ] };
      };
    '';
  };

  home.keyboard = {
   	layout = "br";
  };
}
