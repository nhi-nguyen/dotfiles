"set gfn=DejaVu\ Sans\ Mono\ 9
"set gfn=Consolas\ 11
set gfn=Monospace\ 10

set lines=65
set mousehide		" Hide the mouse when typing text
set wrap
set background=dark
set expandtab
"set columns=161 " Two panes, 80 columns each
set columns=100

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Switching buffer mapping:
:map <C-Tab> :bn<CR>
:map <C-S-Tab> :bp<CR>

" setting colors:
hi Normal   guibg=Black guifg=#FFEBCD gui=bold
hi Special  guifg=#DDA0DD gui=bold guibg=Black
hi Operator guifg=#CA9510 gui=bold guibg=Black
hi NonText  guibg=Black guifg=#FFDAB9 gui=bold
hi Cursor   guibg=Red guifg=White gui=bold
hi Comment  guifg=#87CEEB gui=NONE guibg=Black
hi Visual 	guifg=#7070FF

