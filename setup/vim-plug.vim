"
" __  __       __     ___           
"|  \/  |_   _ \ \   / (_)_ __ ___  
"| |\/| | | | | \ \ / /| | '_ ` _ \ 
"| |  | | |_| |  \ V / | | | | | | |
"|_|  |_|\__, |___\_/  |_|_| |_| |_|
"        |___/_____|                
call plug#begin('~/.config/nvim/plugged')

Plug 'kshenoy/vim-signature'

" latex and markdown
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

 " Nvim Tree-Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " W
Plug 'andymass/vim-matchup'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'



" Sytex themes startup
Plug 'junegunn/seoul256.vim'
Plug 'startup-nvim/startup.nvim'
Plug 'nvim-lualine/lualine.nvim'
" Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }

" Telescope and plugin
Plug 'voldikss/vim-floaterm'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'prime73num/telescope-file-browser.nvim'
" Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'fcying/telescope-ctags-outline.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }


Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'onsails/lspkind-nvim'
Plug 'liuchengxu/vista.vim'

" Completion
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-omni'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'uga-rosa/cmp-dictionary'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/nvim-cmp'

" Lsp Config
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

" Plug 'preservim/tagbar'
" Plug 'lvht/tagbar-markdown'

" Useful Plugin
Plug 'Yggdroot/indentLine'
Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-surround'
Plug 'MunifTanjim/nui.nvim'
Plug 'prime73num/neo-tree.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'justinmk/vim-sneak'
Plug 'windwp/nvim-autopairs'

" Remote copy from ssh
Plug 'ojroques/nvim-osc52'

call plug#end()

