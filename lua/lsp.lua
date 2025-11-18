require("mason").setup()
local cmp = require("cmp")
local select_opts = {behavior = cmp.SelectBehavior.Select}
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

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.lsp.enable({"lua_ls", "gdscript", "gdshader_lsp", "jdtls", "ts_ls", "clangd"})

vim.lsp.config('*', {
    capabilities = require("cmp_nvim_lsp").default_capabilities()
})

require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        scss = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        graphql = { "prettierd", "prettier" },
        md = { "prettierd", "prettier" },
        txt = { "prettierd", "prettier" }
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
})
