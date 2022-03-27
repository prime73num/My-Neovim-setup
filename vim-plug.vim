"
" __  __       __     ___           
"|  \/  |_   _ \ \   / (_)_ __ ___  
"| |\/| | | | | \ \ / /| | '_ ` _ \ 
"| |  | | |_| |  \ V / | | | | | | |
"|_|  |_|\__, |___\_/  |_|_| |_| |_|
"        |___/_____|                
call plug#begin('~/.config/nvim/plugged')

Plug 'itchyny/lightline.vim'			"statusline 
Plug 'kshenoy/vim-signature' 
Plug 'lervag/vimtex'

Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " W
Plug 'junegunn/seoul256.vim'
Plug 'mhinz/vim-startify'

Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'onsails/lspkind-nvim'
Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'


Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'uga-rosa/cmp-dictionary'
Plug 'hrsh7th/cmp-calc'
Plug 'kdheepak/cmp-latex-symbols'
Plug 'hrsh7th/nvim-cmp'

Plug 'preservim/tagbar'
Plug 'lvht/tagbar-markdown'
Plug 'lazytanuki/nvim-mapper'

Plug 'Yggdroot/indentLine'

Plug 'jiangmiao/auto-pairs'
call plug#end()

