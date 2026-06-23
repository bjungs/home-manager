{ config, pkgs, ... }:

{
	programs.git = {
		enable = true;

		settings = {
      user = {
        name  = "bjungs";
        email = "nunes.bjc@gmail.com";
      };

      init.defaultBranch = "master";

  		alias = {
  		  	st = "status";
  		  	co = "checkout";
  		  	br = "branch";
  		  	unstage = "reset HEAD --";
  		  	fp = "fetch --prune";
  		};

      push = {
				autoSetupRemote = true;
			};

			pull = {
				rebase = true;
			};

			core = {
				editor = "micro";
				autocrlf = "input";
			};
		};
	};
}
