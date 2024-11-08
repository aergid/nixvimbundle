{
  plugins.markdown-preview = {
    enable = true;

    settings = {
      autoClose = false;
      theme = "dark";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>p";
      action = ":MarkdownPreview<cr>";
      options.silent = true;
    }
  ];
}
