{ config, pkgs, ... }:

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
          { key = "PageUp";   action = "ScrollLineUp";   }
          { key = "PageDown"; action = "ScrollLineDown"; }
          { key = "b"; mods = "Control"; action = "Open"; }
        ];
      };
		};
	};
}
