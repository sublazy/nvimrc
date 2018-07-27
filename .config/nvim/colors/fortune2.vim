" nvim Color File
" Name:       fortune.vim
" Version:    1.0
" Maintainer: github.com/sublazy
" License:    The MIT License (MIT)
" Based On:   flatcolor by github.com/MaxSt

" Initial setup
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='fortune'
set background=dark

if ! exists("g:fortune_termcolors")
  let g:fortune_termcolors = 256
endif

" not all terminals support italics properly.  If yours does, opt-in.
if ! exists("g:fortune_terminal_italics")
  let g:fortune_terminal_italics = 0
endif

" black-to-white scale
let s:bwff = { "gui": "#ffffff", "cterm": "231", "cterm16" : "231" }
let s:bwf0 = { "gui": "#f0f0f0", "cterm": "240", "cterm16" : "240" }
let s:bwe0 = { "gui": "#e0e0e0", "cterm": "240", "cterm16" : "240" }
let s:bwd0 = { "gui": "#d0d0d0", "cterm": "240", "cterm16" : "240" }
let s:bwc0 = { "gui": "#c0c0c0", "cterm": "240", "cterm16" : "240" }
let s:bwb0 = { "gui": "#b0b0b0", "cterm": "240", "cterm16" : "240" }
let s:bwa0 = { "gui": "#a0a0a0", "cterm": "240", "cterm16" : "240" }
let s:bw90 = { "gui": "#909090", "cterm": "240", "cterm16" : "240" }
let s:bw80 = { "gui": "#808080", "cterm": "240", "cterm16" : "240" }
let s:bw70 = { "gui": "#707070", "cterm": "240", "cterm16" : "240" }
let s:bw60 = { "gui": "#606060", "cterm": "240", "cterm16" : "240" }
let s:bw50 = { "gui": "#505050", "cterm": "240", "cterm16" : "240" }
let s:bw40 = { "gui": "#404040", "cterm": "240", "cterm16" : "240" }
let s:bw30 = { "gui": "#303030", "cterm": "240", "cterm16" : "240" }
let s:bw20 = { "gui": "#202020", "cterm": "240", "cterm16" : "240" }
let s:bw17 = { "gui": "#171717", "cterm": "240", "cterm16" : "240" }
let s:bw10 = { "gui": "#101010", "cterm": "240", "cterm16" : "240" }
let s:bw00 = { "gui": "#000000", "cterm": "0",   "cterm16" : "0"   }

" Base colors
let s:red       = {"gui": "#ef4040" , "cterm": "204" , "cterm16": "1"}
let s:red_d     = {"gui": "#ef2929" , "cterm": "203" , "cterm16": "9"}
let s:green     = {"gui": "#8ae234" , "cterm": "120" , "cterm16": "2"}
let s:green_d   = {"gui": "#4e9a06" , "cterm": "119" , "cterm16": "10"}
let s:yellow    = {"gui": "#fcaf3e" , "cterm": "228" , "cterm16": "3"}
let s:yellow_d  = {"gui": "#ce5c00" , "cterm": "215" , "cterm16": "11"}
let s:blue      = {"gui": "#729fcf" , "cterm": "159" , "cterm16": "4"}
let s:blue_d    = {"gui": "#3465a4" , "cterm": "75"  , "cterm16": "12"}
let s:purple    = {"gui": "#ad7fa8" , "cterm": "141" , "cterm16": "5"}
let s:purple_d  = {"gui": "#75507b" , "cterm": "135" , "cterm16": "13"}
let s:purple_dd = {"gui": "#573C5C" , "cterm": "135" , "cterm16": "13"}
let s:cyan      = {"gui": "#34e2e2" , "cterm": "122" , "cterm16": "6"}
let s:cyan_d    = {"gui": "#06989a" , "cterm": "121" , "cterm16": "14"}
let s:cyan_dd   = {"gui": "#046365" , "cterm": "121" , "cterm16": "14"}

" Background colors
let s:mirage         = { "gui": "#1D283C", "cterm": "0", "cterm16" : "0" }
"let s:mirage         = { "gui": "#384F77", "cterm": "0", "cterm16" : "0" }
let s:mirage_d       = { "gui": "#192233", "cterm": "0", "cterm16" : "0" }
let s:mirage_dd      = { "gui": "#151D2B", "cterm": "0", "cterm16" : "0" }
let s:mirage_ddd     = { "gui": "#141B29", "cterm": "0", "cterm16" : "0" }
let s:mirage_dddd    = { "gui": "#0F141F", "cterm": "0", "cterm16" : "0" }

" Fancy colors
let s:persian_plum   = { "gui": "#663333", "cterm": "0", "cterm16" : "0" }
let s:green_house    = { "gui": "#336633", "cterm": "0", "cterm16" : "0" }
let s:sahara         = { "gui": "#a88800", "cterm": "0", "cterm16" : "0" }
let s:lemon          = { "gui": "#C7A100", "cterm": "0", "cterm16" : "0" }
let s:wild_rice      = { "gui": "#CDB75B", "cterm": "0", "cterm16" : "0" }

" Background colors for diff
let s:diff_bgr   = { "gui": "#34191c", "cterm": "0", "cterm16" : "0" }
let s:diff_bgg   = { "gui": "#202c23", "cterm": "0", "cterm16" : "0" }
let s:diff_bgb   = { "gui": "#0C3341", "cterm": "0", "cterm16" : "0" }


let s:bg              = s:mirage
let s:bg_subtle       = s:mirage_d
let s:dark_d          = s:mirage_dd
let s:norm            = s:bwe0
let s:norm_subtle     = s:bwb0
let s:visual          = s:mirage_dddd

let s:head_a         = s:yellow
let s:head_b         = s:sahara
let s:head_c         = s:lemon

" shamelessly stolen from hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  " Not all terminals support italics properly. If yours does, opt-in.
  if g:fortune_terminal_italics == 0 && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
    unlet a:style.cterm
  endif
  if g:fortune_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" common groups ================================================================
" (see `:h w18`)

call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("Comment",       {"fg": s:bw70, "gui": "none", "cterm": "none"})

call s:h("String",        {"fg": s:cyan_d})

call s:h("Constant",      {"fg": s:purple})
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant

call s:h("Identifier",    {"fg": s:purple})
hi! link Function         Identifier

call s:h("Statement",     {"fg": s:yellow})
hi! link Conditonal       Statement
hi! link Exception        Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Operator         Statement
hi! link Keyword          Statement

call s:h("PreProc",       {"fg": s:lemon})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",          {"fg": s:blue})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:cyan})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined", {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",     {"fg": s:bg})
call s:h("Error",      {"fg": s:bwff, "bg": s:red_d , "gui": "bold", "cterm": "bold" })
call s:h("Todo",       {"fg": s:bwa0, "bg": s:mirage_d, "gui": "bold", "cterm": "bold" })

" ui chrome ====================================================================
" ordered according to `:help hitest.vim`

call s:h("SpecialKey",    {"fg": s:blue})
call s:h("NonText",       {"fg": s:dark_d})
call s:h("Directory",     {"fg": s:blue, "gui": "bold", "cterm": "bold"})
call s:h("ErrorMsg",      {"fg": s:red_d})
call s:h("IncSearch",     {"bg": s:bw00, "fg": s:green})
call s:h("Search",        {"bg": s:bw17, "fg": s:yellow})
call s:h("MoreMsg",       {"fg": s:bw70, "gui": "bold", "cterm": "bold"})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:bw50, "bg": s:bg})
call s:h("CursorLineNr",  {"bg": s:bg, "fg": s:bw90})
call s:h("EndOfBuffer",   {"fg": s:bw90})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:dark_d})
call s:h("Conceal",       {"fg": s:norm})
call s:h("StatusLineNC",  {"bg": s:dark_d, "fg": s:bw70})
call s:h("VertSplit",     {"fg": s:mirage_dddd, "bg": s:mirage})
call s:h("Title",         {"fg": s:blue_d})
call s:h("Visual",        {"bg": s:visual})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:yellow, "bg": s:bw10})
call s:h("Folded",        {"bg": s:mirage, "fg": s:bwa0})
call s:h("FoldColumn",    {"fg": s:bw50, "gui": "bold", "cterm": "bold"})
call s:h("QuickFixLine",  {"bg": s:mirage_ddd, "gui": "bold", "cterm": "bold"})
call s:h("qfFileName",    {"fg": s:yellow})
call s:h("qfLineNr",    {"fg": s:yellow})

call s:h("DiffAdd"    , {"fg": s:bwf0         , "bg": s:green_house})
call s:h("DiffDelete" , {"fg": s:persian_plum , "bg": s:persian_plum})
call s:h("DiffChange" , {"fg": s:norm         , "bg": s:mirage_ddd})
call s:h("DiffText"   , {"fg": s:yellow       , "bg": s:bw10})

call s:h("diffAdded"     , {"fg": s:green  , "bg": s:mirage})
call s:h("diffRemoved"   , {"fg": s:red    , "bg": s:mirage})
call s:h("diffFile"      , {"fg": s:yellow , "bg": s:mirage})
call s:h("diffIndexLine" , {"fg": s:yellow , "bg": s:mirage})
call s:h("diffLine"      , {"fg": s:cyan   , "bg": s:mirage})
call s:h("diffSubname"   , {"fg": s:cyan   , "bg": s:mirage})

call s:h("SignColumn",    {"fg": s:green})


if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:red_d})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:green})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:red})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:green_d})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:red_d})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:green})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:red})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:green_d})
endif

call s:h("Pmenu"      , {"fg": s:norm   , "bg": s:mirage_dd})
call s:h("PmenuSel"   , {"fg": s:green , "bg": s:mirage_dddd})
call s:h("PmenuSbar"  , {"bg": s:mirage_ddd})
call s:h("PmenuThumb" , {"bg": s:bw10})

call s:h("TabLine",       {"fg": s:norm, "bg": s:mirage})
call s:h("TabLineSel",    {"fg": s:yellow, "bg": s:mirage, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:mirage})

call s:h("CursorColumn",  {"bg": s:bg_subtle})
call s:h("CursorLine",    {"bg": s:bg_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})
call s:h("Cursor",        {"bg": s:yellow})

"Ex mode
"call s:h("netrwDir",     {"fg": s:blue, "gui": "bold", "cterm": "bold"})
call s:h("netrwClassify", {"fg": s:blue})
call s:h("netrwSymLink", {"fg": s:purple})
hi! link netrwExe          netrwPlain
hi! link netrwLink          netrwSymlink

" remainder of syntax highlighting
call s:h("MatchParen",    {"bg": s:bw00, "fg": s:yellow})
call s:h("qfLineNr",      {"fg": s:bw70})

call s:h("helpCommand",        {"fg": s:cyan})

" hi helpHyperTextJump guifg=#5FAFD7 ctermfg=74

" HTML syntax
hi! link htmlTag          Special
hi! link htmlEndTag       htmlTag

hi! link htmlTagName      KeyWord
" html5 tags show up as htmlTagN
hi! link htmlTagN         Keyword

" C/C++
call s:h("cParen",        {"fg": s:green})
call s:h("cCppParen",        {"fg": s:green})
call s:h("cBracket",        {"fg": s:green})
call s:h("cCppBracket",        {"fg": s:green})

" HTML content
call s:h("htmlH1",        {"fg": s:head_a, "gui": "bold", "cterm": "bold"     })
call s:h("htmlH2",        {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlH3",        {"fg": s:head_b, "gui": "none"     , "cterm": "none"   })
call s:h("htmlH4",        {"fg": s:head_b, "gui": "none"     , "cterm": "none"   })
call s:h("htmlH5",        {"fg": s:head_c                                            })
call s:h("htmlH6",        {"fg": s:head_c                                            })
call s:h("htmlLink",      {"fg": s:blue  , "gui": "underline"  , "cterm": "underline"})
call s:h("htmlItalic",    {                "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlBold",      {                "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlBoldItalic",{                "gui": "bold,italic", "cterm": "bold"     })
" hi htmlString     guifg=#87875f guibg=NONE gui=NONE        ctermfg=101 ctermbg=NONE cterm=NONE

" tpope/vim-markdown
call s:h("markdownBlockquote",          {"fg": s:norm})
call s:h("markdownBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownBoldItalic",          {"fg": s:norm  , "gui": "bold,italic", "cterm": "bold"  })
call s:h("markdownEscape",              {"fg": s:norm})
call s:h("markdownH1",                  {"fg": s:head_a, "gui": "bold", "cterm": "bold"  })
call s:h("markdownH2",                  {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownH3",                  {"fg": s:head_b, "gui": "none"     , "cterm": "none"})
call s:h("markdownH4",                  {"fg": s:head_c, "gui": "none"     , "cterm": "none"})
call s:h("markdownH5",                  {"fg": s:head_c})
call s:h("markdownH6",                  {"fg": s:head_c})
call s:h("markdownHeadingDelimiter",    {"fg": s:lemon})
call s:h("markdownHeadingRule",         {"fg": s:lemon})
call s:h("markdownId",                  {"fg": s:bw70})
call s:h("markdownIdDeclaration",       {"fg": s:norm_subtle})
call s:h("markdownItalic",              {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})
call s:h("markdownLinkDelimiter",       {"fg": s:bw70})
call s:h("markdownLinkText",            {"fg": s:cyan_d})
call s:h("markdownLinkTextDelimiter",   {"fg": s:bw70})
call s:h("markdownListMarker",          {"fg": s:green  , "gui": "bold"     , "cterm": "bold"})
call s:h("markdownOrderedListMarker",   {"fg": s:green  , "gui": "bold"     , "cterm": "bold"})
call s:h("markdownRule",                {"fg": s:yellow})
call s:h("markdownUrl",                 {"fg": s:blue, "gui": "underline", "cterm": "underline"})
call s:h("markdownUrlDelimiter",        {"fg": s:bw70})
call s:h("markdownUrlTitle",            {"fg": s:norm})
call s:h("markdownUrlTitleDelimiter",   {"fg": s:bw70})
call s:h("markdownCode",                {"fg": s:blue})
call s:h("markdownCodeDelimiter",       {"fg": s:bw50, "gui": "bold", "cterm": "bold"})

" plasticboy/vim-markdown
call s:h("mkdBlockQuote",               {"fg": s:norm})
call s:h("mkdDelimiter",                {"fg": s:bw70})
call s:h("mkdID",                       {"fg": s:bw70})
call s:h("mkdLineContinue",             {"fg": s:norm})
call s:h("mkdLink",                     {"fg": s:norm})
call s:h("mkdLinkDef",                  {"fg": s:bw70})
call s:h("mkdListItem",                 {"fg": s:norm})
call s:h("mkdNonListItemBlock",         {"fg": s:norm})  " bug in syntax?
call s:h("mkdRule",                     {"fg": s:norm})
call s:h("mkdUrl",                      {"fg": s:bw70, "gui": "underline", "cterm": "underline"})
call s:h("mkdCode",                     {"fg": s:norm})
call s:h("mkdIndentCode",               {"fg": s:norm})

" gabrielelana/vim-markdown
call s:h("markdownBlockquoteDelimiter", {"fg": s:norm})
call s:h("markdownInlineDelimiter",     {"fg": s:norm})
call s:h("markdownItemDelimiter",       {"fg": s:norm})
call s:h("markdownLinkReference",       {"fg": s:bw70})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextContainer",   {"fg": s:bw70})
call s:h("markdownLinkUrl",             {"fg": s:bw70, "gui": "underline", "cterm": "underline"})
call s:h("markdownLinkUrlContainer",    {"fg": s:bw70})
call s:h("markdownFencedCodeBlock",     {"fg": s:norm})
call s:h("markdownInlineCode",          {"fg": s:norm})

" mattly/vim-markdown-enhancements
call s:h("mmdFootnoteDelimiter",        {"fg": s:bw70})
call s:h("mmdFootnoteMarker",           {"fg": s:norm})
call s:h("mmdTableAlign",               {"fg": s:norm})
call s:h("mmdTableDelimiter",           {"fg": s:norm})
call s:h("mmdTableHeadDelimiter",       {"fg": s:norm})
call s:h("mmdTableHeader",              {"fg": s:norm})
call s:h("mmdTableCaptionDelimiter",    {"fg": s:norm})
call s:h("mmdTableCaption",             {"fg": s:norm})

call s:h("vimOption",               {"fg": s:green})

" Textile content
" https://github.com/timcharper/textile.vim/blob/master/syntax/textile.vim
"call s:h("txtBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
"call s:h("txtEmphasis",            {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})

" XML content
hi! link xmlTag                     htmlTag
hi! link xmlEndTag                  xmlTag
hi! link xmlTagName                 htmlTagName

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
call s:h("GitGutterAdd"          , {"fg": s:green  , "bg": s:diff_bgg})
call s:h("GitGutterDelete"       , {"fg": s:red    , "bg": s:diff_bgr})
call s:h("GitGutterChange"       , {"fg": s:cyan   , "bg": s:diff_bgb})
call s:h("GitGutterChangeDelete" , {"fg": s:red    , "bg": s:mirage_dd})


"nvim terminal colors
let g:terminal_color_0 = s:dark_d.gui
let g:terminal_color_1 = s:red.gui
let g:terminal_color_2 = s:green.gui
let g:terminal_color_3 = s:yellow.gui
let g:terminal_color_4 = s:blue.gui
let g:terminal_color_5 = s:purple.gui
let g:terminal_color_6 = s:cyan.gui
let g:terminal_color_7 = s:bwe0.gui
let g:terminal_color_8 = s:bg_subtle.gui
let g:terminal_color_9 = s:red_d.gui
let g:terminal_color_10 = s:green_d.gui
let g:terminal_color_11 = s:yellow_d.gui
let g:terminal_color_12 = s:blue_d.gui
let g:terminal_color_13 = s:purple_d.gui
let g:terminal_color_14 = s:cyan_d.gui
let g:terminal_color_15 = s:bwb0.gui

