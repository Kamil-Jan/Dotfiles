local fn = vim.fn
-- Automatically install packer (.local/share/nvim/site/pack/packer/start)
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "numToStr/Comment.nvim" -- Auto commenting
    use "JoosepAlviste/nvim-ts-context-commentstring" -- Treesitter plugin for commentstring
    use "mhinz/vim-signify" -- Git integration
    use "morhetz/gruvbox" -- Colorscheme
    use "nvim-treesitter/nvim-treesitter" -- Treesitter
    use "tpope/vim-surround" -- Auto parenthesis
    use "kyazdani42/nvim-tree.lua" -- File explorer

    -- Lualine
    use "nvim-lualine/lualine.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- Cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- Buffer completions
    use "hrsh7th/cmp-path" -- Path completions
    use "saadparwaiz1/cmp_luasnip" -- Snippet completions
    use "hrsh7th/cmp-nvim-lsp"

    -- Native LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer

    -- Snippets
    use "L3MON4D3/LuaSnip" -- Snippet engine
    use "rafamadriz/friendly-snippets" -- A bunch of snippets to use

    -- Fast Navigation
    use "unblevable/quick-scope"
    use "easymotion/vim-easymotion"

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)

