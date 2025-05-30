colorscheme ap_dark8
set number
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set clipboard=unnamed

nnoremap <Space>. :<C-u>tabedit $MYVIMRC<CR>

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

imap <C-/> <ESC>

" Replace selected text
" https://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Jump back
map <C-i> <C-o>

" Dein

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set dein base path (required)
let s:dein_base = '~/.cache/dein/'

" Set dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
execute 'set runtimepath+=' .. s:dein_src

" Call dein initialization (required)
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_base)

  call dein#add(s:dein_src)

  " Your plugins go here:
  call dein#add('Shougo/vimproc')
  call dein#add('nathanaelkane/vim-indent-guides')
  let g:indent_guides_enable_on_vim_startup = 1
  "" For rails
  call dein#add('tpope/vim-rails')
  call dein#add('ngmy/vim-rubocop')
  call dein#add('tpope/vim-cucumber')
  " call dein#add('szw/vim-tags')
  " let g:vim_tags_project_tags_command = "/usr/local/Cellar/ctags/5.8/bin/ctags -f .tags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
  " let g:vim_tags_gems_tags_command = "/usr/local/Cellar/ctags/5.8/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
  " set tags+=.tags
  " set tags+=.Gemfile.lock.tags
  call dein#add('tsukkee/unite-tag')
  " call dein#addLazy 'alpaca-tc/alpaca_tags', {
  "       \ 'depends': ['Shougo/vimproc'],
  "       \ 'autoload' : {
  "       \   'commands' : [
  "       \     { 'name' : 'AlpacaTagsBundle', 'complete': 'customlist,alpaca_tags#complete_source' },
  "       \     { 'name' : 'AlpacaTagsUpdate', 'complete': 'customlist,alpaca_tags#complete_source' },
  "       \     'AlpacaTagsSet', 'AlpacaTagsCleanCache', 'AlpacaTagsEnable', 'AlpacaTagsDisable', 'AlpacaTagsKillProcess', 'AlpacaTagsProcessStatus',
  "       \ ],
  "       \ }}

  call dein#add('scrooloose/syntastic')

  "" Snippet
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/neosnippet')
  call dein#add('Shougo/neosnippet-snippets')

  "" ファイルオープンを便利に
  call dein#add('Shougo/unite.vim')
  call dein#add('basyura/unite-rails', {
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
    \ }})
  "" Unite.vimで最近使ったファイルを表示できるようにする
  call dein#add('Shougo/neomru.vim')
  "" Shell
  call dein#add('thinca/vim-quickrun')

  call dein#add('Shougo/vimshell')

  "" Swift
  call dein#add('toyamarinyon/vim-swift')

  "" Markdown Preview
  call dein#add('shime/vim-livedown')

  call dein#add('tpope/vim-rbenv')

  call dein#add('stjernstrom/vim-ruby-run')

  "" Git
  call dein#add('tpope/vim-fugitive')

  "" pLaTeX
  call dein#add('lervag/vimtex')

  "" OpenBrowser
  call dein#add('tyru/open-browser.vim')

  "" Ruby向けにendを自動挿入してくれる
  "" 追記する際に自動で追加されてしまう
  call dein#add('tpope/vim-endwise')
  call dein#add('vim-scripts/matchit.zip')

  "" コメントON/OFFを手軽に実行
  call dein#add('tomtom/tcomment_vim')

  "" ログファイルを色づけしてくれる
  call dein#add('vim-scripts/AnsiEsc.vim')

  "" 行末の半角スペースを可視化
  call dein#add('bronson/vim-trailing-whitespace')

  "" Maintains a history of previous yanks, changes and deletes
  call dein#add('vim-scripts/YankRing.vim')

  "" WakaTime
  " call dein#add('wakatime/vim-wakatime')

  "" Slack
  call dein#add('agatan/vim-vlack')

  "" ack
  call dein#add('mileszs/ack.vim')

  "" Dash
  call dein#add('rizzatti/dash.vim')

  "" Vim Window
  call dein#add('kana/vim-submode')

  "" Repl
  call dein#add('ujihisa/repl.vim')

  "" Tidal
  call dein#add('munshkr/vim-tidal')

  "" Align
  call dein#add('junegunn/vim-easy-align')

  "" AI

  """ Copilot
  call dein#add('github/copilot.vim')

  " Finish dein initialization (required)
  call dein#end()
endif

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" highlight for search
set hlsearch
hi Search ctermbg=Red
hi Search ctermfg=Black

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
 call dein#install()
endif

" unite
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]c :<C-u>UniteWithCurrentDir -start-insert -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" Files inside directory containing file ('head')
nnoremap <silent> [unite]f :<C-u>:Unite file_rec:`expand('%:p:h')`<CR>
" unite-rails
nnoremap <silent> [unite]rc :<C-u>Unite file:app/controllers<CR>
nnoremap <silent> [unite]rm :<C-u>Unite file:app/models<CR>
nnoremap <silent> [unite]rv :<C-u>Unite file:app/views<CR>
nnoremap <silent> [unite]rh :<C-u>Unite file:app/helpers<CR>
nnoremap <silent> [unite]rst :<C-u>Unite file:app/assets/stylesheets<CR>
nnoremap <silent> [unite]rj :<C-u>Unite file:app/assets/javascripts<CR>
nnoremap <silent> [unite]rjo :<C-u>Unite file:app/jobs<CR>
nnoremap <silent> [unite]rr :<C-u>Unite file:route<CR>
nnoremap <silent> [unite]rg :<C-u>Unite file:Gemfile<CR>
nnoremap <silent> [unite]rp :<C-u>Unite file:spec<CR>
nnoremap <silent> [unite]rf :<C-u>Unite file:features<CR>
nnoremap <silent> [unite]rse :<C-u>Unite file:app/serializers<CR>
nnoremap <silent> [unite]rs :<C-u>Unite file:app/services<CR>
nnoremap <silent> [unite]ru :<C-u>Unite file:app/uploaders<CR>
nnoremap <silent> [unite]rpr :<C-u>Unite file:app/preloaders<CR>

" Unite for fastlane
nnoremap <silent> [unite]ffc :<C-u>Unite file_rec:./fastlane_core/lib/fastlane_core<CR>
nnoremap <silent> [unite]ff :<C-u>Unite file_rec:./fastlane/lib/fastlane<CR>
nnoremap <silent> [unite]ffr :<C-u>Unite file_rec:./frameit/lib/frameit<CR>
nnoremap <silent> [unite]fpe :<C-u>Unite file_rec:./pem/lib/pem<CR>
nnoremap <silent> [unite]fpi :<C-u>Unite file_rec:./pilot/lib/pilot<CR>
nnoremap <silent> [unite]fpre :<C-u>Unite file_rec:./precheck/lib/precheck<CR>
nnoremap <silent> [unite]fpro :<C-u>Unite file_rec:./produce/lib/produce<CR>
nnoremap <silent> [unite]fm :<C-u>Unite file_rec:./match/lib/match<CR>
nnoremap <silent> [unite]fsca :<C-u>Unite file_rec:./scan/lib/scan<CR>
nnoremap <silent> [unite]fscr :<C-u>Unite file_rec:./screengrab/lib/screengrab<CR>
nnoremap <silent> [unite]fsi :<C-u>Unite file_rec:./sigh/lib/sigh<CR>
nnoremap <silent> [unite]fsn :<C-u>Unite file_rec:./snapshot/lib/snapshot<CR>
nnoremap <silent> [unite]fsp :<C-u>Unite file_rec:./spaceship/lib/spaceship<CR>
nnoremap <silent> [unite]fsu :<C-u>Unite file_rec:./supply/lib/supply<CR>
nnoremap <silent> [unite]fg :<C-u>Unite file_rec:./gym/lib/gym<CR>
nnoremap <silent> [unite]fc :<C-u>Unite file_rec:./cert/lib/cert<CR>
nnoremap <silent> [unite]fd :<C-u>Unite file_rec:./deliver/lib/deliver<CR>

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
let g:quickrun_config['ruby.cucumber'] = {'command': 'bin/cucumber', 'exec': '%o %c %s', 'cmdopt': ''}

augroup NafuRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
augroup NafuCucumber
  autocmd!
  autocmd BufWinEnter,BufNewFile *.feature set filetype=ruby.cucumber
augroup END

"Ruby
let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['ruby']}
augroup matchit
    autocmd!
    autocmd FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
    autocmd FileType ruby.rspec let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\|describe\|context\|it\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END
source $VIMRUNTIME/macros/matchit.vim
"------------------------------------
" neocomplete
"------------------------------------
" neocomplete "{{{
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'ruby' : $HOME.'/.vim/snippet/dict'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplete#smart_close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.c =
\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.cpp =
\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl =
\ '[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
"}}}
"------------------------------------
" neosnippet
"------------------------------------
" neosnippet "{{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets' behavior.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
"}}}
"------------------------------------
" AlpacaTags
"------------------------------------
" AlpacaTags "{{{
" let g:alpaca_tags#config = {
"        \ '_' : '-R --sort=yes --languages=+Ruby --languages=-js,JavaScript',
"        \ 'js' : '--languages=+js',
"        \ '-js' : '--languages=-js,JavaScript',
"        \ 'vim' : '--languages=+Vim,vim',
"        \ 'php' : '--languages=+php',
"        \ '-vim' : '--languages=-Vim,vim',
"        \ '-style': '--languages=-css,scss,js,JavaScript,html',
"        \ 'scss' : '--languages=+scss --languages=-css',
"        \ 'css' : '--languages=+css',
"        \ 'java' : '--languages=+java $JAVA_HOME/src',
"        \ 'ruby': '--languages=+Ruby',
"        \ 'coffee': '--languages=+coffee',
"        \ '-coffee': '--languages=-coffee',
"        \ 'bundle': '--languages=+Ruby',
"        \ }
" augroup AlpacaTags
"   autocmd!
"   if exists(':Tags')
"     autocmd BufWritePost Gemfile TagsBundle
"     autocmd BufEnter * TagsSet
"     " 毎回保存と同時更新する場合はコメントを外す
"     " autocmd BufWritePost * TagsUpdate
"   endif
" augroup END
"}}}

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

" call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
" call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
" call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
" call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
" call submode#map('bufmove', 'n', '', '>', '<C-w>>')
" call submode#map('bufmove', 'n', '', '<', '<C-w><')
" call submode#map('bufmove', 'n', '', '+', '<C-w>+')
" call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" Tidal
let maplocalleader=","

" Align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
