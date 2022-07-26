-- Trigger a highlight in the appropriate direction when pressing these keys
vim.g['qs_highlight_on_keys'] = { 'f', 'F', 't', 'T' }
vim.g['qs_max_chars'] = 150

-- Gruvbox highlighting
vim.cmd [[
    highlight QuickScopePrimary guifg='#83a598' gui=underline ctermfg=155 cterm=underline
    highlight QuickScopeSecondary guifg='#8ec07c' gui=underline ctermfg=81 cterm=underline
]]

