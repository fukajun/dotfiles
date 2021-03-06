"-------------------------------- memo ---------------------------------
" zi  折り畳みの有効無効の切り替え
" zf  折り畳みを作成する
" za  折り畳みの開け閉め
" zd  折り畳みを削除する

" 時々使うコマンド
" zA  折り畳みの開け閉め（再帰）
" zD  折り畳みを削除する（再帰）
" zE  全ての折り畳みを削除
" zR  全ての折り畳みを開く
" zM  全ての折り畳みを閉じる
"------------------------------------------------------------------------
" Setup
" $ mkdir -p ./.vim/tmp
"------------------------------------------------------------------------
" Install NeoBundle
" $ mkdir -p ~/.vim/bundle
" $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"------------------------------------------------------------------------
" CUI版からクリップボード使う(fakeclipプラグインいるよ)
" $ brew install reattach-to-user-namespace
" $ echo 'set-option -g default-command "reattach-to-user-namespace -l zsh"' >> ~/.tmux.conf
"------------------------------------------------------------------------
" vimprocのコンパイル
" $ cd ~/.vim/bundle/vimproc/
" $ make
"------------------------------------------------------------------------
"------------------------------------------------------------------------
" init all settings
"------------------------------------------------------------------------
set all&
autocmd!

"------------------------------------------------------------------------
" NeoBundle Settings
"------------------------------------------------------------------------
 " Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif
 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif
   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif
 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))
 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 call neobundle#end()
NeoBundle 'Shougo/vimproc'
"------------------------------------------------------------------------
"-- File Unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'taka84u9/unite-git'
NeoBundle 'sgur/unite-git_grep'
NeoBundle 'fukajun/unite-actions'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'basyura/unite-rails'
NeoBundle 'tacroe/unite-mark'
"NeoBundle 'osyo-manga/vim-over'
"NeoBundle 'ujihisa/unite-colorscheme'
"NeoBundle 'h1mesuke/unite-outline'
"NeoBundle 'osyo-manga/unite-toggle-options.git'
"NeoBundle 'tyru/unite-screen.sh'
"-- Other plugin
NeoBundle "vim-scripts/SQLUtilities"
NeoBundle "kana/vim-arpeggio"
"NeoBundle "kana/vim-smartinput"
NeoBundle "cohama/vim-smartinput-endwise"
NeoBundle "vim-scripts/Align"
NeoBundle "scrooloose/syntastic"
NeoBundle "Shougo/neosnippet-snippets"
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neocomplcache-rsense'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'miripiruni/CSScomb-for-Vim'
NeoBundle 'kana/vim-fakeclip.git'
"NeoBundle 'bling/vim-airline'
"-- File manupiration plugin
NeoBundle 'fukajun/nerdtree'
NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'airblade/vim-gitgutter'
"-- Execute command in vim
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'kana/vim-altr'
NeoBundle 'Blackrush/vim-gocode'
"-- For Ruby
NeoBundle "skwp/vim-rspec.git"
NeoBundle 'tpope/vim-haml'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'csexton/rvm.vim'
NeoBundle 'ujihisa/rdoc.vim'
NeoBundle 'hallison/vim-markdown'
"-- require 'gem install rails_best_practices',
NeoBundle 'romanvbabenko/rails.vim'
"install errror NeoBundle 'taichouchou2/unite-rails_best_practices',
"-- require 'gem install reek',
"install error NeoBundle 'taichouchou2/unite-reek'
"-- Color schemas
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ColorSchemeMenuMaker'
NeoBundle 'desert-warm-256'
NeoBundle 'gmarik/ingretu'
NeoBundle 'tomasr/molokai'
NeoBundle 'szw/vim-tags'
NeoBundleCheck

filetype plugin indent on

"------------------------------------------------------------------------
" Vim initialize
"------------------------------------------------------------------------
""""
augroup MyAutocmd
  autocmd!
augroup END
syntax enable

command!
  \ -bang -nargs=*
  \ MyAutocmd
  \ autocmd<bang> vimrc <args>

let mapleader = " "


"------------------------------------------------------------------------
" For custom function
"------------------------------------------------------------------------

"------------------------------------------------------------------------
" For custom settings
"------------------------------------------------------------------------
" Don't exit vim when closing last tab with :q and :wq, :qa, :wqa
"cabbrev q   <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 && tabpagenr('$') == 1 && winnr('$') == 1 ? 'enew' : 'q')<CR>
"cabbrev wq  <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 && tabpagenr('$') == 1 && winnr('$') == 1 ? 'w\|enew' : 'wq')<CR>
"cabbrev qa  <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'tabonly\|only\|enew' : 'qa')<CR>
"cabbrev wqa <C-r>=(getcmdtype() == ':' && getcmdpos() == 1 ? 'wa\|tabonly\|only\|enew' : 'wqa')<CR>
command! -nargs=0 Acopy :norm ggVG"+y 

"------------------------------------------------------------------------
" For Plugin settings
"------------------------------------------------------------------------
" == For vim-smartinput-endwise{{{
"call smartinput_endwise#define_default_rules()
" }}}


" == For CoffeeScript {{{
filetype plugin indent on
"}}}


" == For NERDTree {{{
nnoremap <silent> <C-]> :<C-u>:NERDTreeToggle<CR>
autocmd bufleave * if (exists("b:NERDTreeType") && b:NERDTreeType == "primary") | exe "NERDTreeToggle" | endif
let g:NERDTreeWinSize = 60
"}}}


" == For Unite.vim {{{
let g:unite_enable_start_insert=1
call unite#custom_source('file_mru',    'max_candidates', 5)
call unite#custom_source('git_cached ', 'max_candidates', 10000)

" ==== Command
"noremap <silent> <leader>lc :<C-u>Unite command mapping<CR>
" ==== Buffers
nnoremap <silent> <C-p> :<C-u>Unite buffer<CR>
" ==== Outline
nnoremap <silent> <Leader>; :<C-u>Unite outline<CR>
" ==== Mark
nnoremap <silent> <Leader>: :<C-u>Unite mark<CR>
" ==== File list
nnoremap <silent> <C-n> :<C-u>Unite -buffer-name=files git_modified git_untracked file_mru git_cached buffer bookmark file <CR>
"nnoremap <silent> <C-n> :<C-u>Unite -buffer-name=files git_modified git_untracked git_cached buffer file_mru bookmark file -auto-preview<CR>
"nnoremap <silent> <C-n> :<C-u>Unite -buffer-name=files git_modified git_untracked git_cached buffer file_mru bookmark file <CR>
nnoremap <silent> <Leader>i :<C-u>UniteWithBufferDir -buffer-name=files file git_modified git_untracked file_mru git_cached buffer bookmark file <CR>
nnoremap <silent> <Leader>i :<C-u>UniteWithBufferDir -buffer-name=files file git_modified git_untracked file_mru git_cached buffer bookmark file <CR>
" ===== Unite-rails
"noremap :rc :<C-u>Unite rails/controller<CR>
"noremap :rm :<C-u>Unite rails/model<CR>
"noremap :rv :<C-u>Unite rails/view<CR>
"noremap :rg :<C-u>Unite rails/bundled_gem<CR>
"" ===== Unite-grep
function! UniteGrepGitRepo()
  let git_home = system('git rev-parse --show-toplevel')[0:-2]
  let cmd = "Unite grep:" . git_home . "::"
  execute cmd
endfunction
nnoremap <leader>f :<C-u>call UniteGrepGitRepo()<CR>
nnoremap <leader>g :<C-u>Unite grep:.::<CR>
nnoremap <leader>h :<C-u>Unite grep:$GEM_HOME/gems/*<CR>
nnoremap <leader>b :<C-u>Unite grep:$GEM_HOME/bundler/*<CR>
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = ' --nocolor --silent --nogroup -i --ignore=''(min.js|.png|log|tmp)'' -U '
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates = 100
" ==== Unite-actions {{

let g:unite_source_actions = {
      \ "Shell"                     : "VimShell",
      \ "Git gutter toggle"         : "GitGutterToggle",
      \ "Unite toggle-options"      : "Unite toggle-options",
      \ "Edit vimrc"                : "vs ~/.vimrc",
      \ "Reload vimrc"              : "source ~/.vimrc",
      \ "Edit memo"                : "vs ~/notes/memo.md",
      \ "Reset viminfo"             : "vs ~/.viminfo|g/^-'/d|w",
      \ "Toggle number"             : "set invnumber",
      \ "Use zeus"                  : "UseZeus",
      \ "Inclement"                 : "execute('norm ywjdw\"0P')",
      \ "Delete tapp"               : "execute('%s/.tapp//gc')",
      \ "Show buffer"               : "ls<CR>:buffer<CR>",
      \ "Unite bundled_gem"         : "Unite rails/bundled_gem",
      \ "Unite command"             : "Unite command mapping",
      \ "Formt code Truncate space" : "call FormatCode()",
      \ "Create spec file"          : "call CreateSpecFile()",
      \ "Edit Snippet for ruby"     : "vs ~/.vim/snippets/ruby.snip",
      \ "_Set paste"                : "set paste",
      \ "_Set nopaste"              : "set nopaste",
      \ "Bundle db:resetup full"    : "echo 'bundle exec rake db:resetup; bundle exec rake import:suppliers; bundle exec rake import:items; bundle exec rake db:setup RAILS_ENV=test'",
      \ "Git log"                   : "!git ll",
      \ "Unite reek"                : "Unite reek",
      \ "Unite rails_best_practices": "Unite rails_best_practices",
      \ "cd $GEM_HOME"              : "cd $GEM_HOME",
      \ "cd spree_core"             : "cd $GEM_HOME/gems/spree_core-1.2.2/",
      \ "edit m emo"                : "vs ~/dotfiles/memo.md",
      \ "CMD migrate reset"         : "execute('VimShellExecute rake db:migrate:reset -e test')",
      \ }

nnoremap <silent> <leader>l :Unite actions<CR>
""}}
" ==== Keymap when Open
au FileType unite nnoremap <silent> <buffer> <expr> <C-b> unite#do_action('mark candidate')
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')<C-w>L
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
"au FileType unite imap <silent> <buffer> <C-b> <C-n><Plug>(unite_toggle_mark_current_candidate_up)<Plug>(unite_toggle_mark_current_candidate)<Plug>(unite_toggle_mark_current_candidate)<C-p>
au FileType unite imap <silent> <buffer> <C-b> <C-n><Plug>(unite_toggle_mark_current_candidate_up)<Space><Plug>(unite_toggle_mark_current_candidate_up)<C-n>

"}}}

" == For neosnippet {{{
imap <C-k> <Plug>(neosnippet_expand_or_jump)
"nmap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=1 concealcursor=i
endif
"}}}


" == For Grep.vim {{{
nnoremap <silent> <F3> :Grep<CR>
nnoremap <silent> <F4> :Rgrep<CR>
"}}}


" == For Neocomplecache {{{
" 補完・履歴 neocomplcache
set infercase
" neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 40
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_enable_ignore_case = 0
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0

" default config"{{{
let g:neocomplcache_force_overwrite_completefunc = 1
"let g:neocomplcache#sources#rsense#home_directory = '/Users/fukajun/lib/rsense-0.3'
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_skip_auto_completion_time = '0.5'
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'
let g:neocomplcache_omni_patterns.ruby = ''
"}}}

" keymap {{{
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
nnoremap / /\v
" }}}
"}}}

" == For Tabular.vim {{{
" =
nmap <leader># :Tabularize /#<CR>
vmap <leader># :Tabularize /#<CR>
" =
nmap <leader>= :Tabularize /=<CR>
vmap <leader>= :Tabularize /=<CR>
" |
nmap <leader>a :Tabularize /\|<CR>
vmap <leader>a :Tabularize /\|<CR>
"}}}


" == For Fugitive.vim {{{
function! ToggleGstatus()
  if bufexists(".git/index")
    execute "bw .git/index"
  else
    execute "Gstatus"
  endif
endfunction
nnoremap <silent> <C-@> :call<Space>ToggleGstatus()<CR><C-w>H<CR>
command! -nargs=0 Gadd :norm :Gwrite<CR>:w<CR>
"}}}


" == For toggle case vim {{{
"nnoremap <silent> <C-k> :<C-u>call<Space>ToggleCase()<CR>
"}}}


" == For vim-alter {{{
"nmap <C-l> <Plug>(altr-forward)
nmap <C-h> <Plug>(altr-back)
" For ruby tdd
call altr#define('%.rb', 'spec/%_spec.rb')
" For rails tdd
"call altr#define('app/models/%.rb', 'spec/models/%_spec.rb', 'spec/factories/%s.rb')
call altr#define('app/models/%.rb', 'spec/models/%_spec.rb')
call altr#define('app/controllers/%.rb', 'spec/controllers/%_spec.rb')
call altr#define('app/helpers/%.rb', 'spec/helpers/%_spec.rb')
call altr#define('app/views/%.html.haml', 'app/views/%.mobile.haml')
call altr#define('spec/features/search_spec.rb', 'spec/features/mobile/search_spec.rb')
"}}}

" == For AnsiEsc {{{
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデント設定
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
" オートコンパイル
  "保存と同時にコンパイルする
"""autocmd BufWritePost *.coffee silent make! 
  "エラーがあったら別ウィンドウで表示
autocmd QuickFixCmdPost * nested cwindow | redraw! 
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
function! AutoCoffeeCompile()
  autocmd BufWritePost *.coffee silent make!
endfunction
command! -nargs=0 StartAutoCoffeeCompile call AutoCoffeeCompile()
"}}}

" == For AnsiEsc {{{
autocmd FileType quickrun AnsiEsc
"}}}


" == For quieck run {{{
nnoremap <leader>r :QuickRun <CR>
"nnoremap <leader>r :QuickRun >> buffer -mode v<CR>

let g:quickrun_config = {}
let g:quickrun_config._ = {
  \ 'runner' : 'vimproc',
  \ 'runner/vimproc/updatetime' : 250
  \ }

" For rspec
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'outputter': 'buffer',
  \ 'exec': 'bundle exec %c --drb --tty --format d --color %s%o'
  \}
let g:quickrun_config['rspec/zeus'] = {
  \ 'type': 'rspec/zeus',
  \ 'command': 'zeus',
  \ 'outputter': 'buffer',
  \ 'exec': 'pwd;bundle exec %c rspec --tty --format d --color %s%o'
  \}
let g:quickrun_config['rspec/spring'] = {
  \ 'type': 'rspec/spring',
  \ 'command': 'spring',
  \ 'outputter': 'buffer',
  \ 'exec': 'pwd;bundle exec %c rspec --tty --format d --color %s%o'
  \}

" For Cucumber
let g:quickrun_config['cucumber/bundle'] = {
  \ 'type': 'cucumber/bundle',
  \ 'command': 'cucumber',
  \ 'outputter': 'buffer',
  \ 'exec': 'bundle exec %c %o --color --drb %s'
  \}
let g:quickrun_config['cucumber/zeus'] = {
  \ 'type': 'cucumber/zeus',
  \ 'command': 'cucumber',
  \ 'outputter': 'buffer',
  \ 'exec': 'bundle exec zeus cucumber %o --color %s'
  \}

" Referenced @joker1007
" :h quickrun-option-exec
function! RSpecQuickrun()
  if exists('g:use_zeus_rspec')
    let b:quickrun_config = {'type' : 'rspec/zeus'}
  elseif exists('g:use_spring_rspec')
    let b:quickrun_config = {'type' : 'rspec/spring'}
  else
    let b:quickrun_config = {'type' : 'rspec/bundle'}
  end
  nnoremap <expr><silent> <leader>t "<Esc>:QuickRun -cmdopt \":" . line(".") . "\"<CR>"
endfunction
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

function! CucumberQuickrun()
  if exists('g:use_zeus_cucumber')
    let b:quickrun_config = {'type' : 'cucumber/zeus'}
  else
    let b:quickrun_config = {'type' : 'cucumber/bundle'}
  end
  nnoremap <expr><silent> <leader>t "<Esc>:QuickRun -cmdopt \"-l " . line(".") . "\"<CR>"
endfunction
autocmd BufReadPost *.feature call CucumberQuickrun()

function! SetUseZeus()
  let g:use_zeus_rspec = 1
  let g:use_zeus_cucumber = 1
  call CucumberQuickrun()
  call RSpecQuickrun()
endfunction
function! SetUseSpring()
  let g:use_spring_rspec = 1
  let g:use_spring_cucumber = 1
  call CucumberQuickrun()
  call RSpecQuickrun()
endfunction

command! -nargs=0 UseZeus call SetUseZeus()
command! -nargs=0 UseSpring call SetUseSpring()
command! -nargs=0 Zeus call SetUseZeus()
"call SetUseZeus()
"call SetUseSpring()
"}}}

" == For arpeggio {{{
"jk同時押しでEsc
call arpeggio#load()
Arpeggionmap jk <Esc>
Arpeggioimap jk <Esc>
Arpeggiocmap jk <Esc>
Arpeggiovmap jk <Esc>
Arpeggionmap fj <Esc>
Arpeggioimap fj <Esc>
Arpeggiocmap fj <Esc>
Arpeggiovmap fj <Esc>
" }}}

" == For dash {{{
function! s:dash(...)
  let word = len(a:000) == 0 ? input('Dash search: ') : a:1
  call system(printf("open dash://'%s'", word))
endfunction
command! -nargs=? Dash call <SID>dash(<f-args>)
nnoremap <silent> <leader>d :<C-u>Dash <C-R><C-W><CR>
"}}}

" == For vim-airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


" == For dispatch-vim {{{
"noremap :ds "<Esc>:Dispatch zeus rspec % -l \" . line(".") . \"<CR>"
"}}}

" == For syntastic
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_ruby_rubocop_exe = 'LC_ALL=en_US.UTF-8 rubocop'


" == For multi cursor {{{
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-j>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"}}}

" over.vim {{{
" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" }}}


"------------------------------------------------------------------------
" For Vim settings
"------------------------------------------------------------------------
set synmaxcol=100
"set hlsearch
set autoindent
set backspace=2
"set clipboard=unnamed
set directory=~/.vim/tmp
set expandtab
set helplang=ja
set hidden
set history=10000
set ignorecase
set incsearch
set infercase
set list
set modelines=0
set nohlsearch
set nowrap
set number
set scroll=12
set shiftwidth=2
set spellcapcheck=
set tabstop=2
set ttyfast
set ttymouse=xterm
set virtualedit=block
set visualbell
set window=0
set completefunc=neocomplcache#complete#manual_complete
set fileencodings=ucs-bom,utf-8,default,latin1
set ambiwidth=double
highlight CursorIM guibg=DarkGreen guifg=NONE ctermbg=DarkGreen ctermfg=NONE

" ==  Display tab multibyte space {{{
set lcs=tab:>.,trail:_,extends:\
set list
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
autocmd BufRead,BufNew * match JpSpace / /
"}}}


" == Custom function {{{
function! FormatCode()
  let s:line = line(".") - 1
  execute "silent! %s/  *$//"
  execute "silent! %s/ / /g"
  execute "norm " . s:line . "G"
endfunction

function! CreateSpecFile()
  let s:file = expand("%<")
  let s:file = substitute(s:file, "app/", "spec/", "")
  let s:file = s:file . "_spec.rb"
  execute "e! " . s:file
endfunction
function! GitHubLink()
  let git_home = system('git rev-parse --show-toplevel')[0:-2]
  let owner_and_repo = system('git config --get remote.origin.url')
  let owner_and_repo = substitute(owner_and_repo, '^..*:', '', '')
  let owner_and_repo = substitute(owner_and_repo, '.git', '', '')
  let file_path = substitute(expand("%"), git_home . '/', '', '')
  let branch = substitute(system('git rev-parse --abbrev-ref HEAD'), "\n", '', '')
  let hoge = 'http://github.com/'.owner_and_repo.'/'.'blob'.'/'.branch.'/'.file_path.'#L'.line('.')
  echo substitute(hoge, "\n", '', '')
endfunction
"}}}

" == Custom key mapping
nmap <Space>o :norm o<ESC>
nmap <Space>" :<C-u>s/'/"/g<CR>
nmap <Space>' :<C-u>s/"/'/g<CR>
nmap [[ :w<CR>
noremap <C-t> :set invwrap<CR>
inoremap jj <Esc>
"inoremap kk <Esc>
" == For visual mode paste
vnoremap <C-p> <Nop>
vnoremap <C-p> "0p
" == For bracket completion
"inoremap {} {}<LEFT>
"inoremap [] []<LEFT>
"inoremap () ()<LEFT>
"inoremap "" ""<LEFT>
"inoremap '' ''<LEFT>
command! -nargs=0 Gurl :call GitHubLink()

" == For tab key settings
" The prefix key.
"nnoremap    [Tag]   <Nop>
"nmap    t [Tag]
"" Tab jump
"for n in range(1, 9)
"  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
"endfor
"" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
"map <silent> [Tag]c :tablast <bar> tabnew<CR>
"" tc 新しいタブを一番右に作る
"map <silent> [Tag]x :tabclose<CR>
"" tx タブを閉じる
"map <silent> [Tag]n :tabnext<CR>
"" tn 次のタブ
"map <silent> [Tag]p :tabprevious<CR>
"" tp 前のタブ

" Cursor line
setlocal cursorline
" -- Status line
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


" == Remember last open curor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


" For quickfix list
" == For Quickfix Controlle
nnoremap <space>j  :cnext<Return>
nnoremap <space>k  :cprevious<Return>
" == Auto adding Quickfix to vimgrep
au QuickfixCmdPost vimgrep cw


" == IndentGuide Setting
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=none ctermbg=none
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=black
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1


" == Color schema
colorscheme railscasts
"colorscheme wombat256mod
"colorscheme molokai

"---------------------------------------------------------------------------
" for ASCII keybord
"---------------------------------------------------------------------------
"noremap ; :
"noremap : ;

" ==  Matchpair Color
let loaded_matchparen = 1
hi MatchParen term=standout ctermbg=LightYellow ctermfg=Red guibg=LightBlue guifg=Black

