set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

" Vundle configuration =======================================================================
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"Uncomment to prevent :PluginClean from removing Vundle
"Plugin 'VundleVim/Vundle.vim'

" plugins on GitHub
Plugin 'Lokaltog/vim-easymotion'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'qpkorr/vim-bufkill'
Plugin 'itchyny/lightline.vim'
Plugin 'milkypostman/vim-togglelist'
Plugin 'simeji/winresizer'
Plugin 'godlygeek/tabular'
Plugin 'yurifury/hexhighlight'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-speeddating'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'majutsushi/tagbar'
Plugin 'freitass/todo.txt-vim'
Plugin 'keith/swift.vim'
Plugin 'christoomey/vim-tmux-navigator'

"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-notes'
"Plugin 'vim-scripts/The-NERD-Commenter'

"" plugins from http://vim-scripts.org/vim/scripts.html
Bundle 'bufferlist.vim'
"Bundle 'grep.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" =======================================================================

set nobackup
set noswapfile

" Gives some margin lines when scrolling up/down with cursor.
set scrolloff=3

" Don't break lines in the middle of a word.
set linebreak

set ruler			" show the cursor position all the time

set expandtab        " convert tabs to spaces.
set tabstop=4
set softtabstop=4
set shiftwidth=4

set ignorecase
set smartcase

set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme cloudy
set background=dark
set cursorline
set number

" Set window title for good integration with tmux. Sometimes we start vim
" indirectly (i.e. by piping or via fasd), which results in window title being
" set to 'sh', 'zsh', or similar. And our tmux navigation bindings depend on
" the vim's window having a string 'vim' in it.
set title
set titlestring=nvim

" Open command line without Shift key.
nnoremap ; :

" Stay on searched word
nnoremap * *N

" BufferList config
hi BufferSelected term=NONE ctermfg=white ctermbg=blue cterm=bold
hi BufferNormal term=NONE ctermfg=white ctermbg=black cterm=NONE
let g:BufferListWidth = 20
let g:BufferListMaxWidth = 40

" New settings (after switching to neovim).
" -----------------------------------------------------------------------------

" Add all subdirs of the current working dir to path (recursively).
set path+=**

" Use system clipboard for yanking and pasting.
set clipboard+=unnamedplus

" Selection bar/menu used e.g. by :find command.
set wildmenu

" Source the init.vim file after saving it
"if has("autocmd")
"    if !exists("autocommands_loaded")
"        let autocommands_loaded = 1
"        autocmd bufwritepost init.vim source $MYVIMRC
"    endif
"endif

" winresizer configuration
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
let g:winresizer_finish_with_escape = 1
let g:winresizer_start_key = '<C-?>'

source ~/.config/nvim/keymap.vim

" Easymotion customization
" ---------------------------------------------------------------------
let g:EasyMotion_grouping = 1
let g:EasyMotion_keys = 'xcvmbsghlwertyuinodk,fj'
" let g:EasyMotion_grouping = 2
" let g:EasyMotion_keys = ' fjdkxcvmosghl.wertyuinb,'
"
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 1

" Nerdtree customization
" ---------------------------------------------------------------------
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeCascadeSingleChildDir = 0


" Lightline customization
" ---------------------------------------------------------------------
let g:lightline = {
    \ 'colorscheme': 'cloudy',
    \ }

" Orgmode customization
" ---------------------------------------------------------------------
" Indent body text under headings?
let g:org_indent = 1

" ---------------------------------------------------------------------

" Set external formatter for XML files
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

set foldcolumn=0
set viewoptions=cursor,folds,slash,unix

