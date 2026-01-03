return {
	"neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufWritePre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
    opts = function()
        local ret = {
            diagnostics = {
                virtual_text = false,
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN] = "",
                        [vim.diagnostic.severity.HINT] = "",
                        [vim.diagnostic.severity.INFO] = "",
                    },
                },
                update_in_insert = true,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    buffer = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            },
            servers = {
                ["pyright"] = { },
                ["clangd"] = { },
                ["rust_analyzer"] = { },
                ["gopls"] = { },
            }
        }
        return ret
    end,
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

        local hover = vim.lsp.buf.hover
        vim.lsp.buf.hover = function()
            return hover({
                border = "rounded",
                width = 60,
            })
        end

        local signature_help = vim.lsp.buf.signature_help
        vim.lsp.buf.signature_help = function()
            return signature_help({
                border = "rounded",
                width = 60,
            })
        end

		local on_attach = function(client, bufnr)
			local opts = { noremap = true, silent = true, buffer = bufnr }
			local keymap = vim.keymap.set

			keymap("n", "gD", vim.lsp.buf.declaration, opts)
			keymap("n", "gd", vim.lsp.buf.definition, opts)
			keymap("n", "K", vim.lsp.buf.hover, opts)
			keymap("n", "gK", vim.lsp.buf.signature_help, opts)
			keymap("n", "gi", vim.lsp.buf.implementation, opts)
			keymap("n", "gr", vim.lsp.buf.references, opts)
			keymap("n", "[d", function() vim.diagnostic.goto_prev({ border = "rounded" }) end, opts)
			keymap("n", "]d", function() vim.diagnostic.goto_next({ border = "rounded" }) end, opts)
			keymap("n", "gl", function() vim.diagnostic.open_float({ border = "rounded" }) end, opts)
			keymap("n", "<leader>q", vim.diagnostic.setloclist, opts)

			vim.api.nvim_create_user_command("Format", function()
				vim.lsp.buf.format({ async = true })
			end, {})

			local status_ok, illuminate = pcall(require, "illuminate")
			if status_ok then
				illuminate.on_attach(client)
			end
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

        local ensure_installed = {}
        for server, server_opts in pairs(opts.servers) do
            table.insert(ensure_installed, server)
            server_opts = vim.tbl_deep_extend("force", server_opts or {}, {
                on_attach = on_attach,
                capabilities = capabilities,
            })
            vim.lsp.config(server, server_opts)
        end

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			}
		})

		mason_lspconfig.setup({
			ensure_installed = ensure_installed,
			automatic_installation = true,
		})
	end,
}
