-- Functions to set remaps
function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end
function nmap(shortcut, command)
    map('n', shortcut, command)
end
function imap(shortcut, command)
    map('i', shortcut, command)
end
function vmap(shortcut, command)
    map('v', shortcut, command)
end
function cmap(shortcut, command)
    map('c', shortcut, command)
end
function tmap(shortcut, command)
    map('t', shortcut, command)
end
function xmap(shortcut, command)
    map('x', shortcut, command)
end

-- Move upward/downward not linewise
nmap('j', 'gj')
nmap('k', 'gk')

-- Add blank line by hitting Enter
nmap('<CR>', 'm`o<Esc>``')

-- Buffer navigations
nmap('<C-j>', '<C-W><C-j>')
nmap('<C-k>', '<C-W><C-k>')
nmap('<C-l>', '<C-W><C-l>')
nmap('<C-h>', '<C-W><C-h>')

-- Exit terminal mode using Ctrl+d
tmap('<C-d>', '<C-\\><C-n>')

-- Resize windows
nmap('<C-M-j>', ':resize -2<CR>')
nmap('<C-M-k>', ':resize +2<CR>')
nmap('<C-M-l>', ':vertical resize -2<CR>')
nmap('<C-M-h>', ':vertical resize +2<CR>')

-- Tab navigations
nmap('<C-t>', ':tabnew<CR>')
nmap('<M-l>', ':tabnext<CR>')
nmap('<M-h>', ':tabprev<CR>')
nmap('<M-L>', ':tabm +1<CR>')
nmap('<M-H>', ':tabm -1<CR>')

-- Moving lines
xmap('K', ":move '<-2<CR>gv-gv")
xmap('J', ":move '>+1<CR>gv-gv")

-- Copy and paste
vmap('<leader>y', '"+y')
xmap('<leader>y', '"+y')
nmap('<leader>p', '"+p')
nmap('<leader>ay', ':%y+<CR>')

-- Auto correcting in a line
imap('<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u')

-- Fast replacements
nmap('s*', ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn")
xmap('s*', '"sy:let @/=@s<CR>cgn')

-- Change keymap to Russian
nmap('<M-r>', ':set iminsert=1<CR>')
-- Change keymap to English
nmap('<M-e>', ':set iminsert=0<CR>')

nmap('<F5>', ':NvimTreeToggle<CR>')
