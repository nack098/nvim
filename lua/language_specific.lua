function set_language_config()
    local filetype = vim.bo.filetype

    if filetype == "javascript" or filetype == "javascriptreact" or filetype == "typescript" or filetype == "typescriptreact" then
        vim.o.tabstop = 2
        vim.o.shiftwidth = 2
        vim.o.softtabstop = 2
        vim.o.expandtab = true
    end
end
