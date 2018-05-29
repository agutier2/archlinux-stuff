set nocompatible              " be iMproved, required
filetype off                  " required

" Set X clipboard as default
set clipboard=unnamedplus

" Size constraints
set textwidth=80

" Local leader as comma
let maplocalleader = "," 

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'jaxbot/github-issues.vim'
" Plugin 'fubukimaru/github-issues.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'majutsushi/tagbar'
"Plugin 'lvht/tagbar-markdown'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'enricobacis/vim-airline-clock'

Plugin 'TaskList.vim'

" R support
Plugin 'jalvesaq/Nvim-R'

" Other interactive languajes
Plugin 'jpalardy/vim-slime'

Plugin 'junegunn/goyo.vim'
" Plugin 'yuratomo/w3m.vim'

Plugin 'vim-scripts/Tabmerge' 

Plugin 'vyzyv/vimpyter'

" Plugin 'fs111/pydoc.vim'

" Add ColorSchemes
" Plugin 'flazz/vim-colorschemes'

" Carbonized
" Plugin 'nightsense/carbonized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" NERDTree cfg
nmap <F7> :NERDTreeToggle<CR>
let NERDTreeMapOpenInTab='<ENTER>'


" NERDTree on boot
" :autocmd vimenter * NERDTree

" Move to code when starting with NERDTree
" :au VimEnter * wincmd l

" Tasklist remap 
map <F9> <Plug>TaskList



" Tagbar cfg
nmap <F8> :TagbarToggle<CR>
" autocmd VimEnter * Tagbar   " TagBar on boot
let g:tagbar_left = 1       " TagBar on left
let g:tagbar_width = 25     " Tagbar width


au VimEnter * wincmd l



" UI Settings
:set colorcolumn=80		" Line at 80 columns
:set number				"Line numbers

" VIM airline
let g:airline#extensions#tabline#enabled = 1		" Smart tab line
let g:airline#extensions#clock#format = '%H:%M:%S'	" Airline clock
let g:airline#extensions#clock#updatetime = 5000	" Update clock each 5 sec
let g:airline_powerline_fonts = 1					" Use powerline fonts

let g:airline_theme='badcat'						" Airline theme


" Tabs
set tabstop=4			" 4 spaces as tab
set softtabstop=4		
set shiftwidth=4
set expandtab			" Tab to space

" ColorSchemes
colorscheme elflord
" colorscheme zephyr 	" Activate Plugin colorscheme

set t_Co=256			" 256 colors

"R ctags
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
	\ }

" Markdown
let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
                \ 'h:headings',
                \ 'l:links',
                \ 'i:images'
            \ ],
    \ "sort" : 0
\ }


" Remap arrow keys
noremap ; l
noremap ñ l
noremap l k
noremap k j
noremap j h

noremap <C-w>ñ <C-w>l
noremap <C-w>l <C-w>k
noremap <C-w>k <C-w>j
noremap <C-w>j <C-w>h



syntax on

" Goyo default size
" let g:goyo_width = 80
" let g:goyo_height = '100%' " 100%
" let g:goyo_linenr = 0

" Goyo enter function
function! s:goyo_enter()
    " Goyo virtual up and down instead of line up and down
    " local remap
    noremap <buffer> l gk
    noremap <buffer> k gj

    ":q quits vim
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
    "local up down restore
    noremap <buffer> l k
    noremap <buffer> k j
  " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" Remove bars '|' on split
:set fillchars+=vert:\  " Change it for space




" Github-issues.vim config
source ~/.gitvimtoken
"let g:github_issues_no_omni = 1
let g:gissues_lazy_load = 1

" NvimR
let R_nvimpager = "tab" " help in a new tab
let R_in_buffer = 0     " R in tmux external terminal 
let R_term = "urxvt" 


"" Disable _ as <-
let R_assign = 0
"inoremap <-- %>%



" Syntax highlighting on non-standard extensions and asm to Microsoft ASM
au BufNewFile,BufRead *.{asm,ASM,GEN,gen,{z,Z}80} set filetype=z80



" Vim slime config
let g:slime_target = "screen"
let g_slime_paste_file = "/tmp/.vim-python-pipe"

"" Disabled by default
let g:slime_no_mappings = 1
