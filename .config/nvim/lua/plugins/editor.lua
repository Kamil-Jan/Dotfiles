return {
    {
        "unblevable/quick-scope",
        event = "VeryLazy",
        init = function()
            vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
            vim.g.qs_max_chars = 150
            vim.cmd [[
                highlight QuickScopePrimary guifg='#83a598' gui=underline ctermfg=155 cterm=underline
                highlight QuickScopeSecondary guifg='#8ec07c' gui=underline ctermfg=81 cterm=underline
            ]]
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufWritePre", "BufNewFile" },
        opts = {
            signs = {
                add = { text = "+", guibg = 237 },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
                untracked = { text = "▎" },
            },
            signs_staged = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
            },
        },
    },
}
