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
            # NixOS: 让 pip 安装的 PyTorch 等程序能找到 NVIDIA 驱动库
            export LD_LIBRARY_PATH="/run/opengl-driver/lib''${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
            eval "$(direnv hook zsh)"
        '';

    };
}
