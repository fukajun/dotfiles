"------------------------------------------------------------------------
" Install NeoBundle
" $ mkdir -p ~/.vim/bundle
" $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"------------------------------------------------------------------------
set nocompatible
"== Bundle plugins
if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
"------------------------------------------------------------------------
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-rsense'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'sgur/unite-git_grep'
NeoBundle 'taka84u9/unite-git'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/buftabs'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'vim-scripts/SQLUtilities'
NeoBundle 'vim-scripts/Align'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'lucapette/vim-ruby-doc'
NeoBundle 'osyo-manga/unite-quickfix'
"-- Move Cursor plugin
NeoBundle 'edsono/vim-matchit'
"-- File manipiration plugin
NeoBundle 'fukajun/nerdtree'
NeoBundle 'vim-scripts/mru.vim'
NeoBundle 'vim-scripts/spinner.vim'
"-- Execute command in vim
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'kana/vim-altr'
"-- For Ruby
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'csexton/rvm.vim'
NeoBundle 'ujihisa/rdoc.vim'
"-- Color schemas
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ColorSchemeMenuMaker'
NeoBundle 'desert-warm-256'
NeoBundle 'gmarik/ingretu'
NeoBundle 'tomasr/molokai'

filetype plugin indent on 
NeoBundleCheck

"##
"## For Plugin settings
"##
"
"== For CoffeeScript
syntax enable
filetype plugin indent on

"== For NERDTree
nnoremap <silent> <C-]> :<C-u>:NERDTreeToggle<CR>
autocmd bufleave * if (exists("b:NERDTreeType") && b:NERDTreeType == "primary") | exe "NERDTreeToggle" | endif

"== For Unite.vim
let g:unite_enable_start_insert=1
" buffers
nnoremap <silent> <C-p> :<C-u>Unite buffer<CR>
" file list
"nnoremap <silent> <C-n> :<C-u>Unite -buffer-name=files git_modified git_untracked git_cached buffer file_mru bookmark file -auto-preview<CR>
nnoremap <silent> <C-n> :<C-u>Unite -buffer-name=files git_modified git_untracked git_cached buffer file_mru bookmark file <CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')<C-w>L
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

"== For Grep.vim
nnoremap <silent> <F3> :Grep<CR>
nnoremap <silent> <F4> :Rgrep<CR>

"== For Neocomplecache
" 補完・履歴 neocomplcache "{{{
set infercase
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
 
" default config"{{{
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache#sources#rsense#home_directory = "$RSENSE_HOME"
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_skip_auto_completion_time = '0.3'
"}}}
 
" keymap {{{
imap <expr><C-g>     neocomplcache#undo_completion()
imap <expr><CR>      neocomplcache#smart_close_popup() . "<CR>" . "<Plug>DiscretionaryEnd"
imap <silent><expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
" imap <silent><expr><TAB>   pumvisible() ? "\<C-N>" : "\<TAB>"
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_jump_or_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" }}}
"}}}

"== for Fugitive.vim
"nnoremap <silent> <C-@> :<c-u>Gstatus<CR>
nnoremap <silent> <C-@> :call<Space>ToggleGstatus()<CR>
function! ToggleGstatus()
  if bufexists(".git/index")
    execute "bw .git/index"
  else
    execute "Gstatus"
  endif
endfunction

"== For toggle case vim {{{
nnoremap <silent> <C-k> :<C-u>call<Space>ToggleCase()<CR>
"}}}

"== For vim-alter {{{
nmap <F3> <Plug>(altr-forward)
nmap <F2> <Plug>(altr-back)
" For ruby tdd
call altr#define('%.rb', 'spec/%_spec.rb')
" For rails tdd
call altr#define('app/models/%.rb', 'spec/models/%_spec.rb', 'spec/factories/%s.rb')
call altr#define('app/controllers/%.rb', 'spec/controllers/%_spec.rb')
call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')
"}}}


"== For quickrun {{{
nnoremap <space>r :QuickRun <CR>

let g:quickrun_config = {}
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'exec': 'bundle exec %c %s'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'exec': '%c %s'
  \}
function! RSpecQuickrun()
    let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction
autocmd BufReadPost *_spec.rb call RSpecQuickrun()
"}}}

"######################
"#  For Vim settings
"######################

"==  Vim Editor Setting
set visualbell
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

"== User function
function! FormatCode()
  execute "%s/  *$//"
  execute "%s/　/ /g"
endfunction

"== User key mapping
nmap <Space>b :ls<CR>:buffer<CR>
nmap <Space>f :edit .<CR>
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer<CR>
nmap <Space>V :Vexplore!<CR><CR>
nmap <Space>ds :<C-u>call<Space>FormatCode()<CR>
nmap <Space>"" :<C-u>s/"/'/g<CR>
nmap <Space>dpp :<C-u>s/.tapp//g<CR>
inoremap jj <Esc>
"-- for visual mode paste
vnoremap <C-p> <Nop>
vnoremap <C-p> "0p<CR>

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

"== For Quickfix Controlle
" For quickfix list
nnoremap <space>j  :cnext<Return>
nnoremap <space>k  :cprevious<Return>

"== Auto adding quickfix to vimgrep
au QuickfixCmdPost vimgrep cw

"== IndentGuide Setting
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=none ctermbg=none
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1

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
