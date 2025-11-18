require("language_specific")
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.winborder = "rounded"

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"*"},
    callback = function()
        set_language_config()
    end
})
