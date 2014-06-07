execute pathogen#infect()

" UTF8 by default
set encoding=utf8

" Allow lines to extend off the side of the screen
set nowrap

" More than the standard 50 lines of scrollback
set history=300

" Start scrolling when we're 5 chars from the edge of the screen
set sidescrolloff=5

" Start scrolloing when we're 5 lines from the top/bottom of the screen
set scrolloff=5

" Indicate that a line is wider than the page with a >
set listchars+=precedes:<,extends:>

" Don't bother setting the screen title
set notitle

" Always display the statusbar
set laststatus=2

" Display cursor coordinates
set ruler

" Allow backspace to delete onto the previous line
set backspace=indent,eol,start

" Don't care about case when searching...
set ignorecase

" ...Unless we include capitals
set smartcase

" Indicate that we have a fast terminal
set ttyfast

" Colours for dark backgrounds
set background=dark

" Display line numbers
set number

" Keep the cursor in the same column...
set autoindent

" ...Unless the previous line ended with a brace
set smartindent

" Comment in the same column as the previous row
inoremap # X#

" Always replace all occurences on current line
set gdefault

" Display search matches as you type
set incsearch

" Tab == 4 spaces
set softtabstop=4

" Replace tabs with spaces
set expandtab

" 4 spaces with autoindent and >>
set shiftwidth=4

" Round indents to multiples of shiftwidth
set shiftround

" Highlight partner bracket when typing
set showmatch

" When we split, give focus to the new window
set splitbelow
set splitright

" We don't want to include underscores in words
"set iskeyword=@,48-57,192-255

" Look for tagfile here
set tags=~/.tags

" Status bar is blue
set t_mr=[0;1;37;44m

" http://kien.github.com/ctrlp.vim/#installation
set runtimepath^=~/.vim/bundle/ctrlp.vim

set modeline
set modelines=5
set nogdefault

highlight   Pmenu               term=NONE cterm=NONE ctermfg=7 ctermbg=5 gui=NONE guifg=White guibg=Magenta
highlight   PmenuSel            term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White
highlight   PmenuSbar           term=NONE cterm=NONE ctermfg=7 ctermbg=0 gui=NONE guifg=White guibg=Black
highlight   PmenuThumb          term=NONE cterm=NONE ctermfg=0 ctermbg=7 gui=NONE guifg=Black guibg=White

" Highlight syntax
syntax on

" KEY BINDINGS


" Syntax check
map <F1> :w ! ruby -c<CR>

" Toggle search highlighting
map <F2> :set hlsearch!<CR>

" Clear whitespace
map <F3> :%s/\s\+$//<CR>

" See the diffs of the current file
map <F4> :! git diff --color %<CR>

" Comment/uncomment block
map <F5> : s/^/#/<CR>
map <F6> : s/^#//<CR>

"Re-indent
map <F7> gg=G<CR>

" Numbering on/off
map <F8> :set nu!<CR>

" Toggle paste mode
map <F9> :set paste!<CR>

" sudo save
map <F10> :w ! sudo tee % <CR><CR>

" Solarized!

" Taglist settings
" nnoremap <silent> <F5> :TlistToggle<CR>

"" Exit if taglist is last window
"let Tlist_Exit_OnlyWindow = 1
"
"" Only show tags for this file
"let Tlist_Show_One_File = 1
"
"" Don't bother showing a fold column
"let Tlist_Enable_Fold_Column = 0
"
"" Close taglist on select
"let Tlist_Close_On_Select = 1
"
"" Don't show cruft
"let Tlist_Compact_Format = 1
"
"" Give it focus when we open
"let Tlist_GainFocus_On_ToggleOpen = 1
"
"" Make window as wide as necessary
"let Tlist_Inc_Winwidth = 1

" autocmd BufReadPost *.tt set syntax=html

" Tab completion of variables
" inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
" inoremap <S-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"function! InsertTabWrapper(direction)
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    elseif "backward" == a:direction
"        return "\<c-p>"
"    else
"        return "\<c-n>"
"    endif
"endfunction
"
"Ctrl-P options:

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif

"set nocompatible      " We're running Vim, not Vi!
"syntax on             " Enable syntax highlighting
filetype plugin indent on    " Enable filetype-specific indenting
autocmd BufRead,BufNewFile *.yaml filetype indent off

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
