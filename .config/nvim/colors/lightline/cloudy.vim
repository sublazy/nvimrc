" =============================================================================
" Filename: autoload/lightline/colorscheme/cloudy.vim
" Author: sublazy
" License: MIT License
" Based On: PaperColor_dark by TKNGUE
" =============================================================================

" Palette
let s:red = '#df0000'
let s:green = '#008700'
let s:blue = '#00afaf'

let s:pink = '#afdf00'
let s:olive = '#dfaf5f'
let s:navy = '#df875f'

let s:orange = '#d75f00'
let s:purple = '#8959a8'
let s:aqua = '#3e999f'

let s:kashmir       = "#586A8A"
let s:kashmir_d     = "#4E5E7A"
let s:kashmir_dd    = "#44536B"
let s:kashmir_ddd   = "#3A475C"
let s:kashmir_dddd  = "#303B4D"

let s:cloud         = "#3A475C"
let s:cloud_d       = "#374357"
let s:cloud_dd      = "#343F52"
let s:cloud_ddd     = "#313B4D"
let s:cloud_dddd    = "#2D3747"
let s:cloud_ddddd   = "#272F3D"

let s:mirage         = "#1D283C"
let s:mirage_d       = "#192233"
let s:mirage_dd      = "#151D2B"
let s:mirage_ddd     = "#141B29"
let s:mirage_dddd    = "#0F141F"

" Fancy colors
let s:persian_plum  = "#663333"
let s:green_house   = "#336633"
let s:sahara        = "#a88800"
let s:lemon         = "#DBB100"
let s:wild_rice     = "#CDB75B"

" Basics:
let s:foreground = '#d0d0d0'
let s:background = s:cloud_dddd
let s:window = '#efefef'
let s:status = '#c6c6c6'
let s:error = '#5f0000'

" Tabline:
let s:tabline_bg = '#3a3a3a'
let s:tabline_active_fg = '#1c1c1c'
let s:tabline_active_bg = '#00afaf'
let s:tabline_inactive_fg = '#c6c6c6'
let s:tabline_inactive_bg = '#585858'

" Statusline:
let s:statusline_active_fg = '#1c1c1c'
let s:statusline_active_bg = '#5f8787'
let s:statusline_inactive_fg = '#c6c6c6'
let s:statusline_inactive_bg = '#444444'

" Visual:
let s:visual_fg = '#000000'
let s:visual_bg = '#8787af'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.right = [ [ s:foreground, s:background ], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.normal.middle = [ [ s:statusline_active_fg, s:statusline_active_bg ]]
let s:p.inactive.right = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.left = [ [ s:foreground, s:background ], [ s:foreground, s:background ] ]
let s:p.inactive.middle = [ [ s:foreground, s:background ], ]
let s:p.insert.left = [ [ s:background, s:lemon], [ s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.insert.middle = [ [ s:statusline_active_fg, s:lemon ]]
let s:p.replace.left = [ [ s:background, s:pink ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.visual.left = [ [ s:visual_fg, s:visual_bg ], [s:statusline_active_fg, s:status ], [ s:statusline_active_fg, s:statusline_active_bg ] ]
let s:p.tabline.left = [ [s:tabline_inactive_fg, s:tabline_inactive_bg ]]
let s:p.tabline.tabsel = [ [s:tabline_active_fg, s:tabline_active_bg ] ]
let s:p.tabline.middle = [ [s:tabline_bg, s:tabline_bg]]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:background, s:error ] ]

let g:lightline#colorscheme#cloudy#palette = lightline#colorscheme#fill(s:p)
