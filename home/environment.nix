{ config, ... }:
{
  home.sessionVariables = {
    NPM_CONFIG_PREFIX = "${config.home.homeDirectory}/.npm-global";
    ZSH_AUTOSUGGEST_USE_ASYNC = true;
  };

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  # Non-login interactive shells only source .bashrc, so bridge to .profile.
  programs.bash.bashrcExtra = ''
    . "$HOME/.profile"
  '';
}
