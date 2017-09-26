set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

" Add ColorSchemes
" Plugin 'flazz/vim-colorschemes'

" Carbonized
" Plugin 'nightsense/carbonized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" NERDTree cfg
" nmap <F7> :NERDTreeToggle<CR>

" NERDTree on boot
" :autocmd vimenter * NERDTree

" Move to code when starting with NERDTree
" :au VimEnter * wincmd l


" Tagbar cfg
" nmap <F8> :TagbarToggle<CR>

" TagBar on boot
autocmd VimEnter * Tagbar

" TagBar on left
let g:tagbar_left = 1

au VimEnter * wincmd l



" UI Settings
:set colorcolumn=80		" Line at 80 columns
:set number				"Line numbers


" Tabs
set tabstop=4			" 4 spaces as tab
set softtabstop=4		
set shiftwidth=4

" ColorSchemes
colorscheme elflord
" colorscheme zephyr 	" Activate Plugin colorscheme

"R ctags
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
	\ }

