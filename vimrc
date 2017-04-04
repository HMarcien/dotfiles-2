" 工欲善其事，必先利其器"
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" 自动加载插件
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')

" 外观{
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'morhetz/gruvbox'
    Plug 'lifepillar/vim-wwdc16-theme'
    Plug 'KeitaNakamura/neodark.vim'
    Plug 'crusoexia/vim-monokai'
    Plug 'tyrannicaltoucan/vim-quantum'
    Plug 'tomasr/molokai'
    Plug 'nanotech/jellybeans.vim'
    Plug 'roosta/vim-srcery'
    Plug 'google/vim-colorscheme-primary'
    Plug 'lifepillar/vim-wwdc16-theme'
    Plug 'tpope/vim-markdown'
    "Plug 'reedes/vim-colors-pencil '
    Plug 'altercation/vim-colors-solarized'
	Plug 'edkolev/tmuxline.vim'
	" Windows choose,Just pree '-'.
    Plug 't9md/vim-choosewin'
	" Splash Screens, intent.putExtra , BatteryProfile.class, Boot Screen
	Plug 'mhinz/vim-startify'
    Plug 'gko/vim-coloresque'
    Plug 'jiangmiao/auto-pairs'
    Plug 'junegunn/limelight.vim'
    Plug 'chriskempson/tomorrow-theme'
"}

" 提高插件{
    "成对生成(),{},[]。
    "Plug 'Raimondi/delimitMate'
    Plug 'tpope/vim-surround'
    Plug 'ryanoasis/vim-devicons'
    Plug 'kien/ctrlp.vim' 
    Plug 'majutsushi/tagbar'
    Plug 'ervandew/supertab'    
    Plug 'scrooloose/nerdtree'
    "Plug 'scrooloose/syntastic'
    Plug 'w0rp/ale'
    
"}

" 前端 {
    Plug 'mattn/emmet-vim'
    Plug 'pangloss/vim-javascript'
" }
" 自动完成{
    " Track the engine.
    Plug 'SirVer/ultisnips'

    " Snippets are separated from the engine. Add this if you want them:
    Plug 'honza/vim-snippets'
" }

call plug#end()
" setting{
    source ~/.vim/config/general.vim
    source ~/.vim/config/airline.vim
    source ~/.vim/config/choosewin.vim
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

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



let g:airline_powerline_fonts = 1
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h15
set guifont=DejaVu\ Sans\ Mono\ Bold\ Nerd\ Font\ Complete:h15

" NerdTree seting
" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']


" limelight
"
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

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

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
