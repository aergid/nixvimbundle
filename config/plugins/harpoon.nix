{
  plugins.harpoon = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    }
  ];
}
