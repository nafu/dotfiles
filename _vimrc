syntax on
colorscheme ap_dark8
set number
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
" For GoshREPL
" vmap <CR> <Plug>(gosh_repl_send_block)
" This command is for scheme
autocmd Filetype scheme set lisp|filetype plugin indent on|set showmatch|set matchtime=0
" For Binary
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END
" NeoBundle
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
" For rails
NeoBundle 'tpope/vim-rails'
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'tpope/vim-cucumber'
" NeoBundle 'szw/vim-tags'
" let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8/bin/ctags -f .tags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
" let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
" set tags+=.tags
" set tags+=.Gemfile.lock.tags
NeoBundle 'tsukkee/unite-tag'
" NeoBundle 'alpaca-tc/alpaca_tags'
NeoBundleLazy 'basyura/unite-rails', {
  \ 'depends' : 'Shougo/unite.vim',
  \ 'autoload' : {
  \   'unite_sources' : [
  \     'rails/bundle', 'rails/bundled_gem', 'rails/config',
  \     'rails/controller', 'rails/db', 'rails/destroy', 'rails/features',
  \     'rails/gem', 'rails/gemfile', 'rails/generate', 'rails/git', 'rails/helper',
  \     'rails/heroku', 'rails/initializer', 'rails/javascript', 'rails/lib', 'rails/log',
  \     'rails/mailer', 'rails/model', 'rails/rake', 'rails/route', 'rails/schema', 'rails/spec',
  \     'rails/stylesheet', 'rails/view'
  \   ]
  \ }}


" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" ...省略
NeoBundle 'thinca/vim-quickrun'

NeoBundle 'Shougo/vimshell'

" Swift
NeoBundle 'toyamarinyon/vim-swift'

" Markdown Preview
NeoBundle 'shime/vim-livedown'

NeoBundle 'tpope/vim-rbenv'

NeoBundle 'stjernstrom/vim-ruby-run'

" Git
NeoBundle 'tpope/vim-fugitive'

" pLaTeX
NeoBundle 'lervag/vimtex'

" OpenBrowser
NeoBundle 'tyru/open-browser.vim'

" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" unite
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" unite-rails
nnoremap <silent> [unite]rc :<C-u>Unite rails/controller<CR>
nnoremap <silent> [unite]rm :<C-u>Unite rails/model<CR>
nnoremap <silent> [unite]rv :<C-u>Unite rails/view<CR>
nnoremap <silent> [unite]rh :<C-u>Unite rails/helper<CR>
nnoremap <silent> [unite]rs :<C-u>Unite rails/stylesheet<CR>
nnoremap <silent> [unite]rj :<C-u>Unite rails/javascript<CR>
nnoremap <silent> [unite]rr :<C-u>Unite rails/route<CR>
nnoremap <silent> [unite]rg :<C-u>Unite rails/gemfile<CR>
nnoremap <silent> [unite]rp :<C-u>Unite rails/spec<CR>
nnoremap <silent> [unite]rf :<C-u>Unite rails/features<CR>
nnoremap <silent> [unite]rse :<C-u>Unite rails/serializer<CR>

" Go to previous file
let mapleader = ","
map <Leader>p <C-^>

" quickrun
let g:quickrun_config = {}

let g:quickrun_config._ = {'runner': 'vimproc', 'split': ''}
set splitbelow

let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'exec': '%o %c %s', 'cmdopt': 'bundle exec'}

augroup NafuRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

nnoremap [quickrun] <Nop>
nmap <Space>k [quickrun]
nnoremap <silent> [quickrun]r :call QRunRspecCurrentLine()<CR>
fun! QRunRspecCurrentLine()
  let line = line(".")
  exe ":QuickRun -exec '%c %s%o' -cmdopt ':" . line . "'"
endfun

" Swift
let g:quickrun_config['swift'] = {'command': 'swift', 'cmdopt': 'xcrun', 'exec': '%o %c %s'}

" livedown
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

map gm :call LivedownPreview()<CR>

noremap  <silent> <C-E> :call RubyRun()<CR>
vnoremap <silent> <C-E> :call RubyRangeRun()<CR>

" pLaTeX
filetype plugin on
let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'

" Ruby
set tags+=gems.tags

" カーソル下のgemのrdocを開く
function! OpenYard(...)
  let gem = a:1 == "" ? "" : a:1
  if gem == ""
    call OpenBrowser("http://localhost:8808/")
  else
    let url = "http://localhost:8808/docs/" . tolower(gem) . "/frames/"
    call OpenBrowser(url)
  endif
endfunction

command!
\   -nargs=* -complete=file
\   OpenYard
\   call OpenYard(<q-args>)

" マッピング
nmap <Space>y :<C-U>OpenYard <C-R><C-W><CR>
