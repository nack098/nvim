require("mason").setup()
local cmp = require("cmp")
local select_opts = { behavior = cmp.SelectBehavior.Select }

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
vim.lsp.enable({ "lua_ls", "ts_ls", "clangd", "asm_lsp", "rust_analyzer",
    "texlab",
    "roslyn_ls", "pylsp", "elixirls", "tinymist", "tailwindcss"  })

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

-- FORCING WRAP IN HOVER
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded",
    max_width = max_width,
    max_height = max_height,
    wrap = true,
    wrap_at = max_width,
  }
)

-- FORCING WRAP IN SIGNATURE HELP
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded",
    max_width = max_width,
    max_height = max_height,
    wrap = true,
    wrap_at = max_width,
  }
)

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
