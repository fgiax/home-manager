{ config, pkgs, ... }:

{
  home.username = "nix";
  home.homeDirectory = "/home/nix";

  home.stateVersion = "26.05";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    cowsay
    alejandra
    grc

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "hello-me" ''
      user="${config.home.username}"
      user="''${user^}"
      ${pkgs.cowsay}/bin/cowsay "Hello, $user!"
    '')
  ];

  home.extraOutputsToInstall = [
    "doc"
    "info"
    "devdoc"
  ];

  home.file = {
    # ".config/nvim".source = ./dotfiles/nvim;
  };

  home.sessionVariables = {
    GREETING = "Home Manager is Ok!";
    EDITOR = "nvim";
    MANPAGER = "nvim +Man!";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # --[ Fzf ]--
  programs.fzf.enable = true;

  # --[ Git, gh ]--
  programs.git.enable = true;
  programs.gh.enable = true;

  # --[ W3m ]--
  programs.w3m = {
    enable = true;
    homePage = "https://duckduckgo.com";
  };

  # --[ Fish ]--
  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
    set -g fish_greeting
  '';
  programs.fish.shellAliases = { vim = "nvim"; vi = "nvim"; v = "nvim ."; };
  programs.fish.plugins = [ { name = "grc"; src = pkgs.fishPlugins.grc.src; } ];
  programs.starship.enable = true;

  # --[ Tmux ]--
  programs.tmux.enable = true;
  programs.tmux.shell = "${pkgs.fish}/bin/fish";
  programs.tmux.baseIndex = 1;
  programs.tmux.historyLimit = 10000;
  programs.tmux.mouse = false;
  programs.tmux.aggressiveResize = false;
  programs.tmux.focusEvents = true;
  programs.tmux.newSession = false;
  programs.tmux.extraConfig = ''
    set -g status-bg black
    set -g status-fg gray
    set -g status-right "%a %d-%b"
    set -ag terminal-overrides ",screen-256color:RGB"
    set -ag terminal-overrides ",tmux-256color:RGB"
    set -ag terminal-overrides ",xterm-256color:RGB"
  '';

  # --[ Ranger ]--
  programs.ranger.enable = true;
  programs.ranger.settings = {
    column_ratios = "1";
    confirm_on_delete = "never";
    scroll_offset = 8;
    unicode_ellipsis = true;
    show_hidden = true;
    draw_borders = "both";
  };
}
