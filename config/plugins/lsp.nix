{
  plugins = {
    lsp = {
      enable = true;
      inlayHints = true;

      keymaps = {
        silent = true;
        diagnostic = {
          # Navigate in diagnostics
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };

        lspBuf = {
          K = "hover";
          gh = "hover";
          gr = "references";
          gd = "definition";
          gi = "implementation";
          gD = "type_definition";
          "<F2>" = "rename";
        };
      };

      servers = {
        clangd.enable = true;
        cmake.enable = true;
        # cssls.enable = true;
        dockerls.enable = true;
        docker_compose_language_service.enable = true;
        # gopls.enable = true;
        # graphql.enable = true;
        html.enable = true;
        jsonls.enable = true;
        ltex.enable = true;
        lua_ls.enable = true;
        metals.enable = true;
        nixd = {
          enable = true;

          settings = {
            nixpkgs = {
              expr = "import <nixpkgs> {}";
            };
            formatting = {
              command = ["nixpkgs-fmt"];
            };
            options = {
              nixos = {
                expr = ''
                  let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).nixosConfigurations; in (builtins.head (builtins.attrValues configs)).options
                '';
              };
              home_manager = {
                expr = ''
                  let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).homeConfigurations; in (builtins.head (builtins.attrValues configs)).options
                '';
              };
              darwin = {
                expr = ''
                  let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).darwinConfigurations; in (builtins.head (builtins.attrValues configs)).options
                '';
              };
            };
          };
        };
        # nushell.enable = true;
        pyright.enable = true;

        # rust-analyzer = {
        #   enable = true;
        #   installCargo = true;
        #   installRustc = true;
        # };
        #
        sqls.enable = true;
        ts_ls.enable = true;
        yamlls.enable = true;
        texlab.enable = true;
      };
    };
  };

  extraConfigLua = ''
    do
    	require("actions-preview").setup({
    		diff = {
    			ignore_whitespace = true,
    		},
    		highlight_command = {
    			require("actions-preview.highlight").diff_highlight()
    		},
    		backend = { "telescope" },
    	})
    end
  '';

  extraConfigLuaPre = ''
    do
      local diagnostic_signs = { Error = "", Warn = "", Hint = "", Info = "" }

      for type, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = true,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })
    end
  '';

  autoCmd = [
    {
      event = [
        "BufRead"
        "BufNewFile"
      ];
      pattern = [
        "*.txt"
        "*.md"
        "*.tex"
        "*.norg"
        "LICENSE"
      ];
      command = "setlocal spell";
    }
  ];
}
