-- whichkey.lua

local remap = vim.api.nvim_set_keymap

-- unmap space
remap('n', '<Space>', '', {})

-- set space as leader
vim.g.mapleader = ' '

-- autopair coq support
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })


remap('i', '<cr>', 'v:lua.CR()', { expr = true, noremap = true })
remap('i', '<bs>', 'v:lua.BS()', { expr = true, noremap = true })

local wk = require("which-key")

wk.setup({
  plugins = {
    spelling = {
      enabled = true
    }
  }
})

-- normal mode mappings
wk.register(
  {
    ["<LEADER>"] = {
      ["<LEADER>"] = { "<CMD>WhichKey<CR>", "Show bindings" },
      w = {
        name = "Window",
        v = { "<CMD>vsplit<CR>", "Create vertical split" },
        s = { "<CMD>split<CR>", "Create orizontal split" },
      },
      s = { "<CMD>update!<CR>", "Save" },
      q = { "<CMD>q<CR>", "Close window" },
      c = { "<PLUG>(comment_toggle_linewise_current)", "Toggle line comment" },
      r = { "<CMD>Telescope resume<CR>", "Resume last Telescope search" },
      f = {
        name = "Find",
        f = { "<CMD>Telescope find_files<CR>", "Find File" },
        s = { "<CMD>Telescope live_grep<CR>", "Find String" },
        p = { "<CMD>Telescope projects<CR>", "Find Project" },
        c = { "<CMD>Telescope commands<CR>", "Find Command" },
        h = { "<CMD>Telescope help_tags<CR>", "Find Help" },
        r = { "<CMD>Telescope lsp_references<CR>", "Find References" },
        t = { "<CMD>Telescope tags<CR>", "Find Tag" },
        b = { "<CMD>Telescope buffers<CR>", "Find Buffer" },
      },
      u = {
        name = "Packer",
        c = { "<CMD>PackerCompile<CR>", "Compile" },
        s = { "<CMD>PackerSync<CR>", "Sync" },
        S = { "<CMD>PackerStatus<CR>", "Status" },
        u = { "<CMD>PackerUpdate<CR>", "Update" },
      },
      t = {
        name = "Trouble",
        t = { "<CMD>TroubleToggle<CR>", "Toggle" },
        w = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Workspace" },
        o = { "<CMD>TroubleToggle document_diagnostics<CR>", "Document" },
        d = { "<CMD>TroubleToggle lsp_definitions<CR>", "Definitions" },
        r = { "<CMD>TroubleToggle lsp_references<CR>", "References" },
        i = { "<CMD>TroubleToggle lsp_implementations<CR>", "Implementations" },
        l = { "<CMD>TroubleToggle loclist<CR>", "Loclist" },
      }
    },
    ["<C-h>"] = { "<CMD>wincmd h <CR>", "Focus window left" },
    ["<C-j>"] = { "<CMD>wincmd j <CR>", "Focus window down" },
    ["<C-k>"] = { "<CMD>wincmd k <CR>", "Focus window up" },
    ["<C-l>"] = { "<CMD>wincmd l <CR>", "Focus window right" },
    ["K"] = { "{", "Up paragraph" },
    ["J"] = { "}", "Down paragraph" },
    ["H"] = { "^", "Start of line" },
    ["L"] = { "$", "End of line" },
    ["<Left>"] = { "<CMD>vertical resize +1<CR>", "Grow window left" },
    ["<Down>"] = { "<CMD>resize +1<CR>", "Grow window down" },
    ["<Up>"] = { "<CMD>resize -1<CR>", "Shrink window up" },
    ["<Right>"] = { "<CMD>vertical resize -1<CR>", "Shrink window left" },
    ["<ESC>"] = { "<CMD>nohlsearch<Bar>:echo<CR>", 'Cancel search' },
    ["<C-t>"] = { "<CMD>tabnew<CR>", "New tab" },
    ["<C-tab>"] = { "<CMD>tabnext<CR>", "Next tab" },
    ["<C-s-tab>"] = { "<CMD>tabprevious<CR>", "Previous tab" },
  },
  {
    mode = "n"
  }
)

-- visual mode mappings
wk.register(
  {
    ["<LEADER>"] = {
      c = { "<PLUG>(comment_toggle_blockwise_visual)", "Toggle block comment" },
    },
  },
  {
    mode = "v"
  }
)

-- insert mode mappings
wk.register(
  {
    ["jk"] = { "<ESC>", "" },
    ["<C-h>"] = { "<Left>", "Left" },
    ["<C-j>"] = { "<Down>", "Down" },
    ["<C-k>"] = { "<Up>", "Up" },
    ["<C-l>"] = { "<Right>", "Right" },
    ["<Up>"] = { "<NOP>", "which_key_ignore" },
    ["<Down>"] = { "<NOP>", "which_key_ignore" },
    ["<Left>"] = { "<NOP>", "which_key_ignore" },
    ["<Right>"] = { "<NOP>", "which_key_ignore" },
  },
  {
    mode = "i"
  }
)

-- terminal mode mappings
wk.register(
  {
    ["jk"] = { "<C-\\><C-n>", "" },
    ["<C-h>"] = { "<Left>", "Left" },
    ["<C-j>"] = { "<Down>", "Down" },
    ["<C-k>"] = { "<Up>", "Up" },
    ["<C-l>"] = { "<Right>", "Right" },
  },
  {
    mode = "t"
  }
)
