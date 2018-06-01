call plug#begin("~/.local/share/nvim/plugged")

Plug 'airblade/vim-gitgutter'
Plug 'https://github.com/euclio/vim-markdown-composer'
Plug 'neomake/neomake'
Plug 'https://github.com/cazador481/fakeclip.neovim'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'othree/csscomplete.vim'
Plug 'junegunn/fzf' " if not installed already 
"Plug 'teto/nvim-palette', { 'do': ':UpdateRemotePlugins'}
Plug 'dylanaraps/wal.vim'

call plug#end()

call neomake#configure#automake('rw', 1000)
"call PaletteSelect({ 'menus': 1})
"let g:vim_fakeclip_tmux_plus=1 

colorscheme wal
