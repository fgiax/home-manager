{ config, pkgs, ... }:

{
  programs.neovim.enable = true;
  programs.neovim.extraLuaConfig = ''
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.confirm = true
    vim.opt.mouse = "i"
    vim.opt.wrap = false
  '';
}
