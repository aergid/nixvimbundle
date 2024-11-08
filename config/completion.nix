{ opts.completeopt = ["menu" "menuone" "noselect"];

  plugins = {
    luasnip.enable = true;

    lspkind = {
      enable = true;
      # lspkind integration with cmp
      cmp = {
        enable = true;
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
          neorg = "[neorg]";
        };
      };
    };

    cmp = {
      enable = true;

      cmdline =
        let
          search = {
            mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
            sources = [{ name = "buffer"; }];
          };
        in
        {
          "/" = search;
          "?" = search;
          ":" = {
            mapping = { __raw = "cmp.mapping.preset.cmdline()"; };
            sources = [{ name = "cmdline"; }];
          };
        };

      settings = {
        autoEnableSources = true;
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

# https://docs.astronvim.com/recipes/cmp/
/*
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
*/
        sources = [
          { name = "path"; }
          { name = "luasnip"; }
          { name = "dictionary"; }
          { name = "nvim_lsp"; }
          { name = "neorg"; }
          {
            name = "buffer";
            # Words from other open buffers can also be suggested.
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
        ];

        window = {
            completion.__raw = "cmp.config.window.bordered()";
            documentation.__raw = "cmp.config.window.bordered()";
        };

        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}), -- 'c' for Cycle?
              ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
              ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
              ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
              ['<C-u>'] = cmp.mapping.scroll_docs(-4),
              ['<C-d>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- change to Insert if don't like
            })
          '';
        };
      };
    };

  };

}
