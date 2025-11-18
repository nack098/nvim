require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = true
})

vim.cmd.colorscheme("catppuccin")

require("lualine").setup()
