local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    update_in_insert = false,
    always_visible = true,
}

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = '|',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { },
        always_divide_middle = true,
    },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = "", right = "" }, right_padding = 2 },
        },
        lualine_b = { 'filename', { 'branch', icons_enabled = true, icon = "" }, },

        lualine_c = { diagnostics },
        lualine_x = {},
        lualine_y = { { 'filetype', icons_enabled = false, icon = nil }, 'progress' },
        lualine_z = {
          { 'location', separator = { right = "" }, left_padding = 0 },
        },
      },
    inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
})

