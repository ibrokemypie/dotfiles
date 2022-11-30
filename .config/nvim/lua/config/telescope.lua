-- telescope.lua

local telescope = require('telescope')


telescope.load_extension('projects')
telescope.load_extension('zf-native')

telescope.setup({
  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--no-ignore-vcs' }
    }
  }
})
