syntax on
colorscheme ap_dark8
set number
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
" For proper backspace behaviour
set backspace=indent,eol,start
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

" Mapping
nnoremap <C-k> k:call search ("^". matchstr (getline (line (".")+ 1), '\(\s*\)') ."\\S", 'b')<CR>^
nnoremap <C-j> :call search ("^". matchstr (getline (line (".")), '\(\s*\)') ."\\S")<CR>^

" Jump back
map <C-i> <C-o>

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
NeoBundle 'scrooloose/syntastic'


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
" 追記する際に自動で追加されてしまう
NeoBundle 'tpope/vim-endwise'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

" Maintains a history of previous yanks, changes and deletes
NeoBundle 'vim-scripts/YankRing.vim'

" WakaTime
NeoBundle 'wakatime/vim-wakatime'

" Slack
NeoBundle 'agatan/vim-vlack'

" ack
NeoBundle 'mileszs/ack.vim'

" Dash
NeoBundle 'rizzatti/dash.vim'

" Evernote
NeoBundle 'kakkyz81/evervim'

" Vim Window
NeoBundle 'kana/vim-submode'

" Repl
NeoBundle 'ujihisa/repl.vim'

" Tidal
NeoBundle 'munshkr/vim-tidal'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" unite
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir -start-insert -buffer-name=files buffer file_mru bookmark file<CR>
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

let g:quickrun_config._ = {'runner': 'vimproc', 'split': '', 'runner/vimproc/updatetime': 10}
set splitbelow

" with bundler
" let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'exec': '%o %c %s', 'cmdopt': 'bundle exec'}
" with spring
let g:quickrun_config['ruby.rspec'] = {'command': 'bin/rspec', 'exec': '%o %c %s', 'cmdopt': ''}

augroup NafuRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

"Ruby
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['ruby']}

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

map gm :LivedownPreview<CR>

noremap  <silent> <C-E> :call RubyRun()<CR>
vnoremap <silent> <C-E> :call RubyRangeRun()<CR>

" pLaTeX
" Usage: \ll, \lv
" http://shkh.hatenablog.com/entry/2012/04/30/214107
filetype plugin on
let tex_flavor = 'latex'
set grepprg=grep\ -nH\ $*
set shellslash
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_CompileRule_dvi = 'platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf = 'dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'

" Slack
let g:slaq_token = 'xoxp-3062595420-3062595430-9326113507-a3240f'

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" Dash
nmap <silent> <leader>d <Plug>DashSearch

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

" For English keyboard
noremap ; :

" Easily move between splitted windows
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" * evervim {{{
nnoremap <silent> ,el :<C-u>EvervimNotebookList<CR>
nnoremap <silent> ,eT :<C-u>EvervimListTags<CR>
nnoremap <silent> ,en :<C-u>EvervimCreateNote<CR>
nnoremap <silent> ,eb :<C-u>EvervimOpenBrowser<CR>
nnoremap <silent> ,ec :<C-u>EvervimOpenClient<CR>
nnoremap ,es :<C-u>EvervimSearchByQuery<SPACE>
nnoremap <silent> ,et :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done -tag:someday<CR>
nnoremap <silent> ,eta :<C-u>EvervimSearchByQuery<SPACE>tag:todo -tag:done<CR>
let g:evervim_asyncupdate='1'
let g:evervim_splitoption=''
" ------------------------ }}}

" Tidal
let maplocalleader=","

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
