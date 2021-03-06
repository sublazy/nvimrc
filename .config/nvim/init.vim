set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim

" Vundle configuration =======================================================================
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

"Uncomment to prevent :PluginClean from removing Vundle
"Plugin 'VundleVim/Vundle.vim'

" plugins on GitHub
Plugin 'junegunn/fzf'
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
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/restore_view.vim'
Plugin 'majutsushi/tagbar'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'zah/nim.vim'

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

set clipboard+=unnamedplus

" Open command line without Shift key.
nnoremap ; :

" Stay on searched word
nnoremap * *N

" BufferList config
hi BufferSelected term=NONE ctermfg=white ctermbg=blue cterm=bold
hi BufferNormal term=NONE ctermfg=white ctermbg=black cterm=NONE
let g:BufferListWidth = 20
let g:BufferListMaxWidth = 40

" Remove Trailing Whitespace
command! Rtw %s/\s\+$//e

" New settings (after switching to neovim).
" -----------------------------------------------------------------------------

" Add all subdirs of the current working dir to path (recursively).
set path+=**

" Use system clipboard for yanking and pasting.
set clipboard+=unnamedplus

" Selection bar/menu used e.g. by :find command.
set wildmenu

function! s:winnr_below()
    wincmd j
    let result = winnr()
    wincmd k
    return result
endfunction

function! s:win_below_exists()
    let id_below = s:winnr_below()
    echo id_below
    if id_below != winnr()
        return id_below
    else
        return 0
endfunction

function! s:close_win(target)
    if a:target != 0
        exe a:target . "windo quit"
    endif
endfunction

" TODO start insert also in terminals entered via fzf.
autocmd TermOpen * set nonumber | startinsert
autocmd BufEnter term://* startinsert

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

" see :help 'shada'
set shada=!,'100,<1,s1

" Use ripgrep
set grepprg=rg\ --vimgrep\ --trim

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

" FZF customization
" ---------------------------------------------------------------------
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_layout = { 'window': '10split enew' }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-i': 'vsplit' }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Keyword'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" ---------------------------------------------------------------------

function! s:fasd_update() abort
    if empty(&buftype) || &filetype ==# 'dirvish'
        call jobstart(['fasd', '-A', expand('%:p')])
    endif
endfunction
augroup fasd
    autocmd!
    autocmd BufWinEnter,BufFilePost * call s:fasd_update()
augroup END

function! s:list_all_buffers() abort
    let bufs = []
    for buf in getbufinfo({'bufloaded':1})
        call add(bufs, buf.name)
        "echo "buf: " . buf.name
    endfor
    let bufs_as_string = string(bufs)
    return bufs
endfunction

function! s:fasd_recent_files()
    let files = split(execute('!fasd -flt', "silent!"), "\n")
    call remove(files, 0, 1)
    "for f in files
    "    echo "file: " . f
    "endfor
    return files
endfunction

function! s:files_and_buffers()
    let items = []
    let files = s:fasd_recent_files()
    let buffers = s:list_all_buffers()
    let items = extend(items, files)
    let items = extend(items, buffers)
    " let items = uniq(sort(extend(items, buffers)))

    " for item in items
    "     echo "item: " . item
    " endfor
    return items
endfunction

" For recent files, not necessarily in the current tree
command! FasdFile call fzf#run(fzf#wrap({'source': 'fasd -flt', 'options': '--no-sort --tac --tiebreak=index'}))

" For switching into a recent dir, not necessarily in the current tree
command! FasdDir call fzf#run(fzf#wrap({'source': 'fasd -dlt', 'options': '--no-sort --tac --tiebreak=index'}))

command! FileHist call fzf#run(fzf#wrap({'source': v:oldfiles}))

command! FzfBuffers call fzf#run(fzf#wrap({'source': s:list_all_buffers()}))

command! FzfAll call fzf#run(fzf#wrap({'source': s:files_and_buffers(), 'options': '--tac --tiebreak=index'}))

command! TestAllBufs call s:list_all_buffers()
command! TestRecentFiles call s:fasd_recent_files()

noremap ,b :make -j<cr>
noremap ,t :make test<cr>

" Set external formatter for XML files
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

set foldcolumn=0
set viewoptions=cursor,folds,slash,unix

