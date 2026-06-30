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
        hist = "log --graph --date-order --date=short --pretty=format:'%C(auto)%h%d %C(green)%cd %C(reset)%s %C(bold blue)%cn %C(green)(%cr)'";
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
