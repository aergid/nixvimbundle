{pkgs, ...}:
{
  imports = [
    ./auto-save.nix
    # ./barbar.nix
    ./auto-session.nix
    ./comment.nix
    ./floaterm.nix
    ./gitsigns.nix
    ./harpoon.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./lualine.nix
    ./markdown-preview.nix
    ./neo-tree.nix
    ./neorg.nix
    ./telescope.nix
    ./treesitter.nix
    ./zen-mode.nix
    ./tmux-navigator.nix
    ./yazi-nvim.nix
    ./nvim-ufo.nix
    ./incline.nix
  ];

  colorscheme = "catppuccin";
  colorschemes = {
    ayu.enable = true;
    kanagawa = {
      enable = true;
      settings = {
        undercurl = true;
        commentStyle.italic = true;
        dimInactive = true;
        terminalColors = true;
        theme = "wave";
      };
    };
    catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        term_colors = true;
        integrations = {
          cmp = true;
          gitsigns = true;
          nvimtree = true;
          treesitter = true;
        };
        dim_inactive = {
          enabled = true;
          percentage = 0.15;
        };

      };
    };
    everforest = {
      enable = true;
      settings = {
        background = "hard";
        enable_italic = 1;
        dim_inactive_windows = 1;
      };
    };
    gruvbox.enable = true;
    nightfox.enable = true;
    onedark.enable = true;
  };

  plugins = {
    vim-bbye = {
      enable = true;
      keymaps.bdelete = "<C-x>";
      keymaps.bwipeout = "<C-d>";
    };
    leap.enable = true;
    # barbecue.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    fugitive.enable = true;
    # mini = {
    #   enable = true;
    #   mockDevIcons = true;
    #   modules.icons = { };
    # };

    vim-surround.enable = true;

    alpha = {
      enable = true;
      # iconsEnabled = true;
      theme = "startify";
    };

    nvim-autopairs.enable = true;

    nvim-colorizer = {
      enable = true;
      userDefaultOptions.names = false;
    };

    oil.enable = true;
  };

  extraPackages = with pkgs; [
    nixfmt-rfc-style
  ];

  extraPlugins =
    # For plugins already packaged as nixpkgs
    with pkgs.vimPlugins; [
      actions-preview-nvim
      nvim-web-devicons
      (pkgs.vimUtils.buildVimPlugin {
        name = "highlight-undo";
        src = pkgs.fetchFromGitHub {
          owner = "tzachar";
          repo = "highlight-undo.nvim";
          rev = "c87a6ec";
          sha256 = "sha256-zNzVmt4WJcspuloePhc6HbDvNA7B92NscE+fEYvCumc=";
        };
      })
    ];

  extraConfigLua = ''
    require('highlight-undo').setup({})
  '';
}
