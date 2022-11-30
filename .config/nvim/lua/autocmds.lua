-- autocmds.lua

-- format with lsp on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

