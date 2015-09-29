execute pathogen#infect()

" Nice post: http://dougblack.io/words/a-good-vimrc.html
						
:set clipboard=unnamed

" Leader mapping {{{
:let mapleader = ","							" Default is \
inoremap jk <esc>								" jk is esc
nnoremap <leader>u :GundoToggle<CR>				" toggle gundo
nnoremap <leader>t :NERDTreeToggle<CR>			" toggle nerdtree
" }}}

" UI Config {{{
syntax enable									" Enable syntax processing
" set background=dark
" colorscheme solarized							" Set the colour scheme

:set laststatus=2
" ::set statusline=%f         " Path to the file
" :set statusline+=\ :\      " Separator
" :set statusline+=%y        " Filetype of the file
" :set statusline+=%=        " Switch to the right side
" :set statusline+=%3l    " Current line
" :set statusline+=/    " Separator
" :set statusline+=%3L   " Total lines
" }}}

" Tabs {{{
set tabstop=4									" number of visual spaces per TAB
set softtabstop=4								" number of spaces in tab when editing
" set expandtab									" tabs are spaces
" }}}

" Visual Elements {{{
set number										" show line numbers
nmap <leader>tn :call ToggleNumber()<CR>		" toggle number
set showcmd										" show command in bottom bar
set cursorline									" highlight current line
filetype plugin indent on						" load filetype-specific indent files ~/.vim/indent/python.vim
set wildmenu									" visual autocomplete for command menu
set lazyredraw									" redraw only when we need to.
set showmatch									" highlight matching [{()}]
" }}}

" Search {{{
set incsearch									" search as characters are entered
set hlsearch									" highlight matches
nnoremap <leader><space> :nohlsearch<CR>		" turn off search highlight
" }}}

" Folding {{{
set foldenable									" enable folding
set foldlevelstart=10							" open most folds by default
set foldnestmax=10								" 10 nested fold max
nnoremap <space> za								" map folding to space
set foldmethod=indent							" fold based on indent level
" }}}

" Movement {{{
" " move vertically by visual line
nnoremap j gj
nnoremap k gk
" " move to beginning/end of line
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
" " highlight last inserted text
nnoremap gV `[v`]
" }}}

" Custom Function {{{

" toggle between number and relativenumber
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
" }}}

set modelines=1
" vim:foldmethod=marker:foldlevel=0
