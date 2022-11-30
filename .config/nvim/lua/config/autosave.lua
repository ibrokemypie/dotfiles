-- autosave.lua

local autosave = require('auto-save')

autosave.setup({
  trigger_events = { "BufLeave" }
})
