vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<leader>=", ":Format<CR>", { desc = 'Format' })
-- [[My Keymaps]]
-- general keymaps
vim.keymap.set("n", "<leader>st", ":Themery<CR>", { desc = '[S]elect [T]heme' })

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<leader>+", "<C-a>", { desc = 'Increase by 1' })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = 'Decrease by 1' })

--Clear Searches
vim.keymap.set("n", "<leader>cs", ":noh<CR>", { silent = true, desc = '[C]lear [S]earch' })

-- Move highlighted lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move Selected Text Up' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move Selected Text Down' })
vim.keymap.set("n", "J", "mzJ`z", { desc = 'Delete at end of line' })

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = 'Escape Remap' })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Find and Replace' })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make file runnnable bash' })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/init.lua<CR>", { desc = 'Go To Plugin Manager File' });

-- Windows
vim.keymap.set("n", "<leader>sv", "<C-w>v", { silent = true, desc = '[S]plit Window [V]ertically' })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { silent = true, desc = '[S]plit Window [H]orizontally' })
vim.keymap.set("n", "<leader>se", "<C-w>=", { silent = true, desc = '[S]plit Windows [E]qual Width' })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { silent = true, desc = '[S]plit Window [C]lose' })

-- Bufferline tab setup
vim.keymap.set('n', '<Tab>', ">>", { desc = 'Move line forward by Tabsize' })
