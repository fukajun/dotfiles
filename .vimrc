"## Bundle Basic Settings
"## Install Command
"## $ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"## 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"## Bundle plugins
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimfiler'
Bundle 'sgur/unite-git_grep'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/grep.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'kchmck/vim-coffee-script'
Bundle 'opsplorer'
Bundle 'fukajun/nerdtree'
Bundle 'vim-scripts/buftabs'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/yanktmp.vim'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'vim-scripts/spinner.vim'
"Bundle 'kien/ctrlp.vim'
"Execute command in vim
"Bundle 'thinca/vim-quickrun'
"-- for Ruby
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'csexton/rvm.vim'
Bundle 'ujihisa/rdoc.vim'
Bundle 'tools/migemo.vim'
Bundle 't9md/vim-foldtext'
"Bundle 'vim-scripts/YankRing.vim'
"-- color schemas
Bundle 'jpo/vim-railscasts-theme'
Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ColorSchemeMenuMaker'
Bundle 'desert-warm-256'
Bundle 'gmarik/ingretu'
Bundle 'tomasr/molokai'
"-- not use
"Bundle 'scrooloose/nerdtree'
"Bundle 'project.vim'
"Bundle 'refe.vim'
"-- play box
Bundle 'tsukkee/lingr-vim'

syntax enable
filetype plugin indent on

noremap <silent> ,ug :<C-u>Unite grep::-iHRn -direction=botright<CR>

source $VIMRUNTIME/macros/matchit.vim


"## Unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> <C-p> :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
" Yank ヒストリー
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> <C-n> :<C-u>UniteWithBufferDir -buffer-name=file_mru bookmark <CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')<C-w>L
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" UNIT GIT GREPを開く
"nnoremap <silent> ,ug :<C-u>Unite<space>vcs_grep/git<CR>
" ファイル一覧
nnoremap <silent> ,uss <C-w>t:<C-u>UniteSessionSave<CR>
nnoremap <silent> ,usl :<C-u>UniteSessionLoad<CR>


"## コピペ
noremap [MyPrefix] <Nop>
map <Space> [MyPrefix]
" クリップボードの内容を名前付きレジスタに逃がす
nnoremap [MyPrefix]" :<C-u>let @y=@*<CR>
" 名前付きレジスタからペースト
nnoremap [MyPrefix]p "yp
nnoremap [MyPrefix]P "yP
vnoremap [MyPrefix]p "yp
vnoremap [MyPrefix]P "yP

"## Grep.vim
nnoremap <silent> <F3> :Grep<CR>
nnoremap <silent> <F4> :Rgrep<CR>

"## Linger setting
"let g:lingr_vim_user = "fukajuns.shark@gmail.com"
"let g:lingr_vim_password = "sasakama"

"## Neocomplcache
set completeopt=".menuoeb"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 30
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_enable_ignore_case = 0
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

"## EasyEmotion
let g:EasyMotion_leader_key = '_'
nmap <Leader> H:<C-U>call EasyMotion#F(0, 0)<CR>


"## Vim Editor Mapping
nmap <Space>b :ls<CR>:buffer<CR>
nmap <Space>f :edit .<CR>
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer<CR>
nmap <Space>V :Vexplore!<CR><CR>
noremap <expr> gm (virtcol('$')/2).'\|'
"-- move back after visual yank
vnoremap y y'>
inoremap jj <Esc>


"## Vim Editor Setting
set tabstop=2
set shiftwidth=2
set expandtab
set number
set nohlsearch
set clipboard=unnamed
set directory=~/.vim/tmp
set hidden
set autoindent
set ignorecase
set incsearch
highlight CursorIM guibg=DarkGreen guifg=NONE ctermbg=DarkGreen ctermfg=NONE


"## Display tab multibyte space
set lcs=tab:>.,trail:_,extends:\
set list
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
autocmd BufRead,BufNew * match JpSpace /　/


"## Cursor line
setlocal cursorline


"## Startup enbale nerdtree
"autocmd vimenter * :NERDTree


"## Remember last open curor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


"## IndentGuide Setting
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=none ctermbg=none
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1


"## 256 Color mode
if stridx($TERM, "xterm-256color") >= 0
  set t_Co=256
else
  set t_Co=16
endif


"## Vim Filer
nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }                     
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)


"## Color schema
"--- like
<<<<<<< HEAD
=======
"colorscheme wombat256mod
>>>>>>> update vimrc
colorscheme molokai
"colorscheme railscasts
"colorscheme ingretu
"colorscheme desert-warm-256
"colorscheme solarized
"--- Solarized Setting
"set background=dark
"let g:solarized_termcolors=256
"--- not like
"colorscheme desert
"colorscheme peachpuff
"colorscheme morning
"colorscheme evening
"colorscheme elflord
"colorscheme pablo
"colorscheme blue
"colorscheme darkblue

"## Matchpare Color
hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black
