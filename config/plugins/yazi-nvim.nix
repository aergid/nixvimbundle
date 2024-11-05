{pkgs, ...}:
{
  extraPlugins =
    with pkgs.vimPlugins; [
      yazi-nvim
    ];

  extraConfigLua = ''
    require('yazi').setup({
      open_for_directories = false,
      open_multiple_tabs = true,
      keymaps = {
        show_help = '<f1>',
        open_file_in_vertical_split = '<c-v>',
        open_file_in_horizontal_split = '<c-x>',
        open_file_in_tab = '<c-t>',
        grep_in_directory = '<c-s>',
        replace_in_directory = '<c-g>',
        cycle_open_buffers = false,
        copy_relative_path_to_selected_files = '<c-y>',
        send_to_quickfix_list = '<c-q>',
        change_working_directory = "<c-\\>",
      },
      yazi_floating_window_border = 'single',
    })
  '';

}
