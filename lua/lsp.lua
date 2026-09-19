require("mason").setup()
local cmp = require("cmp")

local max_width = math.floor(vim.o.columns * 0.8)
local max_height = math.floor(vim.o.lines * 0.3)

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered({
            max_width = math.floor(vim.o.columns * 0.5),
            max_height = max_height,
        }),
    },
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

vim.lsp.config('*', {
    capabilities = require("cmp_nvim_lsp").default_capabilities()
})

local neocmake_caps = require("cmp_nvim_lsp").default_capabilities()
neocmake_caps.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.config('neocmake', {
    capabilities = neocmake_caps,
    init_options = {
        format = { enable = true },
        lint = { enable = true },
        scan_cmake_in_package = true,
    }
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } }
        }
    }
})

vim.lsp.enable({ "lua_ls", "ts_ls", "clangd", "asm_lsp", "rust_analyzer",
    "texlab", "svelte", "kotlin_language_server",
    "roslyn_ls", "pylsp", "elixirls", "tinymist", "tailwindcss", "neocmake", "jdtls", "slangd" })

require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
    },
    format_on_save = { timeout_ms = 500, lsp_fallback = true },
})

-- FORCING WRAP IN HOVER (Modern Nvim 0.11/0.12 way)
local orig_hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function(opts)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    opts.max_width = opts.max_width or max_width
    opts.max_height = opts.max_height or max_height
    opts.wrap = opts.wrap ~= false
    opts.wrap_at = opts.wrap_at or max_width
    return orig_hover(opts)
end

-- FORCING WRAP IN SIGNATURE HELP
local orig_signature_help = vim.lsp.buf.signature_help
vim.lsp.buf.signature_help = function(opts)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    opts.max_width = opts.max_width or max_width
    opts.max_height = opts.max_height or max_height
    opts.wrap = opts.wrap ~= false
    opts.wrap_at = opts.wrap_at or max_width
    return orig_signature_help(opts)
end

-- Your diagnostic config is mostly fine, but let's make sure it's pristine
vim.diagnostic.config({
    virtual_text = false, -- Goodbye bleeding text!
    severity_sort = true,
    float = {
        source = "always",
        border = "rounded",
        max_width = max_width,
        wrap = true,
    },
})
