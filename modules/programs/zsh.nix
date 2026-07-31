{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        ohMyZsh = {
            enable = true;
            plugins = [
                "git"
                "z"
            ];
        theme = "bira";
        };
        interactiveShellInit = ''
            # Source home-manager session variables (e.g. sessionPath additions).
            if [ -f /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh ]; then
              . /etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh
            fi
            eval "$(direnv hook zsh)"
        '';

    };
}