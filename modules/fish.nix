{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      starship init fish | source
      direnv hook fish | source
    '';

    functions.fish_user_key_bindings = ''
      # Shift+Home/End -> stop at punctuation
      bind \e\[1\;5F forward-word
      bind \e\[1\;5H backward-word

      # Ctrl+Right/Left -> jump the whole arg
      bind \e\[1\;5C forward-bigword
      bind \e\[1\;5D backward-bigword
    '';
  };
}
