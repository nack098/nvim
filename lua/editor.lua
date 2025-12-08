require("language_specific")

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

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
vim.o.cmdheight = 1
vim.o.title = true
vim.o.laststatus = 3
vim.o.scrolloff = 10
vim.o.inccommand = "split"
vim.o.ignorecase = true
vim.o.smarttab = true
vim.o.breakindent = true
vim.o.splitright = true
vim.o.splitkeep = "cursor"
vim.o.mouse = ""
vim.o.autoindent = true

vim.o.guicursor = ""

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[set guicursor=i:blinkwait300-blinkon300-blinkoff200]])

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "*" },
    callback = function()
        set_language_config()
    end
})

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    severity_sort = true,
    float = {
        source = "always"
    },
})
