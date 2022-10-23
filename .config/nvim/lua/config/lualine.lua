-- lualine.lua

local lualine = require('lualine')


lualine.setup{
  options = {
   theme = 'gruvbox_dark',
 },
 sections = {
   lualine_x = {'encoding', 'filetype'}
 }
}

