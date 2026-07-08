{ config, pkgs, ... }:

{
  programs.neovim.enable = true;
  programs.neovim.initLua = ''
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.confirm = true
    vim.opt.mouse = "i"
    vim.opt.wrap = false
    vim.g.catppuccin_transparent_background = true
    vim.cmd "colorscheme catppuccin"
  '';
}
