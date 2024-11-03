{
  plugins.tmux-navigator = {
    enable = true;

    keymaps = [
      {
        key = "<C-Left>";
        action = "left";
      }
      {
        key = "<C-Down>";
        action = "down";
      }
      {
        key = "<C-Up>";
        action = "up";
      }
      {
        key = "<C-Right>";
        action = "right";
      }
      {
        key = "<C-l>";
        action = "previous";
      }
    ];

    settings = {
      save_on_switch = 2;
      disable_when_zoomed = 1;
      preserve_zoom = 1;
      no_wrap = 1;
    };
  };
}
