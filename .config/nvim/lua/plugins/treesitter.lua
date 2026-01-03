return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufWritePre", "BufNewFile", "VeryLazy" },
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "json",
                "lua",
                "vim",
                "python",
                "go",
                "rust",
                "markdown",
                "markdown_inline",
            },
            indent = {
                enable = true,
            },
            highlight = {
                enable = true,
            },
            textobjects = {
                lookahead = true,
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]c"] = "@class.outer",
                        ["]f"] = "@function.outer",
                        ["]a"] = "@parameter.inner",
                    },
                    goto_next_end = {
                        ["]["] = "@class.outer",
                        ["]F"] = "@function.outer",
                    },
                    goto_previous_start = {
                        ["[c"] = "@class.outer",
                        ["[f"] = "@function.outer",
                        ["[a"] = "@parameter.inner",
                    },
                    goto_previous_end = {
                        ["]F"] = "@function.outer",
                        ["[C"] = "@class.outer",
                    },
                },
            },
        },
        config = function(_, opts)
            local TS = require("nvim-treesitter")
            TS.setup(opts)

            TS.install(opts.ensure_installed)

            vim.api.nvim_create_autocmd("FileType", {
                pattern = opts.ensure_installed,
                callback = function(ev)
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo.foldmethod = 'expr'
                end,
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = "VeryLazy",
    },
}
