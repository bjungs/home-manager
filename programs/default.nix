{ config, pkgs, ... }:

{
	imports = [
		./git.nix
		./alacritty.nix
	];
}
