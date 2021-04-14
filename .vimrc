if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugin management
call plug#begin('~/.vim/plugged')
"Sensible - we will see
Plug 'tpope/vim-sensible'

" markdown
Plug 'godlygeek/tabular' | Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

"status bar
Plug 'itchyny/lightline.vim'
"surrounding brackets
Plug 'tpope/vim-surround'
"File tree
Plug 'scrooloose/nerdtree'

"fuzzy search
Plug 'junegunn/fzf'

"git
Plug 'junegunn/fzf'
Plug 'airblade/vim-gitgutter'

"completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

