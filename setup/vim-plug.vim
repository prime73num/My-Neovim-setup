"
" __  __       __     ___           
"|  \/  |_   _ \ \   / (_)_ __ ___  
"| |\/| | | | | \ \ / /| | '_ ` _ \ 
"| |  | | |_| |  \ V / | | | | | | |
"|_|  |_|\__, |___\_/  |_|_| |_| |_|
"        |___/_____|                
call plug#begin('~/.config/nvim/plugged')

Plug 'kshenoy/vim-signature' 
Plug 'lervag/vimtex'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Sytex themes startup
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " W
Plug 'junegunn/seoul256.vim'
Plug 'mhinz/vim-startify'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" Telescope and plugin
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'fcying/telescope-ctags-outline.nvim'
Plug 'jvgrootveld/telescope-zoxide'


Plug 'onsails/lspkind-nvim'
Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }

" Completion
Plug 'neovim/nvim-lspconfig'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'uga-rosa/cmp-dictionary'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/nvim-cmp'

Plug 'preservim/tagbar'
Plug 'lvht/tagbar-markdown'

" Useful Plugin
Plug 'Yggdroot/indentLine'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'justinmk/vim-sneak'
Plug 'windwp/nvim-autopairs'

call plug#end()

