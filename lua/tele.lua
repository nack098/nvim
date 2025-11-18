require("telescope").setup({
    defaults = {
          results_title = false,
          sorting_strategy = "ascending",
          layout_strategy = "center",
          layout_config = {
            preview_cutoff = 1, -- Preview should always show (unless previewer = false)
            width = function(_, max_columns, _)
              return math.min(max_columns, 80)
            end,
            height = function(_, _, max_lines)
              return math.min(max_lines, 15)
            end,
          },
          border = true,
          borderchars = {
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            mappings = {
                ["n"] = {
                    ["N"] = require("telescope").extensions.file_browser.actions.create,
                    ["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
                }
            }
        }
    }
})

require("telescope").load_extension("file_browser")
