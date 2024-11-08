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
      key = "<leader>m";
      action = ":Neorg journal"; # No <CR> for interactive select
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>w";
      action = ":Neorg workspace"; # No <CR> for interactive select
      options.silent = true;
    }
  ];

  plugins.neorg = {
    enable = true;

    modules = {
      "core.defaults".__empty = null;

      "core.keybinds".config.hook.__raw = ''
        function(keybinds)
          keybinds.unmap('norg', 'n', '<C-s>')
        end
      '';

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
