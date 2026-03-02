local note = require("nvim-note")

vim.api.nvim_create_user_command("Note", note.open, {})
