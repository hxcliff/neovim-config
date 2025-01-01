local neo_tree = require('neo-tree')

neo_tree.setup({
  close_if_last_window = true,
  popup_border_style = 'single',
  use_default_mappings = false,
  window = {
    position = 'left',
    width = 35,
    mappings = {
      ["<space>"] = {
        "toggle_node",
        nowait = false
      },
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["<esc>"] = "cancel",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["l"] = "focus_preview",
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      ["a"] = { "add", config = { show_path = "none" } },
      ["A"] = "add_directory",
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy",
      ["m"] = "move",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
      ["i"] = "show_file_details"
    }
  },
  filesystem = {
    follow_current_file = {
      enabled = true
    },
    use_libuv_file_watcher = true
  }
})
