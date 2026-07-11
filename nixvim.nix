{ config, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    opts = {
      number = true;
      mouse = "i";
      wrap = false;
      confirm = true;
      termguicolors = true;
    };

    colorschemes.rose-pine = {
      enable = true;

      settings = {
        disable_background = true;
        disable_float_background = true;
      };
    };
  };
}
