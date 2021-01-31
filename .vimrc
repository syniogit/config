syntax on
set t_Co=256
colorscheme elflord
" set cursorline

" start scrolling at offset 5
set so=5
set nu
set tabstop=4
set shiftwidth=4
set noexpandtab
set autoindent
if has("autocmd")
	filetype plugin indent on
endif

autocmd FileType ruby setlocal shiftwidth=4 tabstop=4 noexpandtab autoindent
autocmd FileType c setlocal shiftwidth=8 tabstop=8 noexpandtab autoindent
autocmd FileType h setlocal shiftwidth=8 tabstop=8 noexpandtab autoindent
autocmd FileType cc setlocal shiftwidth=8 tabstop=8 noexpandtab autoindent
autocmd FileType cpp setlocal shiftwidth=8 tabstop=8 noexpandtab autoindent
autocmd FileType js setlocal shiftwidth=8 tabstop=8 noexpandtab autoindent

set noerrorbells visualbell t_vb=

" remember last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

highlight LineNr ctermfg=242 ctermbg=235
highlight lCursor ctermbg=Cyan
highlight Cursor ctermbg=242
highlight iCursor ctermbg=Cyan
hi Normal ctermbg=234
highlight MatchParen  cterm=bold ctermfg=87 ctermbg=238

" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI .= "\<Esc>[6 q"
    let &t_EI .= "\<Esc>[2 q"
    autocmd VimLeave * silent !echo -ne "\033[0 q"
endif

" status bar colors
au InsertEnter * hi statusline ctermfg=black ctermbg=yellow
au InsertLeave * hi statusline ctermfg=black ctermbg=cyan
hi statusline ctermfg=black ctermbg=red
	
" window split bar
hi VertSplit ctermbg=green ctermfg=black  


" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'Normal·Operator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'V·Line',
    \ '^V' : 'V·Block',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '^S' : 'S·Block',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}

hi User1 ctermbg=8 ctermfg=0
hi User2 ctermbg=8 ctermfg=72
hi User3 ctermbg=8 ctermfg=74

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %{toupper(mode())}\  							" The current mode
set statusline+=%2*
set statusline+=%1n																			" buffer number: at least 1 char
set statusline+=\ 																		
"set statusline+=\ <%3b>																	" char code in dec
set statusline+=\ <0x%02B>																" char code in hex 
set statusline+=\ col:%02c																" col %c / %v
set statusline+=\ [%2l/%2L:%2p%%]													" line / total lines : percentage
set statusline+=\ [%04o]																	" offset in file

set statusline+=%=                                       " Right Side
set statusline+=%3*
set statusline+=<
"set statusline+=\ %20.40f																" file name
set statusline+=\ %f																		" file name
set statusline+=>
set statusline+=\ %m																		" modified
set statusline+=\ %r																		" readonly
set statusline+=%2*
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}     	" Encoding
set statusline+=\ %{&ff}                               	" FileFormat (dos/unix..)
set statusline+=\ %y																		" file type

set statusline+=|
set statusline+=%0*\ %{toupper(mode())}\  " The current mode


" vim diff colors
if &diff
    syntax off
endif
highlight DiffAdd    cterm=bold ctermfg=2 ctermbg=234 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=1 ctermbg=234 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=none ctermfg=none ctermbg=234 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=3 ctermbg=234 gui=none guifg=bg guibg=Red

:hi Folded ctermfg=245 ctermbg=235
