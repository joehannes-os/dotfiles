let mapleader = ","
let maplocalleader = "<space>"

" Autoinstall vim-plug
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'eraserhd/parinfer-rust', {'do': 'cargo build --release'}

Plug 'jxnblk/vim-mdx-js'

" included as coc-plugin
"Plug 'codota/tabnine-vim'

Plug 'dbeniamine/cheat.sh-vim'

nnoremap <silent> <space>Cr :CheatReplace<cr>

" For now stick with coc
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'gfanto/fzf-lsp.nvim'
" Plug 'onsails/lspkind-nvim'
" Plug 'kosayoda/nvim-lightbulb'
"
" autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
"
" Plug 'ray-x/lsp_signature.nvim'

" Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
" Plug 'ray-x/navigator.lua'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'ojroques/nvim-lspfuzzy'
"
" nnoremap <silent> <space>fDb :LspDiagnostics 0<cr>

" Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
"
" let g:minimap_auto_start = 1
" let g:minimap_auto_start_win_enter = 1
" let g:minimap_width = 20
" let g:minimap_highlight = 'MinimapCurrentLine'
" let g:minimap_left = 0
"
" hi MinimapCurrentLine ctermfg=green guifg=#50FA7B guibg=#32302f
"
" nnoremap <silent> <leader>Mn :Minimap<cr>
" nnoremap <silent> <leader>Mq :MinimapClose<cr>
" nnoremap <silent> <leader>Mr :MinimapRefresh<cr>

" devdocs a la mac but terminal + vim
Plug 'sunaku/vim-dasht'
" search related docsets
nnoremap <leader>k :Dasht<Space>
" search ALL the docsets
nnoremap <leader><leader>k :Dasht!<Space>
" search related docsets
nnoremap <silent><space>k :call Dasht(dasht#cursor_search_terms())<cr>
" search ALL the docsets
nnoremap <silent><space><space>k :call Dasht(dasht#cursor_search_terms(), '!')<cr>

let g:dasht_filetype_docsets = {}
let g:dasht_filetype_docsets['clojure'] = ['javascript', 'html', 'semantic ui', 'lodash', 'svg']
" create new tab beside current one
let g:dasht_results_window = 'tabnew'

Plug 'MattesGroeger/vim-bookmarks'

highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1

nmap <space>tm <Plug>BookmarkToggle
nmap <space>tMa <Plug>BookmarkAnnotate
nmap <space>fm :CocCommand fzf-preview.Bookmarks<cr>
nmap ]m <Plug>BookmarkNext
nmap [m <Plug>BookmarkPrev
nmap <space>xm <Plug>BookmarkClearAll
nmap <space>wm <Plug>BookmarkSave ~/.config/nvim/bookmarks
nmap <space>lm <Plug>BookmarkLoad ~/.config/nvim/bookmarks


if v:vim_did_enter
  exec "normal \<Plug>BookmarkLoad ~/.config/nvim/bookmarks"
else
 au VimEnter * exec "normal \<Plug>BookmarkLoad ~/.config/nvim/bookmarks"
endif

au VimLeavePre * exec "normal \<Plug>BookmarkSave ~/.config/nvim/bookmarks"

Plug 'gko/vim-coloresque'

Plug 'puremourning/vimspector'

let g:vimspector_install_gadgets = [ 'debugger-for-chrome', 'vscode-node-debug2' ]

nmap <space>d<space> <Plug>VimspectorContinue<CR>
nmap <space>d<esc> <Plug>VimspectorStop<CR>
nmap <space>d<c-CR> <Plug>VimSpectorRestart<CR>
nmap <space>d<backspace> <Plug>VimspectorPause<CR>
nmap <space>tb <Plug>VimspectorToggleBreakpoint<CR>
nmap <space>tBc <Plug>VimspectorToggleConditionalBreakpoint<CR>
nmap <space>tBf <Plug>VimspectorAddFunctionalBreakpoint<CR>
nmap <space>dl <Plug>VimspectorStepOver<CR>
nmap <space>dj <Plug>VimspectorStepInto<CR>
nmap <space>dk <Plug>VimspectorStepOut<CR>
nmap <space>d<CR> <Plug>VimSpectorRunToCursor<CR>

" Plug 'wellle/context.vim'
"
" nnoremap <silent> <space>tC :ContextToggle<CR>

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

nnoremap <space>t; <cmd>CHADopen<cr>
nnoremap <space>xl <cmd>call setqflist([])<cr>

Plug 'voldikss/vim-skylight'

let g:skylight_height = 0.9
let g:skylight_position = 'right'

nnoremap <silent> <space>jp :Skylight!<CR>
nnoremap <silent><expr> <a-j> skylight#float#has_scroll() ? skylight#float#scroll(1, 10) : "\<C-f>"
nnoremap <silent><expr> <a-k> skylight#float#has_scroll() ? skylight#float#scroll(0, 10) : "\<C-b>"

hi SkylightBorder guibg=magenta guifg=cyan

Plug 'smitajit/bufutils.vim'

let g:bufutils#open#use_fzf = 1

nnoremap <space>wM :BResizeZoom<cr>

Plug 'arithran/vim-delete-hidden-buffers'

nnoremap <space>xb :DeleteHiddenBuffers<cr>

au VimLeavePre * exec "normal \:DeleteHiddenBuffers"

Plug 'Olical/conjure', {'tag': 'v4.19.0'}

nnoremap <space>ee :ConjureEval<cr>
nnoremap <space>eb :ConjureEvalBuf<cr>
nnoremap <space>ec :ConjureCljConnectPortFile<cr>
nnoremap <space>e= :ConjureShadowSelect app<cr>

let g:conjure#log#hud#height=0.9

" " Conjure support - jack-in with nrepl dependencies
" Plug 'tpope/vim-dispatch'
" Plug 'clojure-vim/vim-jack-in'
"
" nnoremap <space>tRl :Lein<cr>
"
" " Only in Neovim:
" Plug 'radenling/vim-dispatch-neovim'

Plug 'dense-analysis/ale'

" Lint configuration - clj-kondo
" clj-kondo should be installed on operating system path
let g:ale_linters = {
      \ 'clojure': ['clj-kondo']
      \}

" Structural editing for lisp languages
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'kien/rainbow_parentheses.vim'

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plug 'dmac/vim-cljfmt', { 'do': 'go get github.com/cespare/goclj/cljfmt' }

" Coc Compatible AutoCompletion
Plug 'clojure-vim/async-clj-omni'

Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }

let g:reply_repls = {
\   'javascriptreact': ['node'],
\   'typescriptreact': ['ts_node'],
\   'clojure': ['clojure']
\ }

vnoremap <space>tr :'<,'>Repl<cr>
nnoremap <space>tr :%Repl<cr>

Plug 'diepm/vim-rest-console'

let g:vrc_curl_opts = {
  \ '--connect-timeout' : 10,
  \ '-L': '',
  \ '-i': '',
  \ '--max-time': 60,
  \ '--ipv4': '',
  \ '-k': '',
\}

nnoremap <space>t$ :edit ~/.local/snippets/vim.rest<CR>
nnoremap <space>r$ :call VrcQuery()<CR>

Plug 'Konfekt/Fastfold'

nmap <space>z <Plug>(FastFoldUpdate)
let g:fastfold_minlines = 50
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']

let g:markdown_folding = 1
let g:tex_fold_enabled = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1
let g:javaScript_fold = 1
let g:sh_fold_enabled= 7
let g:ruby_fold = 1
let g:perl_fold = 1
let g:perl_fold_blocks = 1
let g:r_syntax_folding = 1
let g:rust_fold = 1
let g:php_folding = 1

Plug 'junegunn/goyo.vim'

function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <space>tF :Goyo<CR>
nnoremap <leader>J <C-w>+
nnoremap <leader>K <C-w>-
nnoremap <leader>L <C-w>>
nnoremap <leader>H <C-w>\<>

let g:goyo_width='80%'

Plug 'patstockwell/vim-monokai-tasty'

let g:vim_monokai_tasty_italic = 1

Plug 'liuchengxu/space-vim-theme'

let g:one_allow_italics = 1 " I love italic for comments

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endif

Plug 'RRethy/vim-illuminate', { 'do': 'take ~/.config/nvim/pack/plugins/start && gh repo clone RRethy/vim-illuminate' }
" Possibly this repo needs installation/cloning manually
" Time in milliseconds (default 250)
let g:Illuminate_delay = 100
let g:Illuminate_highlightUnderCursor = 0

hi link illuminatedWord Visual

Plug 'nightsense/night-and-day'

let g:nd_themes = [
  \ ['sunrise+0', 'space_vim_theme', 'dark' ],
  \ ['sunset+0', 'vim-monokai-tasty', '' ],
\ ]

" Europe/Austria/Vienna
" let g:nd_latitude = '50'

" Americas/Santo Domingo as of tropics closest to 19
let g:nd_latitude = 20
let g:nd_timeshift = 42
" CEST-aware timeshift
" if strftime("%m") > 3 && strftime("%m") < 11
"   let g:nd_timeshift = '38'
" else
"   let g:nd_timeshift = '-22'
" endif

Plug 'git-time-metric/gtm-vim-plugin'

let g:gtm_plugin_status_enabled = 1

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'google-chrome-stable'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

nmap <space>t<> <Plug>MarkdownPreviewToggle
nmap <space><> <Plug>MarkdownPreview
nmap <space>q<> <Plug>MarkdownPreviewStop

Plug 'frazrepo/vim-rainbow'

let g:rainbow_active = 1

Plug 'SirVer/ultisnips'

" Cfg for ultisnip snippets
let g:ultisnips_javascript = {
\ 'keyword-spacing': 'always',
\ 'semi': 'always',
\ 'space-before-function-paren': 'always',
\ }

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsExpandTrigger="<c-cr>"
let g:UltiSnipsJumpForwardTrigger="<a-j>"
let g:UltiSnipsJumpBackwardTrigger="<a-k>"
let g:UltiSnipsSnippetDirectories=[$HOME."/.local/snippets"]

Plug 'honza/vim-snippets'

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'npm i -g dockerfile-language-server-nodejs sql-language-server'}

let g:coc_global_extensions = [
      \'coc-conjure',
      \'coc-snippets',
      \'coc-fzf-preview',
			\'coc-yank',
			\'coc-yaml',
			\'coc-xml',
			\'coc-webpack',
			\'coc-tsserver',
			\'coc-tslint-plugin',
			\'coc-translator',
			\'coc-tag',
			\'coc-tabnine',
			\'coc-syntax',
			\'coc-svg',
			\'coc-stylelintplus',
			\'coc-stylelint',
			\'coc-spell-checker',
			\'coc-scssmodules',
			\'coc-prettier',
			\'coc-pairs',
			\'coc-markdownlint',
			\'coc-lists',
			\'coc-json',
			\'coc-html',
      \'coc-svg',
			\'coc-highlight',
			\'coc-gitignore',
			\'coc-github',
			\'coc-git',
			\'coc-flow',
			\'coc-eslint',
			\'coc-emoji',
			\'coc-emmet',
			\'coc-dictionary',
			\'coc-diagnostic',
			\'coc-cssmodules',
			\'coc-css',
			\'coc-css-block-comments',
			\'coc-browser',
			\'coc-actions',
      \'coc-react-refactor',
			\]

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>

autocmd User CocGitStatusChange {command}

" commands
" --------
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=? Unfold :call CocAction('unfold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" use :Prettier to format file using prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>ld  :<C-u>CocList diagnostics<cr>
" redefined later with usage of bqr & coc
" //@TODO: add filter to not show cspell diagnostic ... more shortcuts
" Show commands
nnoremap <silent> <space>lx  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>lo  :<C-u>CocList outline<cr>
" k Search workspace symbols
nnoremap <silent> <space>ls  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>aj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ak  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>l.  :<C-u>CocListResume<CR>
nnoremap <silent> <space>ly  :<C-u>CocList yank<cr>
nnoremap <silent> <space>lf  :<C-u>CocList grep<cr>
nnoremap <silent> <space>lFw  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nnoremap <silent> <space>S> :CocCommand session.save<cr>
nnoremap <silent> <space>S< :CocCommand session.load<CR>
"
" Snippets
" --------
" Use <C-l> for trigger snippet expand.
imap <c-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <space><c-cr> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<a-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<a-k>'

inoremap <silent><expr> <C-TAB>
       \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<c-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<tab>" :
      \ coc#refresh()

" RangeSelections
" ---------------
" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <leader><TAB> <Plug>(coc-range-select)
xmap <silent> <leader><TAB> <Plug>(coc-range-select)
xmap <silent> <leader><S-TAB> <Plug>(coc-range-select-backword)

" CodeActions
" -----------
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph

xmap <space>As  <Plug>(coc-codeaction-selected)
nmap <space>As  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <space>Aa  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <space>Af  <Plug>(coc-fix-current)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <space>Rr <Plug>(coc-rename)

" formatting related stuff
" ------------------------

augroup cocAutoFormat
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,typescriptreact,javascript,javascriptreact,json,clojure setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <space>Rf  :Prettier<cr>
au FileType svg nnoremap <space>Rf :CocCommand svg.prettySvg<cr>
au FileType clojure nnoremap <space>Rf :CljFmt<cr>

nnoremap <leader>.>  :Fold<cr>
nnoremap <leader>.<  :Unfold<cr>
xmap <space>Rs  <Plug>(coc-format-selected)
nmap <space>Rs  <Plug>(coc-format-selected)

" diagnostics specific stuff
" --------------------------

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
" --------------------
nmap <silent> <space>jd <Plug>(coc-definition)
nmap <silent> <space>j: <Plug>(coc-type-definition)
nmap <silent> <space>ji <Plug>(coc-implementation)
nmap <silent> <space>jr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" git specific stuff
" ------------------
" navigate chunks of current buffer
nmap [G <Plug>(coc-git-prevchunk)
nmap ]G <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap <space>Gi <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <space>Gc <Plug>(coc-git-commit)
" stage current git chunk
nnoremap <silent> <space>Gs :<C-u>CocCommand git.chunkStage<CR>
" undo current git chunk
nnoremap <silent> <space>Gu! :<C-u>CocCommand git.chunkUndo<CR>
" push to remote
nnoremap <silent> <space>Gp :<C-u>CocCommand git.push<CR>
nnoremap <silent> <space>lGs  :<C-u>CocList --normal gstatus<CR>
nnoremap <silent> <space>zc :CocCommand git.foldUnchanged<CR>
nnoremap <silent> <space>y@ :CocCommand git.copyUrl<CR>
nnoremap <silent> <space>tGg :CocCommand git.toggleGutters<CR>

" completion specific stuff
" -------------------------

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <c-TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" bqf-related stuff
" :h CocLocationsChange for detail
let g:coc_enable_locationlist = 0
aug Coc
    au!
    au User CocLocationsChange ++nested call Coc_qf_jump2loc(g:coc_jump_locations)
aug END

" if you use coc-fzf, you should disable its CocLocationsChange event make
" bqf work for <Plug>(coc-references)
" au VimEnter * au! CocFzfLocation User CocLocationsChange
nnoremap <silent> <space>ld <Cmd>call Coc_qf_diagnostic()<CR>

function! Coc_qf_diagnostic() abort
    let diagnostic_list = CocAction('diagnosticList')
    let items = []
    let loc_ranges = []
    for d in diagnostic_list
        let text = printf('[%s%s] %s', (empty(d.source) ? 'coc.nvim' : d.source),
                    \ (d.code ? ' ' . d.code : ''), split(d.message, '\n')[0])
        let item = {'filename': d.file, 'lnum': d.lnum, 'col': d.col, 'text': text, 'type':
                    \ d.severity[0]}
        call add(loc_ranges, d.location.range)
        call add(items, item)
    endfor
    call setqflist([], ' ', {'title': 'CocDiagnosticList', 'items': items,
                \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
    botright copen
endfunction

function! Coc_qf_jump2loc(locs) abort
    let loc_ranges = map(deepcopy(a:locs), 'v:val.range')
    call setloclist(0, [], ' ', {'title': 'CocLocationList', 'items': a:locs,
                \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
    let winid = getloclist(0, {'winid': 0}).winid
    if winid == 0
        aboveleft lwindow
    else
        call win_gotoid(winid)
    endif
endfunction
" end bqf-related stuff

Plug 'liuchengxu/vista.vim'

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
			\ 'javascript': 'ctags -R',
			\ 'javascriptreact': 'ctags -R',
			\ 'javascript.jsx': 'ctags -R',
			\ 'typescript': 'ctags -R',
			\ 'typescriptreact': 'ctags -R',
			\ 'typescript.tsx': 'ctags -R',
      \ 'css': 'ctags -R',
			\ 'scss': 'ctags -R',
			\ 'sass': 'ctags -R',
      \ 'clojure': 'ctags -R',
      \ 'clojurescript': 'ctags -R',
			\ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:35%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" toggle structural view
nnoremap <space>tO :Vista!!<cr>
nnoremap <leader>tO :Vista coc<cr>

" toggle fuzzy in buffer tag finder
nnoremap <space>ft :Vista finder coc<CR>

Plug 'wakatime/vim-wakatime'
Plug 'easymotion/vim-easymotion'

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

map <space>jl <Plug>(easymotion-lineforward)
map <space>jj <Plug>(easymotion-j)
map <space>jk <Plug>(easymotion-k)
map <space>jh <Plug>(easymotion-linebackward)

Plug 'haya14busa/incsearch.vim'

let g:incsearch#auto_nohlsearch = 1
set hlsearch

map /  <Plug>(incsearch-forward)
map <C-/>  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

Plug 'haya14busa/incsearch-easymotion.vim'

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_OPTS = '--layout=reverse --preview="bat --style=numbers --color=always --line-range :500 {}"'
let g:fzf_history_dir = '~/.local/share/fzf-history'

function! OpenFloatingWin()
	let height = &lines * 7 / 10
	let width = float2nr(&columns - (&columns * 1 / 10))
	let col = float2nr((&columns - width) / 2)

	let opts = {
			 \ 'relative': 'editor',
			 \ 'row': 1,
			 \ 'col': col,
			 \ 'width': width,
			 \ 'height': height,
			 \ }

	let buf = nvim_create_buf(v:false, v:true)
	let win = nvim_open_win(buf, v:true, opts)

	call setwinvar(win, '&winhl', 'Normal:Pmenu')

	setlocal
				 \ buftype=nofile
				 \ nobuflisted
				 \ bufhidden=hide
				 \ nonumber
				 \ norelativenumber
				 \ signcolumn=no
endfunction

let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

nnoremap <space>; :GFiles?<cr>
nnoremap ; :GFiles --recurse-submodules<Cr>
nnoremap <space>fH :History<CR>
nnoremap <space>fFf :Rg .<CR>

"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

function! SearchWithAgInDirectory(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#with_preview('up:80%', '?')), 1)
endfunction
command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)

nnoremap <silent> <space>fK :AgIn ~/.manu-pages/md-detailled/<cr>

nnoremap <silent> <space>fTb :CocCommand fzf-preview.BufferTags<cr>
nnoremap <silent> <space>fl :CocCommand fzf-preview.Lines<cr>
nnoremap <silent> <space>fb :CocCommand fzf-preview.Buffers<cr>
nnoremap <silent> <space>fLb :CocCommand fzf-preview.BufferLines<cr>
nnoremap <silent> <space>fg :CocCommand fzf-preview.ProjectGrep .<cr>
nnoremap <silent> <space>fd :CocCommand fzf-preview.CocCurrentDiagnostics<cr>
nnoremap <silent> <space>fGs :CocCommand fzf-preview.GitStatus<cr>
nnoremap <silent> <space>fGa :CocCommand fzf-preview.GitActions<cr>
nnoremap <silent> <space>fGh :CocCommand fzf-preview.GitLogs<cr>

Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

Plug 'raimondi/delimitmate'

Plug 'nathanaelkane/vim-indent-guides'

hi IndentGuidesOdd  ctermbg=lightgrey
hi IndentGuidesEven ctermbg=darkgrey

let g:indent_guides_enable_on_vim_startup = 1

Plug 'brooth/far.vim'

set lazyredraw
let g:far#enable_undo=1
let g:far#source = 'rg'

" shortcut for far.vim find
nnoremap <silent> <space>lFf  :Farf<cr>
vnoremap <silent> <space>lFf  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <space>lFr  :Farr<cr>
vnoremap <silent> <space>lFr  :Farr<cr>

Plug 'voldikss/vim-floaterm'

hi FloatermBorder guibg=magenta guifg=cyan
set shell=/bin/zsh

let g:floaterm_height=0.9
let g:floaterm_width=0.9
let g:floaterm_wintype='floating'
let g:floaterm_position='top'
let g:floaterm_winblend=10

nnoremap <space>tt :FloatermToggle<CR>
tnoremap <space>tt <C-\><C-n>:FloatermToggle<cr>
inoremap <space>tt <C-\><C-n>:FloatermToggle<cr>
nnoremap <space>Tn :FloatermNew<cr>
tnoremap <space>Tn <C-\><C-n>:FloatermNew<cr>
nnoremap ]t :FloatermNext<cr>
nnoremap [t :FloatermPrev<cr>
tnoremap ]t <c-\><c-n>:FloatermNext<cr>
tnoremap [t <c-\><c-n>:FloatermPrev<cr>

Plug 'HerringtonDarkholme/yats.vim'

Plug 'roxma/vim-tmux-clipboard'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-rooter'
Plug 'm00qek/nvim-contabs'

let g:contabs#integrations#tabline#theme = 'project/path'
let g:contabs#project#locations = [
      \  { 'path': '~/.local/git/', 'depth': 2, 'git_only': v:true },
      \  { 'path': '~/.local/git/united-signals/nocode-concept/frontend/kotlin-intellijidea', 'depth': 0, 'git_only': v:false},
      \  { 'path': '~/.local/git/united-signals/nocode-concept/frontend/pdfjs-express', 'depth': 0, 'git_only': v:false},
      \  { 'path': '~/.local/git/united-signals/nocode-concept/frontend/pdfjs-express-cljs', 'depth': 0, 'git_only': v:false},
      \  { 'path': '~/.local/git/united-signals/nocode-concept/frontend/cljs-luminus', 'depth': 0, 'git_only': v:false},
      \  { 'path': '~/.local/git/united-signals/nocode-concept/many_thoughts_and_snippets/concept-reagent/', 'depth': 0, 'git_only': v:false},
      \  { 'path': '~/.local/git/playground', 'depth': 0, 'git_only': v:false, 'formatter': { _ -> 'playground' } },
      \  { 'path': '~/.local/snippets', 'depth': 0, 'git_only': v:false, 'formatter': { _ -> 'snippets' } },
      \]

nnoremap <silent> <space>fp :call contabs#project#select()<CR>
nnoremap <silent> <space>fb :call contabs#buffer#select()<CR>

Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'

nnoremap <silent> <space>Gd :<C-u>Git difftool<CR>
nnoremap <silent> <space>Gm :<C-u>Git mergtool<CR>
nnoremap <silent> <space>GP :<C-u>Git pull<CR>

Plug 'editorconfig/editorconfig-vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'

let g:user_emmet_leader_key="<c-z>"

Plug 'vim-airline/vim-airline'

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" coc-git-status integration
function! s:update_git_status()
  let g:airline_section_b = "%{get(g:,'coc_git_status','')}"
endfunction

let g:airline_section_b = "%{get(g:,'coc_git_status','')}"

autocmd User CocGitStatusChange call s:update_git_status()

Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='molokai'

Plug 'zefei/vim-wintabs'

command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtabs

map [b <Plug>(wintabs_previous)
map ]b <Plug>(wintabs_next)
map <space>bc <Plug>(wintabs_close)
map <space>bq :BCloseAll<cr>
map <space>bu <Plug>(wintabs_undo)
map <space>bo <Plug>(wintabs_only)
map <space>wc <Plug>(wintabs_close_window)
map <space>wo <Plug>(wintabs_only_window)

nnoremap <space>bn :enew<CR>
nnoremap <space>wn :tabnew<CR>
nnoremap <space>wq :WintabsCloseVimtab<CR>
nnoremap [w :tabprevious<cr>
nnoremap ]w :tabnext<cr>

Plug 'zefei/vim-wintabs-powerline'

let g:wintabs_powerline_arrow_left = "\u25b6"

" Left pointing arrow, used as previous buffers indicator.

let g:wintabs_powerline_arrow_right = "\u25c0"

" Right pointing arrow, used as next buffers indicator.

let g:wintabs_powerline_sep_buffer_transition = "\ue0b0"

" Separator between inactive and active buffers.

let g:wintabs_powerline_sep_buffer = "\ue0b1"

" Separator between inactive buffers.

let g:wintabs_powerline_sep_tab_transition = "\ue0b2"

" Separator between inactive and active vimtabs.

let g:wintabs_powerline_sep_tab = "\ue0b3"

" Separator between inactive vimtabs.

highlight link WintabsEmpty TabLineFill

" Highlight group for background.

highlight link WintabsActive TabLineSel

" Highlight group for active buffer/tab.

highlight link WintabsInactive TabLineFill

" Highlight group for inactive buffer/tab.

highlight link WintabsArrow TabLine

" Highlight group for arrows.

highlight link WintabsActiveNC TabLine

" Highlight group for active buffer/tab in not-current windows.

highlight link WintabsInactiveNC TabLine

" Highlight group for inactive buffer/tab in not-current windows.

Plug 'ludovicchabant/vim-gutentags'

set tags=./tags,tags;$HOME

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = 'tags'
let g:gutentags_file_list_command = 'rg --files'

let g:gutentags_modules = ['ctags']

let g:gutentags_cache_dir = expand('~/.local/tags')
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

Plug 'lokaltog/neoranger'

" Open ranger at current file with "-"
nnoremap <silent> <space>tf :RangerCurrentFile<CR>

" Open ranger in current working directory
nnoremap <silent> <leader>f :Ranger<CR>

" for setting ranger viewmode values
" supported values are ['multipane', 'miller']
let g:neoranger_viewmode='miller'

" this line makes ranger show hidden files by default
let g:neoranger_opts='--cmd="set show_hidden true"'

Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" useful functions
" ----------------

function! StatusDiagnostic() abort
	let info = get(b:, 'coc_diagnostic_info', {})
	if empty(info)
		return ''
	endif
	let msgs = []
	if get(info, 'error', 0)
		call add(msgs, 'E' . info['error'])
	endif
	if get(info, 'warning', 0)
		call add(msgs, 'W' . info['warning'])
	endif
	return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

let g:netrw_http_cmd = "elinks4vim"

" use system clipboard
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

set inccommand=split

syntax on
" nightandday-theme plugin takes care of this
" colorscheme monokai_pro

if &background ==# 'dark'
  hi CursorLine cterm=NONE ctermbg=black ctermfg=white guibg=#713368
else
  hi CursorLine cterm=NONE ctermbg=black ctermfg=white guibg=#E1B3D8
endif

set ruler
set number relativenumber
" set guifont=FiraCode\ Nerd\ Font\ Mono
set tabline=%!contabs#integrations#tabline#create()

set showtabline=2
set laststatus=2

" disable auto equalalways ... window dimenstions resizing auto off
" set noea

set directory=/tmp
set nobackup
set nowritebackup
set noswapfile
set nocompatible
set hidden
set encoding=utf-8
set cmdheight=1
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=200
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set mouse=a mousemodel=popup
set tabstop=2 softtabstop=0 shiftwidth=2 expandtab
set sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,options,globals,terminal,winpos,winsize"

let g:Powerline_symbols = 'fancy'

" augroup Enter Buffer on Line where I left off
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup markdown_syntax
  au!
  au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
  au BufNewFile,BufFilePre,BufRead *.MD set filetype=markdown
augroup END

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

augroup filetypedetect
  au! BufNewFile,BufFilePre,BufRead,BufReadPost *.sss.md set filetype=sugarss
augroup END

augroup foldMethodSetLocal
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave *.js setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.ts setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.jsx setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.tsx setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.clj setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.cljc setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.cljs setlocal foldmethod=syntax
  autocmd BufEnter,FocusGained,InsertLeave *.json setlocal foldmethod=indent
augroup END

noremap <space><esc> :<C-u>set relativenumber!<CR>

nnoremap <silent> [g <C-o>
nnoremap <silent> ]g <C-i>

nnoremap <silent> <space>H :call WinMove('h')<CR>
nnoremap <silent> <space>J :call WinMove('j')<CR>
nnoremap <silent> <space>K :call WinMove('k')<CR>
nnoremap <silent> <space>L :call WinMove('l')<CR>

nnoremap <leader><leader>, :edit ~/.local/git/joehannes-os/dotfiles/.config/nvim/init.vim<cr>
nnoremap <leader><leader>. :edit ~/.local/git/joehannes-os/dotfiles/.config/nvim/coc-settings.json<cr>

" lua <<EOF
" require'lspconfig'.clojure_lsp.setup{}
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"     disable = { "c", "rust" },  -- list of language that will be disabled
"   },
" }
" -- require'lspconfig'.pyright.setup{}
" -- require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
" require'fzf_lsp'.setup()
" -- commented options are defaults
" require'lspkind'.init{
"     -- with_text = true,
"     -- symbol_map = {
"     --   Text = '',
"     --   Method = 'ƒ',
"     --   Function = '',
"     --   Constructor = '',
"     --   Variable = '',
"     --   Class = '',
"     --   Interface = 'ﰮ',
"     --   Module = '',
"     --   Property = '',
"     --   Unit = '',
"     --   Value = '',
"     --   Enum = '了',
"     --   Keyword = '',
"     --   Snippet = '﬌',
"     --   Color = '',
"     --   File = '',
"     --   Folder = '',
"     --   EnumMember = '',
"     --   Constant = '',
"     --   Struct = ''
"     -- },
" }
" require'nvim-lightbulb'.update_lightbulb {
"     sign = {
"         enabled = true,
"         -- Priority of the gutter sign
"         priority = 10,
"     },
"     float = {
"         enabled = true,
"         -- Text to show in the popup float
"         text = "💡",
"         -- Available keys for window options:
"         -- - height     of floating window
"         -- - width      of floating window
"         -- - wrap_at    character to wrap at for computing height
"         -- - max_width  maximal width of floating window
"         -- - max_height maximal height of floating window
"         -- - pad_left   number of columns to pad contents at left
"         -- - pad_right  number of columns to pad contents at right
"         -- - pad_top    number of lines to pad contents at top
"         -- - pad_bottom number of lines to pad contents at bottom
"         -- - offset_x   x-axis offset of the floating window
"         -- - offset_y   y-axis offset of the floating window
"         -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
"         -- - winblend   transparency of the window (0-100)
"         win_opts = {},
"     },
"     virtual_text = {
"         enabled = false,
"         -- Text to show at virtual text
"         text = "💡",
"     }
" }
" require('lspfuzzy').setup {
"   methods = 'all',         -- either 'all' or a list of LSP methods (see below)
"   fzf_preview = {          -- arguments to the FZF '--preview-window' option
"     'right:+{2}-/2'          -- preview on the right and centered on entry
"   },
"   fzf_action = {           -- FZF actions
"     ['ctrl-t'] = 'tabedit',  -- go to location in a new tab
"     ['ctrl-v'] = 'vsplit',   -- go to location in a vertical split
"     ['ctrl-x'] = 'split',    -- go to location in a horizontal split
"   },
"   fzf_modifier = ':~:.',   -- format FZF entries, see |filename-modifiers|
"   fzf_trim = true,         -- trim FZF entries
" }
" require'lsp_signature'.on_attach()
" require'navigator'.setup()
" require('bqf').setup({
"     auto_enable = true,
"     preview = {
"         win_height = 12,
"         win_vheight = 12,
"         delay_syntax = 80,
"         border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'}
"     },
"     func_map = {
"         vsplit = '',
"         ptogglemode = 'z,',
"         stoggleup = ''
"     },
"     filter = {
"         fzf = {
"             action_for = {['ctrl-s'] = 'split'},
"             extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
"         }
"     }
" })
" EOF
