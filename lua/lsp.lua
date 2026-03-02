require("mason").setup()
local cmp = require("cmp")
local select_opts = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    expand = function(args)
        require("luasnip").lsp_expand(args.body)
    end,
    sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "luasnip" }
    },
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    }
})

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.lsp.enable({ "lua_ls", "ts_ls", "clangd", "asm_lsp", "rust_analyzer",
    "texlab",
    "csharp_ls", "pylsp" })

vim.lsp.config('*', {
    capabilities = require("cmp_nvim_lsp").default_capabilities()
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } }
        }
    }
})

require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
})
