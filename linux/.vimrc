syntax on
set number
set expandtab
set shiftwidth=4
set tabstop=4
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

"vundle configure
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" " alternatively, pass a path where Vundle should install plugins
" "let path = '~/some/path/here'
" "call vundle#rc(path)
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
filetype plugin indent on "required

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
"let g:nerd_map = '<c-f>'
"let g:nerd_cmd = 'NERDTree'
":map <c-p> <ESC>:NERDTree<CR>
nmap <silent> <C-F> :NERDTreeToggle<CR>

:map <F11> <ESC>:cprev<CR>
:map <F12> <ESC>:cnext<CR>
:map <S-F11> <ESC>:cpfile<CR>
:map <S-F12> <ESC>:cnfile<CR>
:map <C-F11> <ESC>:colder<CR>
:map <C-F12> <ESC>:cnewer<CR>
:map <S-F5> <ESC>:cwindow<CR>
:map <F5> <ESC>:vimgrep  ./**/*.*
:map <F3> <ESC>:LoadCscope<CR>
if has("gui_running")
    set guifont=Courier\ 14
    colorscheme codeschool
endif
"load cscope
function LoadCscope()
    if (executable("cscope") && has("cscope"))
        let UpperPath = findfile("cscope.out", ".;")
        if (!empty(UpperPath))
            let path = strpart(UpperPath, 0, match(UpperPath, "cscope.out$") - 1)   
            if (!empty(path))
                let s:CurrentDir = getcwd()
                let s:FullPath = join([s:CurrentDir,path],"/")
                let s:CscopeAddString = "cs add " . s:FullPath 
                execute s:CscopeAddString 
                normal <CR>
            endif
        endif
    endif
endfunction
command LoadCscope call LoadCscope()
