local tree_sitter = require("nvim-treesitter.configs")

tree_sitter.setup({
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
})
