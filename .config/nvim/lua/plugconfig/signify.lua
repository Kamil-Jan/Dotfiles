vim.g['signify_sign_add'] = '+'
vim.g['signify_sign_delete'] = '_'
vim.g['signify_sign_delete_first_line'] = '‾'
vim.g['signify_sign_change'] = '~'

-- I find the numbers disctracting
vim.g['signify_sign_show_count'] = 0
vim.g['signify_sign_show_text'] = 1

-- Jump though hunks
vim.api.nvim_set_keymap("n", "<leader>gj", "<plug>(signify-next-hunk)", { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gk", "<plug>(signify-prev-hunk)", { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gJ", "9999<leader>gj", { noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>gK", "9999<leader>gk", { noremap = true, silent = true})

