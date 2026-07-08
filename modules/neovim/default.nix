{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (
        plugins: with plugins; [
          nix
          python
        ]
      ))

    ];

    initLua = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.confirm = true
      vim.opt.mouse = "i"
      vim.opt.wrap = false

      vim.cmd "colorscheme catppuccin"
    '';
  };
}
