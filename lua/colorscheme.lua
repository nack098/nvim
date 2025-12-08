require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = true,
    float = { transparent = true, },
    integrations = {
        telescope = true,
    },
})

vim.cmd.colorscheme("catppuccin")

require("lualine").setup()
