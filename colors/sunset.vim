" File:       sunset.vim
" Maintainer: maru143
" URL:        https://github.com/maru143/vim-sunset
" License:    MIT

" Initialisation:"{{{
" ----------------------------------------------------------------------------

set background=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

set t_Co=256
let g:colors_name = "sunset"

"}}}

" GUI And Cterm Palettes:"{{{
" ----------------------------------------------------------------------------

let s:palette = {'gui' : {} , 'cterm' : {}}

let s:palette.gui.background    = "#1c1c1c"
let s:palette.gui.foreground    = "#d4d4d4"
let s:palette.gui.grey          = "#4e4e4e"
let s:palette.gui.line          = "#192244"
let s:palette.gui.comment       = "#6d6d6d"
let s:palette.gui.scarlet       = "#e02d2d"        
let s:palette.gui.red           = "#f7397c"        
let s:palette.gui.orange        = "#ff8928"
let s:palette.gui.yellow        = "#ffcc23"
let s:palette.gui.deepyellow    = "#ffaf00"
let s:palette.gui.applegreen    = "#b5cea8"
let s:palette.gui.lightgreen    = "#abd166"
let s:palette.gui.lightblue     = "#9cdcfe"
let s:palette.gui.blue          = "#6796e6"
let s:palette.gui.deepblue      = "#16769c"
let s:palette.gui.lightbrown    = "#bf9277"
let s:palette.gui.brown         = "#d7875f"
let s:palette.gui.purple        = "#b267e6"

let s:palette.cterm.background  = "234"
let s:palette.cterm.foreground  = "188"
let s:palette.cterm.grey        = "239"
let s:palette.cterm.window      = "236"             
let s:palette.cterm.line        = "235"
let s:palette.cterm.comment     = "242"
let s:palette.cterm.scarlet     = "160"        
let s:palette.cterm.red         = "204"
let s:palette.cterm.orange      = "208"
let s:palette.cterm.yellow      = "220"
let s:palette.cterm.deepyellow  = "214"
let s:palette.cterm.lightgreen  = "149"
let s:palette.cterm.applegreen  = "151"
let s:palette.cterm.lightblue   = "117"
let s:palette.cterm.blue        = "68"
let s:palette.cterm.deepblue    = "31"
let s:palette.cterm.lightbrown  = "138"
let s:palette.cterm.brown       = "173"
let s:palette.cterm.purple      = "134"

"}}}

" Formatting Options:"{{{
" ----------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"
"}}}

" Highlighting Primitives:"{{{
" ----------------------------------------------------------------------------
function! s:build_prim(hi_elem, field)
  " Given a:hi_elem = bg, a:field = comment
  let l:vname = "s:" . a:hi_elem . "_" . a:field " s:bg_comment
  let l:gui_assign = "gui".a:hi_elem."=".s:palette.gui[a:field] " guibg=...
  let l:cterm_assign = "cterm".a:hi_elem."=".s:palette.cterm[a:field] " ctermbg=...
  exe "let " . l:vname . " = ' " . l:gui_assign . " " . l:cterm_assign . "'"
endfunction

let s:bg_none = ' guibg=NONE ctermbg=NONE'
call s:build_prim('bg', 'foreground')
call s:build_prim('bg', 'background')
call s:build_prim('bg', 'grey')
call s:build_prim('bg', 'line')
call s:build_prim('bg', 'comment')
call s:build_prim('bg', 'scarlet')
call s:build_prim('bg', 'red')
call s:build_prim('bg', 'orange')
call s:build_prim('bg', 'yellow')
call s:build_prim('bg', 'deepyellow')
call s:build_prim('bg', 'applegreen')
call s:build_prim('bg', 'lightgreen')
call s:build_prim('bg', 'lightblue')
call s:build_prim('bg', 'blue')
call s:build_prim('bg', 'deepblue')
call s:build_prim('bg', 'lightbrown')
call s:build_prim('bg', 'brown')
call s:build_prim('bg', 'purple')

let s:fg_none = ' guifg=NONE ctermfg=NONE'
call s:build_prim('fg', 'foreground')
call s:build_prim('fg', 'background')
call s:build_prim('fg', 'grey')
call s:build_prim('fg', 'line')
call s:build_prim('fg', 'comment')
call s:build_prim('fg', 'scarlet')
call s:build_prim('fg', 'red')
call s:build_prim('fg', 'orange')
call s:build_prim('fg', 'yellow')
call s:build_prim('fg', 'deepyellow')
call s:build_prim('fg', 'applegreen')
call s:build_prim('fg', 'lightgreen')
call s:build_prim('fg', 'lightblue')
call s:build_prim('fg', 'blue')
call s:build_prim('fg', 'deepblue')
call s:build_prim('fg', 'lightbrown')
call s:build_prim('fg', 'brown')
call s:build_prim('fg', 'purple')

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

"}}}

" Vim Highlighting: (see :help highlight-groups)"{{{
" ----------------------------------------------------------------------------
exe "hi! ColorColumn"   .s:fg_none          .s:bg_line          .s:fmt_none
"   Conceal"
exe "hi! Cursor"        .s:fg_deepyellow    .s:bg_line          .s:fmt_none
"   CursorIM"
exe "hi! CursorColumn"  .s:fg_none          .s:bg_line          .s:fmt_none
exe "hi! CursorLine"    .s:fg_none          .s:bg_line          .s:fmt_none
exe "hi! Directory"     .s:fg_blue          .s:bg_none          .s:fmt_none
exe "hi! DiffAdd"       .s:fg_background    .s:bg_deepblue      .s:fmt_none
exe "hi! DiffChange"    .s:fg_background    .s:bg_deepblue      .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background    .s:bg_deepblue      .s:fmt_none
exe "hi! DiffText"      .s:fg_background    .s:bg_deepblue      .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_scarlet       .s:bg_none          .s:fmt_none
exe "hi! VertSplit"     .s:fg_line          .s:bg_none          .s:fmt_none
exe "hi! Folded"        .s:fg_comment       .s:bg_none          .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none          .s:bg_none          .s:fmt_none
exe "hi! SignColumn"    .s:fg_none          .s:bg_none          .s:fmt_none
"   Incsearch"
exe "hi! LineNr"        .s:fg_grey          .s:bg_none          .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_deepyellow    .s:bg_line          .s:fmt_none
exe "hi! MatchParen"    .s:fg_background    .s:bg_brown         .s:fmt_none
exe "hi! ModeMsg"       .s:fg_lightgreen    .s:bg_none          .s:fmt_none
exe "hi! MoreMsg"       .s:fg_lightgreen    .s:bg_none          .s:fmt_none
exe "hi! NonText"       .s:fg_line          .s:bg_none          .s:fmt_none
exe "hi! Pmenu"         .s:fg_yellow        .s:bg_grey          .s:fmt_none
exe "hi! PmenuSel"      .s:fg_yellow        .s:bg_grey          .s:fmt_revr
exe "hi! PmenuSbar"     .s:fg_foreground    .s:bg_orange        .s:fmt_none
exe "hi! PmenuThumb"    .s:fg_foreground    .s:bg_orange        .s:fmt_none
" exe "hi! Question"      .s:fg_green         .s:bg_none          .s:fmt_none
exe "hi! IncSearch"     .s:fg_background    .s:bg_lightbrown    .s:fmt_none
exe "hi! Search"        .s:fg_background    .s:bg_lightbrown    .s:fmt_none
exe "hi! SpecialKey"    .s:fg_red           .s:bg_none          .s:fmt_none
exe "hi! SpellCap"      .s:fg_background    .s:bg_deepblue      .s:fmt_undr
" exe "hi! SpellLocal"    .s:fg_aqua          .s:bg_darkcyan      .s:fmt_undr
" exe "hi! SpellBad"      .s:fg_red           .s:bg_darkred       .s:fmt_undr
" exe "hi! SpellRare"     .s:fg_purple        .s:bg_darkpurple    .s:fmt_undr
" exe "hi! StatusLine"    .s:fg_comment       .s:bg_background    .s:fmt_revr
" exe "hi! StatusLineNC"  .s:fg_window        .s:bg_comment       .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground    .s:bg_deepblue      .s:fmt_revr
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_yellow        .s:bg_none          .s:fmt_none
exe "hi! Visual"        .s:fg_none          .s:bg_deepblue      .s:fmt_none
"   VisualNos"
exe "hi! WarningMsg"    .s:fg_red           .s:bg_none          .s:fmt_none
" FIXME LongLineWarning to use variables instead of hardcoding
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
"   WildMenu"

" Use defined custom background colour for terminal Vim.
if !has('gui_running') && exists("g:hybrid_custom_term_colors") && g:hybrid_custom_term_colors == 1
  let s:bg_normal = s:bg_none
else
  let s:bg_normal = s:bg_background
endif
exe "hi! Normal"          .s:fg_foreground  .s:bg_normal      .s:fmt_none

"}}}


" Generic Syntax Highlighting: (see :help group-name)"{{{
" ----------------------------------------------------------------------------

exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_brown       .s:bg_none        .s:fmt_none
"   Character"
exe "hi! Number"          .s:fg_applegreen  .s:bg_none        .s:fmt_none
exe "hi! Float"           .s:fg_applegreen  .s:bg_none        .s:fmt_none
"   Boolean"

exe "hi! Identifier"      .s:fg_foreground  .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_lightgreen  .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_red         .s:bg_none        .s:fmt_none
"   Conditional"
"   Repeat"        
"   Label"         
exe "hi! Operator"        .s:fg_lightblue   .s:bg_none        .s:fmt_none
exe "hi! Keyword"         .s:fg_lightblue   .s:bg_none        .s:fmt_none
"   Exception"

exe "hi! PreProc"         .s:fg_red         .s:bg_none        .s:fmt_none
"   Include"
"   Define"
"   Macro"
"   PreCondit"

exe "hi! Type"            .s:fg_lightblue   .s:bg_none        .s:fmt_none
"   StorageClass"
"   Structure"
exe "hi! Typedef"         .s:fg_deepyellow  .s:bg_none        .s:fmt_none

exe "hi! Special"         .s:fg_yellow      .s:bg_none        .s:fmt_none
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"
"
exe "hi! Underlined"      .s:fg_blue        .s:bg_none        .s:fmt_none

exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_red         .s:bg_none        .s:fmt_undr

exe "hi! Todo"            .s:fg_background  .s:bg_foreground  .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

"}}}

exe "hi! cppSTLconstant"   .s:fg_foreground .s:bg_none        .s:fmt_none
exe "hi! cppSTLconstant"   .s:fg_foreground .s:bg_none        .s:fmt_none
exe "hi! cppStatement"     .s:fg_yellow     .s:bg_none        .s:fmt_none
exe "hi! cStorageClass"    .s:fg_yellow     .s:bg_none        .s:fmt_none
exe "hi! NvimInternalError".s:fg_scarlet    .s:bg_none        .s:fmt_none
