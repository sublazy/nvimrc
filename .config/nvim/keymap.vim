inoremap <F1>     <nop>
nnoremap <BS>     <nop>
nnoremap <C-H>    <nop>

" Navigate within wrapped lines
map j g<Down>
map k g<Up>

let mapleader = "\<space>"

nnoremap <leader>ve :e! $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>
nnoremap <leader>vk :e! ~/.config/nvim/keymap.vim<cr>

" Open the command line
nnoremap <leader>k :

nnoremap <leader>q :q!<cr>
nnoremap <leader>xx :x!<cr>
nnoremap <leader>w :w!<cr>

" Save the file as root
cmap ww w !sudo tee >/dev/null %

nnoremap <leader>pl :PluginList<cr>
nnoremap <leader>pi :PluginInstall<cr>
nnoremap <leader>pc :PluginClean<cr>
nnoremap <leader>pu :PluginUpdate<cr>
nnoremap <leader>pd :PluginDocs<cr>

nnoremap <leader>tl :tabnext<cr>
nnoremap <leader>th :tabprev<cr>
nnoremap <leader>tt :tabnew<cr>
nnoremap <leader>tx :tabclose<cr>
nnoremap <leader>ti :tabs<cr>

" Visually select a word
noremap vo viw

" shortcuts for windows {{{
" <http://stackoverflow.com/questions/9092982/mapping-c-j-to-something-in-vim>
let g:C_Ctrl_j = 'off'
let g:BASH_Ctrl_j = 'off'
" nnoremap <M-h> <C-w>h
" nnoremap <M-j> <C-w>j
" nnoremap <M-k> <C-w>k
" nnoremap <M-l> <C-w>l

nnoremap <space>wh <C-w>h
nnoremap <space>wj <C-w>j
nnoremap <space>wk <C-w>k
nnoremap <space>wl <C-w>l
"}}}

" Exit to normal mode in terminal.
tnoremap <C-o> <C-\><C-n>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <A-C-j> <C-e>
nnoremap <A-C-k> <C-y>

" Movement in command line and insert mode
noremap! <C-j> <down>
noremap! <C-k> <up>
noremap! <C-h> <left>
noremap! <C-l> <right>
noremap! <C-b> <C-left>
noremap! <C-w> <C-right>
noremap! <C-space> <return>

nnoremap <leader>wi :vsp<cr>
nnoremap <leader>w- :sp<cr>
nnoremap <leader>wr :WinResizerStartResize<cr>

" vim-togglelist: remove default mappings
let g:toggle_list_no_mappings = 1

" toggles

" QuickFix list navigation
" make; down
nnoremap <leader>mj :cnewer<cr>
" make; up
nnoremap <leader>mk :colder<cr>


" Bubble lines up/down
"nnoremap - ddp
"nnoremap _ ddkP

nnoremap <leader>8
    \ :grep
    \ --ignore-case
    \ --iglob "*.[ch]"
    \ <cword>

" nnoremap <leader>dt :<C-u>Denite tag:. -mode=normal<cr>
" nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<cr>
" nnoremap <leader>hl :<C-u>Denite location_list -mode=normal -no-empty<cr>
" nnoremap <leader>hs :<C-u>Denite history:search -mode=normal<cr>
" nnoremap <leader>hc :<C-u>Denite history:cmd -mode=normal<cr>
"

" Show syntax highlighting groups for word under cursor
nnoremap <C-S-P> :call <SID>SynStack()<cr>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" g layer -- going to places, within a buffer
" ------------------------------------------------------------------------------
"  keys left:
" r y s d g z x c v [ ] ; ' , . / <space>

map gj <Plug>(easymotion-j)
map gk <Plug>(easymotion-k)
map ,, <Plug>(easymotion-s)
map gw <Plug>(easymotion-w)
map gb <Plug>(easymotion-b)
map ge <Plug>(easymotion-e)
map gW <Plug>(easymotion-W)
map gB <Plug>(easymotion-B)
map gE <Plug>(easymotion-E)
" go - land On the character
" gf is taken by go-file
map go <Plug>(easymotion-f)
map gt <Plug>(easymotion-t)
map gF <Plug>(easymotion-F)
map gT <Plug>(easymotion-T)
map gn <Plug>(easymotion-n)
map gN <Plug>(easymotion-N)

" line start/end
noremap gh 0
noremap gl $

" matching parenthesis
noremap gp %

" mark
nnoremap gm '

" previous (left) historical location (jumplist)
" u - undo
nnoremap gu <C-O>
nnoremap <C-O> <nop>

" next (right) historical location (jumplist)
" i - is right to the 'u'
nnoremap gi <C-I>
nnoremap <C-I> <nop>

noremap gxu gu
noremap gxU gU

" top of the buffer
" noremap gq gg

" bottom of the buffer
" noremap ga G

"" go to line number (absolute) in the buffer (already at '<number>G')
"nnoremap gn

" j layer -- jumping to places, possibly to different buffers or windows
" Observation: having <leader> really makes things harder.
" ------------------------------------------------------------------------------
" link, tag
nnoremap <leader>jl <C-]>

" file or path under the cursor
nnoremap <leader>jf gf

" other (most recent) buffer (alternate)
nnoremap <leader>jo <C-^>

" tag, with possible selection from multiple matches.
nnoremap <leader>jt :tselect<cr>

" previous (left) quicklist item (error, grep result)
nnoremap <leader>j] :cnext<cr>

" next (right) quicklist item (error, grep result)
nnoremap <leader>j[ :cprev<cr>

" TODO URL
nnoremap <leader>ju <nop>

" l layer -- toggles
" ------------------------------------------------------------------------------
nnoremap <leader>ln :set number!<cr>
nnoremap <leader>lg :set hlsearch!<cr>
nnoremap <leader>lk :nohlsearch<cr>
nnoremap <leader>lm :call ToggleQuickfixList()<cr>
nnoremap <leader>ll :call ToggleLocationList()<cr>
nnoremap <leader>lv :GitGutterToggle<cr>
nnoremap <leader>li :set formatoptions+=a<cr>
nnoremap <leader>lo :set formatoptions-=a<cr>
nnoremap <leader>lt :NERDTreeToggle<cr>
nnoremap <leader>lw :set wrap!<cr>
nnoremap <leader>lj :TagbarToggle<cr>
" ~f~ autoformatting
" ~s~
" ~h~ hard wrapping of long lines
" ~g~ grep results - highlighting of match occurences
" ~n~ line numbers in the fringe
" ~r~ ruler (last column indicator)
" ***     l: toggles
" ****  ~l~ location list
" ****  ~f~ autoformatting (same as above?)
" ****  ~s~
" ****  ~j~ tagbar
" **** ~h~ hard wrapping of long lines
" **** ~g~ grep results - highlighting of match occurences
" **** ~m~ make results (quicklist)
" **** ~n~ line numbers in the fringe
" **** ~r~ ruler (last column indicator)
" **** ~c~ syntax coloring
" **** ~t~ automatic tag generation
" **** ~i~ source code indexing
" **** ~w~ wrapping of long lines (soft)
" **** ~e~ errors (spell checking)
" **** ~x~ comment [nv]
" **** ~a~ file outline (help, man)
" [nv] - normal and visual modes maps
" **** prime keys left: d j s spc
" **** keys left: q w y u p ; z v b

" v layer -- version control
" ------------------------------------------------------------------------------
nnoremap <leader>vs :Gstatus<cr>
nnoremap <leader>vl :Glog<cr>
nnoremap <leader>vh :Gllog<cr>

" f layer -- files
" ------------------------------------------------------------------------------
" file explorer
nnoremap <leader>fe :edit .<cr>
" File explorer, go to directory of the currently focused (work) buffer.
" See :help cmdline-special for explanation of the magic string.
nnoremap <leader>fw :edit %:p:h<cr>
" file save
nnoremap <leader>fs :w!<cr>
nnoremap <silent> <buffer> <cr> :call nerdtree#ui_glue#invokeKeyMap(g:NERDTreeMapActivateNode)<cr>

nnoremap <leader>ff :FZF --cycle<cr>

" Recent files
nnoremap <silent> <leader>fr :FasdFile<cr>

" Recent directories
nnoremap <silent> <leader>fd :FasdDir<cr>

" File history (like fr, but files are obtained from shada file)
nnoremap <silent> <leader>fh :FileHist<cr>

" Reload the file
nnoremap <leader>fl :e!<cr>

" b layer -- buffers
" ------------------------------------------------------------------------------
"nnoremap <leader>bb <FREE BINDING> <cr>
nnoremap <leader>bi :call BufferList()<cr>

" bufkill, leave current window intact
nnoremap <leader>bd :BD!<cr>

nnoremap <leader>bh :bprev<cr>
nnoremap <leader>bl :bnext<cr>

" p layer -- projects
" ------------------------------------------------------------------------------
nnoremap <leader>pc :make<cr>

" x layer -- text transformations
" ------------------------------------------------------------------------------
map <leader>xc <Plug>Commentary
nmap <leader>xl <Plug>CommentaryLine
noremap <leader>xu gu
noremap <leader>xU gU

" Seamless tmux/vim pane navigation
" ------------------------------------------------------------------------------
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-/> :TmuxNavigatePrevious<cr>

" HexHighlight plugin
" ------------------------------------------------------------------------------
" <leader><F2> toggles highlighting.

