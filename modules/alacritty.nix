{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      terminal = {
        shell = {
          program = "${pkgs.fish}/bin/fish";
        };
      };

      keyboard = {
        bindings = [
          { key = "Up"; mods = "Control"; action = "ScrollLineUp";   }
          { key = "Down"; mods = "Control"; action = "ScrollLineDown"; }
          { key = "b"; mods = "Control"; action = "Open"; }
          # shift+enter: newline below cursor
          { key = "Return"; mods = "Shift"; chars = builtins.fromJSON ''"\u001b\r"''; }
          # ctrl+rnter: newline above cursor
          { key = "Return"; mods = "Control"; chars = builtins.fromJSON ''"\u0001\u001b\r"''; }
        ];
      };
    };
  };
}
