-- lualine.lua

local lualine = require('lualine')
local navic = require('nvim-navic')

lualine.setup {
  options = {
    theme = 'gruvbox_dark',
  },
  extensions = {
    'fugitive',
  },
  sections = {
    lualine_x = { 'encoding', 'filetype' }
  },
  tabline = {
    lualine_a = {
      { 'filename', path = 1, },
    },
    lualine_b = { { navic.get_location, cond = navic.is_available }, },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'tabs' }
  },
  inactive_sections = {
    lualine_c = { { 'filename', path = 1, }, }
  }
}
