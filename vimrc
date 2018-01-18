"工欲其事，必先利其器"
let mapleader = "\<SPACE>"
" basic settings


set ignorecase smartcase           " 搜索忽略大小写，但有大写字母时仍保持大小写敏感
set hlsearch                       " 高亮搜索
set incsearch                      " 增量式搜索,逐字符高亮

"操作
set clipboard+=unnamed             " 共享剪切板
set showcmd                        " 输入的命令显示出来
set iskeyword+=_,$,@,%,#,-         " 带有如下符号的单词不要被换行分割
set noexpandtab                    " 不用空格代替Tab (makefile是会经常用Tab的)
set tabstop=4                      " Tab 键的宽度
set shiftwidth=4                   " 行交错宽度
set mouse=a                        " 鼠标可用
set autoindent                     " 继承前一行的缩进方式，特别适用于多行注释

"备份
"set confirm                        " 未保存或者只读时，弹出确认
set nobackup                       " 不生成备份文件
setlocal noswapfile                " 不生成 swap 文件
set bufhidden=hide                 " 当 buffer 被丢弃的时候隐藏
set noerrorbells                   " 不发出警告声

"解码
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936
set cursorline


"记住上次打开位置
 " Only do this part when compiled with support for autocommands
 if has("autocmd")
 " In text files, always limit the width of text to 78 characters
 autocmd BufRead *.txt set tw=78
 " When editing a file, always jump to the last cursor position
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
 \ endif
 endif
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
	echo "Installing Vim-plug..."
	echo ""
	silent !mkdir -p ~/.config/vim/autoload
	silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let vim_plug_just_installed = 1
endif

" 自动加载插件
if vim_plug_just_installed
	:execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.config/vim/plugged')

" 外观{
Plug 'chriskempson/tomorrow-theme'
Plug 'rakr/vim-one'
Plug 'lifepillar/vim-wwdc16-theme'
Plug 'tomasr/molokai'
Plug 'google/vim-colorscheme-primary'
Plug 'tpope/vim-markdown'
Plug 't9md/vim-choosewin'
Plug 'mhinz/vim-startify'
Plug 'gko/vim-coloresque'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'reedes/vim-colors-pencil'
Plug 'nightsense/seabird'
Plug 'ayu-theme/ayu-vim'
Plug 'posva/vim-vue'
Plug 'majutsushi/tagbar'
Plug 'luochen1990/rainbow'
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
" font-dev
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-haml'
Plug 'toyamarinyon/vim-swift'
"=============================
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
" snips
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/indentpython.vim'
"Plug 'ryanoasis/vim-devicons'
Plug 'brettanomyces/nvim-terminus'
Plug 'scrooloose/nerdcommenter'
Plug 'roxma/nvim-completion-manager'
"}

call plug#end()
"load setting{
    " source ~/.vim/config/choosewin.vim
" }
" ============================================================================
" Install plugins the first time vim runs
if vim_plug_just_installed
	echo "Installing Bundles, please ignore key map error messages"
	:PlugInstall
endif
" ============================================================================
" Vim settings and mappings
" You can edit them as you wish
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2  "选中root即设置为当前目录
let NERDTreeQuitOnOpen=0 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeMinimalUI=1 "不显示帮助面板
let NERDTreeDirArrows=1 "目录箭头 1 显示箭头  0传统+-|号
let NERDTreeIgnore=['\.pyc','\~$','\.swp'] " 忽略一下文件的显示
let g:nerdtree_tabs_open_on_console_startup=1 " 在终端启动vim时，共享NERDTree

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:airline_powerline_fonts = 1

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']


" limelight
"
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
set nonu

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

nmap <Leader>l <Plug>(Limelight)

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7

" set winwidth=79

if has('gui_running')
	set lines=60 columns=108 linespace=0
	set clipboard+=unnamed 		" 共享剪贴板
	set cindent " html 标签配对
	"set guioptions=l
	"set guioptions=r
	set guioptions=

	set termguicolors     " enable true colors support
	" let ayucolor="light"  " for light version of theme
	"let ayucolor="mirage" " for mirage version of theme
	let ayucolor="dark"   " for dark version of theme
	colorscheme ayu
	"set guifont=DejaVu\ Sans\ Mono\ Bold\ for\ Powerline\ Nerd\ Font\ Complete:h14
	set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h14
else
  	set termguicolors     " enable true colors support
	"let ayucolor="light"  " for light version of theme
	"let ayucolor="mirage" " for mirage version of theme
	let ayucolor="dark"   " for dark version of theme
	colorscheme ayu
endif



autocmd FileType vue syntax sync fromstart

nmap <F8> :TagbarToggle<CR>



set shiftwidth=2
set showmatch
set smartcase
set smarttab
set splitbelow
set splitright

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

let g:UltiSnipsExpandTrigger="<tab>"
" 跳至下个 tab stop
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

let g:user_emmet_expandabbr_key = '<TAB>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,xml EmmetInstall

" choosewin
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1

" neocommander
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" set status bar
 

