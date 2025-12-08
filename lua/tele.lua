local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
end

local telescope = require("telescope")
telescope.setup({
    defaults = {
        results_title = false,
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            prompt_position = "top",
        },
        winblend = 0,
        border = true,
        borderchars = {
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
    },
    pickers = {
        diagnostics = {
            theme = "ivy",
            initial_mode = "normal",
            layout_config = {
                preview_cutoff = 9999,
            },
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            cwd = telescope_buffer_dir(),
            path = "%:p:h",
            hijack_netrw = true,
            respect_gitignore = false,
            hidden = false,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            mappings = {
                ["n"] = {
                    ["N"] = require("telescope").extensions.file_browser.actions.create,
                    ["h"] = require("telescope").extensions.file_browser.actions.goto_parent_dir,
                }
            }
        }
    }
})

telescope.load_extension("file_browser")
