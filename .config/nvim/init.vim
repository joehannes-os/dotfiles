call plug#begin()

Plug 'fergdev/vim-cursor-hist'
nnoremap <leader>j :call g:CursorHistForward()<CR>
nnoremap <leader>k :call g:CursorHistBack()<CR>

" vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

Plug 'universal-ctags/ctags'

Plug 'frazrepo/vim-rainbow'

let g:rainbow_active = 1

Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
" use :Prettier to format file using prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>te  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>tp  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>th  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>to  :<C-u>CocList outline<cr>
" Search snippets
nnoremap <silent> <space>t*  :<C-u>CocList snippets<cr>
" Search workspace symbols
nnoremap <silent> <space>ts  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>aj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ak  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>tr  :<C-u>CocListResume<CR>
nnoremap <silent> <space>ty  :<C-u>CocList yank<cr>
nnoremap <silent> <space>td  :<C-u>CocList todolist<cr>
nnoremap <silent> <space>tg  :<C-u>CocList grep<cr>

" Cfg for ultisnip snippets
let g:ultisnips_javascript = {
\ 'keyword-spacing': 'always',
\ 'semi': 'always',
\ 'space-before-function-paren': 'always',
\ }

" Snippets
" --------
" Use <C-l> for trigger snippet expand.
imap <C-<cr>> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-<space>> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

inoremap <silent><expr> <C-TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" RangeSelections
" ---------------
" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" CodeActions
" -----------
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph

xmap <space>as  <Plug>(coc-codeaction-selected)
nmap <space>as  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <space>aa  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <space>af  <Plug>(coc-fix-current)

" ---
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <space>rn <Plug>(coc-rename)

" formatting related stuff
" ------------------------

augroup cocAutoFormat
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,typescriptreact,javascript,javascriptreact,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <space>rp  :Prettier<cr>
nnoremap <leader>.  :Fold<cr>
xmap <space>rs  <Plug>(coc-format-selected)
nmap <space>rs  <Plug>(coc-format-selected)

" diagnostics specific stuff
" --------------------------

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

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
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" show chunk diff at current position
nmap <space>gd <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <space>gc <Plug>(coc-git-commit)

nnoremap <silent> <space>gs  :<C-u>CocList --normal gstatus<CR>

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
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
let g:vista_default_executive = 'coc'

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
			\ 'javascript': 'tags',
			\ 'javascriptreact': 'tags',
			\ 'javascript.jsx': 'tags',
			\ 'typescript': 'tags',
			\ 'typescriptreact': 'tags',
			\ 'typescript.tsx': 'tags',
			\ 'scss': 'tags',
			\ 'sass': 'tags',
			\ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:15%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

set statusline+=%{NearestMethodOrFunction()}

" toggle structural view
nnoremap <space>tv :Vista!!<CR>

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
autocmd vimEnter * Vista

Plug 'zefei/vim-wintabs'

map [b <Plug>(wintabs_previous)
map ]b <Plug>(wintabs_next)
map <space>bc <Plug>(wintabs_close)
map <space>bu <Plug>(wintabs_undo)
map <space>bo <Plug>(wintabs_only)
map <space>btc <Plug>(wintabs_close_window)
map <space>bto <Plug>(wintabs_only_window)
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtabs

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

highlight link WintabsInactive TabLine

" Highlight group for inactive buffer/tab.

highlight link WintabsArrow TabLine

" Highlight group for arrows.

highlight link WintabsActiveNC TabLine

" Highlight group for active buffer/tab in not-current windows.

highlight link WintabsInactiveNC TabLine

" Highlight group for inactive buffer/tab in not-current windows.

" Plug 'qpkorr/vim-bufkill'
Plug 'wakatime/vim-wakatime'
" Plug 'mhinz/vim-startify'

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

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


Plug 'jlanzarotta/bufexplorer'

nnoremap <space>tb  :BufExplorer<CR>

Plug 'arithran/vim-delete-hidden-buffers'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_OPTS = '--layout=reverse'

function! OpenFloatingWin()
	let height = &lines - 3
	let width = float2nr(&columns - (&columns * 2 / 10))
	let col = float2nr((&columns - width) / 2)

	let opts = {
			 \ 'relative': 'editor',
			 \ 'row': 1,
			 \ 'col': col + 30,
			 \ 'width': width * 2 / 3,
			 \ 'height': height / 3
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

nnoremap ; :GFiles --recurse-submodules<Cr>

"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}

Plug 'raimondi/delimitmate'
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'

hi IndentGuidesOdd  ctermbg=magenta
hi IndentGuidesEven ctermbg=lightmagenta

let g:indent_guides_enable_on_vim_startup = 1

Plug 'honza/vim-snippets'
Plug 'brooth/far.vim'

set lazyredraw

" shortcut for far.vim find
nnoremap <silent> <space>ff  :Farf<cr>
vnoremap <silent> <space>ff  :Farf<cr>

" shortcut for far.vim replace
nnoremap <silent> <space>fr  :Farr<cr>
vnoremap <silent> <space>fr  :Farr<cr>

" Plug 'preservim/nerdcommenter'

"filetype plugin on

" Add spaces after comment delimiters by default
"let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
"let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
"let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
"let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
"let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
"let g:NERDToggleCheckAllLines = 1

" Plug 'cyansprite/Extract'

" mappings for putting
" nmap p <Plug>(extract-put)
" nmap P <Plug>(extract-Put)
"
" nmap <leader>p :ExtractPin<cr>
" nmap <leader>P :ExtractUnPin<cr>
"
" " mappings for cycling
" map <m-s> <Plug>(extract-sycle)
" ap <m-S> <Plug>(extract-Sycle)
" map <c-s> <Plug>(extract-cycle)
"
" " mappings for visual
" vmap p <Plug>(extract-put)
" vmap P <Plug>(extract-Put)
"
" " mappings for insert
" imap <m-v> <Plug>(extract-completeReg)
" imap <c-v> <Plug>(extract-completeList)
" imap <c-s> <Plug>(extract-cycle)
" imap <m-s> <Plug>(extract-sycle)
" imap <m-S> <Plug>(extract-Sycle)
"
" " mappings for replace
" nmap <silent> s <Plug>(extract-replace-normal)
" vmap <silent> s <Plug>(extract-replace-visual)
"
" Plug 'Lenovsky/nuake'

" let g:nuake_position = 'top'
" let g:nuake_per_tab = 1

Plug 'voldikss/vim-floaterm'

autocmd User Startified setlocal buflisted
hi FloatermBorder guibg=magenta guifg=cyan
set shell=/usr/bin/zsh

let g:floaterm_height=0.9
let g:floaterm_width=0.9
let g:floaterm_wintype='floating'
let g:floaterm_position='top'
let g:floaterm_winblend=10

nnoremap <space>tt :FloatermToggle<CR>
inoremap <space>tt <C-\><C-n>:FloatermToggle<CR>
tnoremap <space>tt <C-\><C-n>:FloatermToggle<CR>

" Plug 'fmoralesc/nlanguagetool.nvim'
" Plug 'sheerun/vim-polyglot'
Plug 'roxma/vim-tmux-clipboard'
" Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
" Plug 'autozimu/LanguageClient-neovim'
"Plug 'jalvesaq/vimcmdline'
" Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
"Plug 'm00qek/nvim-contabs'
Plug 'tomtom/tcomment_vim'
" Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'

nnoremap <space>tg :<C-u>Gblame<cr>
Plug 'Chun-Yang/vim-action-ag'
Plug 'editorconfig/editorconfig-vim'

Plug 'itchyny/lightline.vim'

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste'],
  \     [ 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent'],
  \     [ 'git', 'blame', 'diagnostic', 'cocstatus' ],
  \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
	\		'cocstatus': 'coc#status',
  \   'method': 'NearestMethodOrFunction',
	\   'colorscheme': 'powerline'
	\ }
\ }

let g:lightline.separator = {
\   'left': '', 'right': ''
\}

let g:lightline.subseparator = {
\   'left': '', 'right': ''
\}

let g:lightline.tabline = {
\   'left': [ ['tabs'] ],
\   'right': [ ['close'] ]
\ }

"Plug 'maximbaz/lightline-ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
"Plug 'w0rp/ale'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
" Plug 'majutsushi/tagbar'

" let g:tagbar_type_typescript = {
  " \ 'ctagstype': 'typescript',
  " \ 'kinds': [
    " \ 'c:classes',
    " \ 'n:modules',
    " \ 'f:functions',
    " \ 'v:variables',
    " \ 'v:varlambdas',
    " \ 'm:members',
    " \ 'i:interfaces',
    " \ 'e:enums',
  " \ ]
" \ }

" Plug 'severin-lemaignan/vim-minimap'

" autocmd vimenter * Minimap

" Plug 'ashisha/image.vim'
Plug 'francoiscabrol/ranger.vim'

let g:ranger_replace_netrw = 1 "// open ranger when vim open a directory

map <leader>f :Ranger<cr>

Plug 'rbgrouleff/bclose.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-obsession'

map <leader>sa :Obsess<cr>
map <leader>so :Obsess!<cr>

" Plug 'davidhalter/jedi-vim'
""Plug 'felipec/notmuch-vim'
Plug 'mkitt/tabline.vim'
Plug 'phanviet/vim-monokai-pro'
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
" Plug 'brettanomyces/nvim-editcommand'
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

" non plugin specific conf
" ------------------------
let mapleader = ","

" use system clipboard
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

set inccommand=split

syntax on
colorscheme monokai_pro

set rtp+=/home/joehannes/.config/nvim/gitted/tabnine-vim
set ruler
set number relativenumber
set termguicolors
set guifont=Hack\ NF
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}%{StatusDiagnostic()}
set showtabline=2  " Show tabline
set directory=/tmp
set nobackup
set nowritebackup
set noswapfile
set laststatus=2
set hidden
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=200
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set mouse=a mousemodel=popup
set tabstop=2 softtabstop=0 shiftwidth=2 expandtab

let g:tablineclosebutton=1
let g:Powerline_symbols = 'fancy'

hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
hi TabLine ctermfg=Blue ctermbg=Yellow

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

noremap <space><esc> :<C-u>set relativenumber!<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <space>bn :enew<CR>
nnoremap <space>bd :BD<CR>
nnoremap <space>bt :tabnew<CR>
nnoremap [t :tabprevious<cr>
nnoremap ]t :tabnext<cr>

