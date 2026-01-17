{
  pkgs,
  config,
  lib,
  ...
}:

let
  theme_omz = builtins.fetchurl {
    url = "https://zsh.onlh.de/theme.omp.json";
    sha256 = "1jd355hilldj4ncf0h28n70qwx43zddzn5xdxamc2y6dmlmxh79c";
  };

  cfg = config.lh.system.shell;
in
{
  options.lh.system.shell = {
    enable = lib.mkEnableOption "Enable Zsh as the default shell with Oh My Zsh and enhancements.";
    LHLogo = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Whether to show the LH Logo in the terminal prompt instead of the NixOS logo.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      enableBashCompletion = true;
      shellAliases = {
        # General
        #ll = "eza -la --group-directories-first --icons always";
        #l = "eza -l --icons always";
        #la = "eza -a --icons always";
        #ls = "eza --icons always";
        "cd.." = "cd ..";
      };
      interactiveShellInit = ''
        fastfetch
      '';
      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
          "sudo"
          "docker"
          "docker-compose"
        ];
        #"eza"
      };
      vteIntegration = true;

      promptInit = ''
        eval "$(oh-my-posh init zsh --config "${theme_omz}")"
      '';

    };

    users.defaultUserShell = pkgs.zsh;
    environment.systemPackages = with pkgs; [
      fastfetchMinimal
      oh-my-posh
      eza
      lhShellTools
    ];

    programs.zoxide = {
      enable = true;
      flags = [ "--cmd cd" ];
    };
  };
}
