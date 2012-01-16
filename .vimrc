" -- COLOR SCHEME
if stridx($TERM, "xterm-256color") >= 0
  colorscheme desert256
else
  colorscheme desert
endif

" -- 256色モード
if stridx($TERM, "xterm-256color") >= 0
  set t_Co=256
else
  set t_Co=16
endif

" -- VUNDLE
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype plugin on


"-- BUNDLE PLUGINS
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'sgur/unite-git_grep'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-fugitive'
"Bundle 'project.vim'


"-- UNITE.VIM
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
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> <C-n> :<C-u>UniteWithBufferDir -buffer-name=files file file_mru bookmark <CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
" UNIT GIT GREPを開く
nnoremap <silent> ,ug :<C-u>Unite<space>vcs_grep/git<CR>


"-- NEOCOMPLCACHE
" let g:neocomplcache_enable_at_startup = 1
smap <Tab> <Plug>(neocomplcache_snippets_expand)

"-- INDENT
colorscheme delek
"colorscheme desert
"colorscheme peachpuff
"colorscheme morning
"colorscheme evening
"colorscheme elflord
"colorscheme pablo
"colorscheme blue
"colorscheme darkblue
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=DarkRed   ctermbg=grey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=DarkGreen ctermbg=darkgray
let g:indent_guides_enable_on_vim_startup = 1

"-- VIM EDITOR SETTING
set tabstop=2
set shiftwidth=2
set expandtab
set number
set nohlsearch
set clipboard=unnamed


"-- Display tab multibyte space
set lcs=tab:>.,trail:_,extends:\
set list
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/


"-- 前回開いた場所を記憶
au BufWritePost,VimLeave * mkview
autocmd BufReadPost * loadview


"-- Cursor line
"setlocal cursorline
