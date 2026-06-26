{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    initExtra = ''
      # Transition to fish if:
      # 1. The shell is interactive ($- contains 'i')
      # 2. It is NOT a login shell (! shopt -q login_shell)
      # 3. The parent process is not already fish (prevents infinite recursion)
      # 4. We are at a standard shallow shell nesting level (1 or 2)
      if [[ $- == *i* ]] && ! shopt -q login_shell && grep -qv fish /proc/$PPID/comm && [[ $SHLVL == [12] ]]; then
          # Set $SHELL environment variable so tmux and nix-shell integrate nicely
          export SHELL=${pkgs.fish}/bin/fish
          exec ${pkgs.fish}/bin/fish
      fi

      eval "$(starship init bash)"
      eval "$(direnv hook bash)"
    '';
  };
}
