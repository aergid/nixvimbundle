{
  plugins.lualine = {
    enable = true;

    settings.options = {
			theme = "palenight";
			global_status = true;

      component_separators = {
        left = "";
        right = "";
      };
      section_separators = {
        left = "";
        right = "";
      };

			# +-------------------------------------------------+
			# | A | B | C                             X | Y | Z |
			# +-------------------------------------------------+
			sections = {
				lualine_a = ["mode"];
				lualine_b = ["branch"];
				lualine_c = ["filename" "diff" "searchcount"];

				lualine_x = [
					"diagnostics"
					# Show active language server
					{
						name.__raw = ''
							function()
									local msg = ""
									local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
									local clients = vim.lsp.get_active_clients()
									if next(clients) == nil then
											return msg
									end
									for _, client in ipairs(clients) do
											local filetypes = client.config.filetypes
											if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
													return client.name
											end
									end
									return msg
							end
						'';
						icon = "";
						color.fg = "#ffffff";
					}
					"encoding"
					"fileformat"
					"filetype"
				];
			};

      inactive_sections = {
        lualine_a = [];
        lualine_b = [];
        lualine_c = ["filename"];
        lualine_x = ["location"];
        lualine_y = [];
        lualine_z = [];
      };
		};

  };
}
