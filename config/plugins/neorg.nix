{
  # files."after/ftplugin/norg.lua" = {
  #   #localOptions.conceallevel = 1;
  #
  #   keymaps = [
  #     {
  #       mode = "n";
  #       key = "<C-g>";
  #       action = ":Neorg toc<CR>";
  #       options.silent = true;
  #     }
  #   ];
  # };

  keymaps = [
    {
      mode = "n";
      key = "<leader>mt";
      action = ":Neorg journal today<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>my";
      action = ":Neorg journal yesterday<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>wh";
      action = ":Neorg workspace home<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>ww";
      action = ":Neorg workspace work<CR>";
      options.silent = true;
    }
  ];

  plugins.neorg = {
    enable = true;

    modules = {
      "core.defaults".__empty = null;

      "core.keybinds".config = {
        default_keybinds = false;
      };

      "core.dirman" = {
        config = {
          workspaces = {
            home = "~/Notes/home";
            work = "~/Notes/work";
          };
          default_workspace = "home";
        };
      };

      "core.concealer".__empty = null;
      "core.completion".config.engine = "nvim-cmp";
      "core.qol.toc".config.close_after_use = true;
    };
  };
}
