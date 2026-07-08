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

          // live chars by default, dead keys on AltGr (Level3/4)
          key <AD11> {
              type[Group1] = "FOUR_LEVEL",
              [ acute, grave, dead_acute, dead_grave ]
          };
          key <AC11> {
              type[Group1] = "FOUR_LEVEL",
              [ asciitilde, asciicircum, dead_tilde, dead_circumflex ]
          };
      };
    '';
  };

  home.keyboard = {
   	layout = "br";
  };
}
