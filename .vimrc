set nocompatible
set shiftwidth=4
set wrap
"set smarttab
"set tw=80

" always show a status line at the bottom, similar to when using Ctrl-G
"set laststatus=2

syntax on
"set number
set background=dark
"set background=light
set hlsearch

set autoindent
set ruler
set tabstop=4
set expandtab

inoremap /* /*  */<ESC>hhi
inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
inoremap " ""<ESC>ha
inoremap ' ''<ESC>ha
inoremap { {}<ESC>ha
inoremap [ []<ESC>ha

inoremap ( ()<ESC>:let leavechar=")"<CR>i
imap <C-j> <ESC>:exec "normal f" . leavechar<CR>a

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
map <C-n> :set number<CR>
map <C-m> :set nonumber<CR>

" Ctrl-l to set file highlighting to system logs
map <C-l> :set filetype=messages<CR>

" Macros
function! Manpage()
       execute "!man " . expand("<cword>")
endfunction

map <F8> : call Manpage()<CR><CR>
map! <F8><ESC>: call Manpage()<CR><CR>a

" use _( to bracket previously visually selected text.
vnoremap _( <ESC>`>a)<ESC>`<i(<ESC>

" highlight lines longer than 80 characters
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

map <C-p> :match ErrorMsg '\%>80v.\+'<CR>
map <C-o> :match<CR>
" turn highlight of overlength lines on by default:
":match ErrorMsg '\%>80v.\+'

" Highlight trailing whitespace:
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
:match ExtraWhitespace /\s\+$/

" log files syntax highlighting:

" This creates a keyword ERROR and puts it in the highlight group called logError
:syn keyword logError ERROR
:syn keyword logDEBUG DEBUG
:syn keyword logINFO INFO
" This creates a match on the date and puts in the highlight group called logDate.  The
" nextgroup and skipwhite makes vim look for logTime after the match
:syn match logDate /^\d\{4}-\d\{2}-\d\{2}/ nextgroup=logTime skipwhite

" This creates a match on the time (but only if it follows the date)
:syn match logTime /\d\{2}:\d\{2}:\d\{2},\d\{3}/

" Now make them appear:
" Link just links logError to the colouring for error
hi link logError Error
hi link logDebug Debug
hi link logINFO Comment

" automatically break up lines that are more than 80 characters
"setlocal textwidth=80
" F4 to grep for word under cursor
map <F4> :execute " grep -srnw --exclude=tags --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>)

"" Backup and undo settings
set backupdir=~/.vim/backup//  "location of backups
set directory=~/.vim/tmp//     "location of swap files
set dir=~/.vim/tmp//           "location of swap files
set undofile
set undodir=~/.vim/undodir//
set undolevels=1000            "maximum number of changes that can be undone
set undoreload=1000            "maximum number lines to save for undo on a buffer reload

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>


let hlstate=0
nnoremap <C-h> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" Break up ssapp exception tracebacks
map <F2> :%s/\#012/\r/g<CR>

" tags shortcut:
" Ctrl-\ Open the definition in a new vertical split
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

set cursorcolumn
set cursorline
