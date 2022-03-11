source $HOME/.config/nvim/vim-plug.vim
source $HOME/.config/nvim/plug-config/neovim.vim
source $HOME/.config/nvim/plug-config/startify.vim
source $HOME/.config/nvim/plug-config/treesitter.vim
source $HOME/.config/nvim/plug-config/tagbar.vim
source $HOME/.config/nvim/plug-config/indentline.vim
autocmd Filetype markdown source $HOME/.config/nvim/plug-config/markdown.vim
autocmd Filetype tex source $HOME/.config/nvim/plug-config/latex.vim
lua require 'user.Devicon'
lua require 'user.renamer'
lua require 'user.telescope'
lua require 'user.Cmp'
lua require 'user.lspconfig'
lua require 'user.luasnip'
source $HOME/.config/nvim/colorscheme.vim
