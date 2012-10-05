"== Bundle Basic Settings
"=> Install Command
"=> $ git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"== Bundle plugins
Bundle 'gmarik/vundle'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'sgur/unite-git_grep'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/grep.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/buftabs'
Bundle 'vim-scripts/yanktmp.vim'
Bundle 'vim-scripts/SQLUtilities'
Bundle 'vim-scripts/Align'
Bundle 'msanders/snipmate.vim'
"Bundle 'quickhl.vim'
"Bundle 'autoclose'
"Bundle 'winreseizer'
'
"-- Move Cursor plugin
Bundle 'Lokaltog/vim-easymotion'
Bundle 'edsono/vim-matchit'
"-- File manipiration plugin
Bundle 'fukajun/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/mru.vim'
Bundle 'vim-scripts/spinner.vim'
"-- Execute command in vim
"Bundle 'thinca/vim-quickrun'
"-- for Ruby
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-fugitive'
"Bundle 'tpope/vim-rails'
"Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'csexton/rvm.vim'
Bundle 'ujihisa/rdoc.vim'
Bundle 't9md/vim-foldtext'
"-- color schemas
Bundle 'jpo/vim-railscasts-theme'
Bundle 'flazz/vim-colorschemes'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ColorSchemeMenuMaker'
Bundle 'desert-warm-256'
Bundle 'gmarik/ingretu'
Bundle 'tomasr/molokai'
"-- not use
"Bundle 'Shougo/vimshell'
"Bundle 'Shougo/vimproc'
"Bundle 'Shougo/vimfiler'
"Bundle 'scrooloose/nerdtree'
"Bundle 'project.vim'
"Bundle 'refe.vim'
"Bundle 'opsplorer'
"Bundle 'tsukkee/lingr-vim'
"Bundle 'daisuzu/facebook.vim'
"Bundle 'mattn/webapi-vim'
"Bundle 'tyru/open-browser.vim'

"== For CoffeeScript
syntax enable
filetype plugin indent on

"== For NERDTree
nnoremap <silent> <C-]> :<C-u>:NERDTreeToggle<CR>
"autocmd bufleave * if (exists("b:NERDTreeType") && b:NERDTreeType == "primary") | exe "NERDTreeToggle" | endif

"== For Unite.vim
let g:unite_enable_start_insert=1
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> <C-p> :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
"nnoremap <silent> <C-n> :<C-u>UniteWithBufferDir -buffer-name=file_mru bookmark <CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')<C-w>L
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" GIT GREPを開く
noremap <silent> ,ug :<C-u>Unite grep::-iHRn -direction=botright<CR>
"nnoremap <silent> ,ug :<C-u>Unite<space>vcs_grep/git<CR>
" セッション管理
nnoremap <silent> ,uss <C-w>t:<C-u>UniteSessionSave<CR>
nnoremap <silent> ,usl :<C-u>UniteSessionLoad<CR>

"== For ctrlp.vim settings
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_map = '<c-n>'
let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn)$'
"nnoremap <silent> <C-n> :<C-u>CtrlPMRUFiles<CR>

"== For yanktmp settings
map <silent> sy :call YanktmpYank()<CR> 
map <silent> sp :call YanktmpPaste_p()<CR> 
map <silent> sP :call YanktmpPaste_P()<CR>

"== コピペ
noremap [MyPrefix] <Nop>
map <Space> [MyPrefix]
" クリップボードの内容を名前付きレジスタに逃がす
nnoremap [MyPrefix]" :<C-u>let @y=@*<CR>
" 名前付きレジスタからペースト
nnoremap [MyPrefix]p "yp
nnoremap [MyPrefix]P "yP
vnoremap [MyPrefix]p "yp
vnoremap [MyPrefix]P "yP

"== For Grep.vim
nnoremap <silent> <F3> :Grep<CR>
nnoremap <silent> <F4> :Rgrep<CR>

"== For Neocomplcache
"= Need this plugins
"=  'Shougo/neocomplcache'
"=  'Shougo/neocomplcache-snippets-complete'
set completeopt=menuone
let g:neocomplcache_next_keyword_patterns = {}
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 40
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif

"== For EasyEmotion
let g:EasyMotion_leader_key = '_'
nmap <Leader> H:<C-U>call EasyMotion#F(0, 0)<CR>

"== Vim Editor Mapping
nmap <Space>b :ls<CR>:buffer<CR>
nmap <Space>f :edit .<CR>
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer<CR>
nmap <Space>V :Vexplore!<CR><CR>
noremap <expr> gm (virtcol('$')/2).'\|'
"-- move back after visual yank
vnoremap y y'>
inoremap jj <Esc>

"==  Vim Editor Setting
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

"==  Display tab multibyte space
set lcs=tab:>.,trail:_,extends:\
set list
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
autocmd BufRead,BufNew * match JpSpace /　/

"==  Cursor line
setlocal cursorline

"==  Status line
" ステータスラインの表示
  set statusline+=[%n%{bufnr('$')>1?'/'.bufnr('$'):''}%{winnr('$')>1?':'.winnr().'/'.winnr('$'):''}]
  set statusline=%<     " 行が長すぎるときに切り詰める位置
  set statusline+=[%n]  " バッファ番号
  set statusline+=%m    " %m 修正フラグ
  set statusline+=%r    " %r 読み込み専用フラグ
  set statusline+=%h    " %h ヘルプバッファフラグ
  set statusline+=%w    " %w プレビューウィンドウフラグ
  set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}  " fencとffを表示
  set statusline+=%y    " バッファ内のファイルのタイプ
  set statusline+=\     " 空白スペース
if winwidth(0) >= 130
  set statusline+=%F    " バッファ内のファイルのフルパス
else
  set statusline+=%t    " ファイル名のみ
endif
  set statusline+=%=    " 左寄せ項目と右寄せ項目の区切り
  set statusline+=%{fugitive#statusline()}  " Gitのブランチ名を表示
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%1l   " 何行目にカーソルがあるか
  set statusline+=/
  set statusline+=%L    " バッファ内の総行数
  set statusline+=,
  set statusline+=%c    " 何列目にカーソルがあるか
  set statusline+=%V    " 画面上の何列目にカーソルがあるか
  set statusline+=\ \   " 空白スペース2個
  set statusline+=%P    " ファイル内の何％の位置にあるか

"== Remember last open curor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

"== for Fugitive.vim
nnoremap <silent> ,gst :<c-u>Gstatus<CR>

"== for Quickfix Controlle
" Fallback
nnoremap Q q
nnoremap q  <Nop>
" For quickfix list
nnoremap qj  :cnext<Return>
nnoremap qk  :cprevious<Return>

"== auto adding quickfix to vimgrep
au QuickfixCmdPost vimgrep cw

"== IndentGuide Setting
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=none ctermbg=none
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

"== 256 Color mode
if stridx($TERM, "xterm-256color") >= 0
  set t_Co=256
else
  set t_Co=16
endif

"== Color schema
colorscheme wombat256mod
"colorscheme molokai
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

"==  Matchpare Color
hi MatchParen term=standout ctermbg=LightGrey ctermfg=Black guibg=LightGrey guifg=Black

"== Custome Mapping
command! VimrcReload :source ~/.vimrc
