{ config, pkgs, ... }:

{
	imports = [
		./git.nix
		./fish.nix
		./alacritty.nix
	];
}
