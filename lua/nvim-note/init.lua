local note = {}

local filename = vim.fn.stdpath("data") .. "/random_note.md"

function note.open()
    -- ensure directory exists
    vim.fn.mkdir(vim.fn.fnamemodify(filename, ":h"), "p")

    -- create or get buffer WITHOUT opening a window
    local buf = vim.fn.bufadd(filename)
    vim.fn.bufload(buf)

    -- buffer options (normal file buffer!)
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false
    vim.bo[buf].filetype = "markdown"

    -- open floating window ONLY
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = math.floor(vim.o.columns * 0.6),
        height = math.floor(vim.o.lines * 0.6),
        row = math.floor(vim.o.lines * 0.2),
        col = math.floor(vim.o.columns * 0.2),
        style = "minimal",
        border = "rounded",
    })

    -- convenience: q = save & close
    vim.keymap.set("n", "q", "<cmd>wq<CR>", { buffer = buf })
end

return note
