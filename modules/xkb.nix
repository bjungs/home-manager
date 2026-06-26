{
  # configure custom xkb layout
  xdg.configFile."xkb/symbols/br" = {
    text = ''
      default partial alphanumeric_keys

      // We explicitly name our variant 'br-custom' inside the default 'br' file
      xkb_symbols "br-custom" {
          // base layout
          include "br(abnt2)"
          name[Group1]= "Portuguese (Brazil, Custom)";

          // key overrides
          key <AD03> { [ e, E, bar, degree ] };
      };
    '';
  };

  home.keyboard = {
   	layout = "br";
  };
}
