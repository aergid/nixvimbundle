{
  lib,
  ...
}: {
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };

  keymaps = let
    normal =
      lib.mapAttrsToList
      (key: action: {
        mode = "n";
        inherit action key;
      })
      {
        "<leader>-".__raw = ''
          function()
            require("yazi").yazi()
            end
        '';

        # Esc to clear search results
        "<esc>" = ":noh<CR>";

        "<C-q>" = ":tabclose<CR>";

        # fix Y behaviour
        Y = "y$";

        # back and fourth between the two most recent files
        "<C-c>" = ":b#<CR>";

        # Windows
        "<leader>sw" = "<C-w>x";
        "<leader>o" = ":only<CR>";

        # chdir
        "<leader>ld" = ":lcd %:p:h<CR>:pwd<CR>";
        "<leader>lo" = ":lcd -<CR>:pwd<CR>";
        "<leader>cd" = ":cd %:p:h<CR>:pwd<CR>";
        "<leader>co" = ":cd -<CR>:pwd<CR>";

        # navigate to left/right window
        "<A-Left>" = ":wincmd h<CR>";
        "<A-Right>" = ":wincmd l<CR>";
        "<A-Down>" = ":wincmd j<CR>";
        "<A-Up>" = ":wincmd k<CR>";

        #navigate in quickfix list and locallist
        "<leader>qn" = ":cnext<CR>";
        "<leader>qp" = ":cprevious<CR>";
        "<leader>ln" = ":lnext<CR>";
        "<leader>lp" = ":lprevious<CR>";


        #diff handling
        "<leader>gs" = ":tab Git<CR>";
        "<leader>gd" = ":tabedit %<CR>:Gdiff<CR>";
        "gdl" = ":diffget //2<CR>";
        "gdr" = ":diffget //3<CR>";

        #increment/decrement numbers
        "+" = "<c-a>";
        "-" = "<c-x>";

        # Press 'H', 'L' to jump to start/end of a line (first/last character)
        L = "$";
        H = "^";

        # resize with arrows
        "<S-Up>" = ":resize -2<CR>";
        "<S-Down>" = ":resize +2<CR>";
        "<S-Left>" = ":vertical resize +2<CR>";
        "<S-Right>" = ":vertical resize -2<CR>";

        # move current line up/down
        # M = Alt key
        "<M-k>" = ":move-2<CR>";
        "<M-j>" = ":move+<CR>";
      };

    visual =
      lib.mapAttrsToList
      (key: action: {
        mode = "v";
        inherit action key;
      })
      {
        # better indenting
        ">" = ">gv";
        "<" = "<gv";
        "<TAB>" = ">gv";
        "<S-TAB>" = "<gv";

        "+" = "g<c-a>";
        "-" = "g<c-x>";

        # move selected line / block of text in visual mode
        "<S-Up>" = ":m '<-2<CR>gv=gv";
        "<S-Down>" = ":m '>+1<CR>gv=gv";
      };
  in
    lib.nixvim.keymaps.mkKeymaps
    {options.silent = true;}
    (normal ++ visual);
}
