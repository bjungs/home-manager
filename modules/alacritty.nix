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
        ];
      };
		};
	};
}
