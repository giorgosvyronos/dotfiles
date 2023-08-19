vim.keymap.set("n", "<leader>xx", ":TroubleToggle<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq", ":TroubleToggle quickfix<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl", ":TroubleToggle loclist<CR>", {silent = true, noremap = true})
vim.keymap.set("n", "gR", ":TroubleToggle lsp_references<CR>", {silent = true, noremap = true})