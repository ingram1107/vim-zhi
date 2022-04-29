highlight clear

if exists("syntax_on")
  syntax reset
endif

if has("vim")
  set t_Co=256
endif

let g:colors_name="zhi"
set background=light

" zhi palette
let s:zhi={}

" classic 10 colors
let s:zhi.white=["#fbf7b7", 229]
let s:zhi.black=["#2a2c2b", 233]
let s:zhi.gray=["#686d6b", 237]
let s:zhi.red=["#57021e", 52]
let s:zhi.orange=["#824C04", 94]
let s:zhi.yellow=["#a49b09", 178]
let s:zhi.green=["#1E5702", 22]
let s:zhi.cyan=["#2C6565", 37]
let s:zhi.blue=["#021e57", 27]
let s:zhi.purple=["#3b0257", 54]

" extra flavours
let s:zhi.true_white=["#fefde9", 255]
let s:zhi.lighter_yellow=["#f9f28e", 227]
let s:zhi.light_yellow=["#f6ee65", 227]
let s:zhi.light_gray=["#b3b6b5", 250]
let s:zhi.light_orange=["#DCA945", 179]
let s:zhi.light_green=["#45712E", 22]

" shorthand
let s:bold="bold,"
let s:italic="italic,"
let s:underline="underline,"
let s:undercurl="undercurl,"
let s:inverse="inverse,"
let s:none=["NONE", "NONE"]

" shamlessly copied from https://github.com/morhetz/gruvbox/blob/master/colors/gruvbox.vim
function s:HL(group, fg, ...)
  " foreground
  let fg=a:fg

  " background
  if a:0 >= 1
    let bg=a:1
  else
    let bg=s:none
  endif

  " emphasis
  if a:0 >= 2
    let emstr=a:2
  else
    let emstr="NONE,"
  endif

  let histring = [ "highlight", a:group,
        \ "guifg=" . fg[0], "ctermfg=" . fg[1],
        \ "guibg=" . bg[0], "ctermbg=" . bg[1],
        \ "gui=" . emstr[:-2], "cterm=" . emstr[:-2]
        \ ]
  " special
  if a:0 >= 3
    call add(histring, "guisp=" . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" zhi Highlight Groups

" Visuals
call s:HL("Normal", s:zhi.black, s:zhi.white)
call s:HL("Cursor", s:none, s:none, s:inverse)
call s:HL("vCursor", s:none, s:none, s:inverse)
call s:HL("iCursor", s:none, s:none, s:inverse)
call s:HL("lCursor", s:none, s:none, s:inverse)
call s:HL("CursorIM", s:none, s:none, s:inverse)
call s:HL("CursorColumn", s:none, s:zhi.light_yellow)
call s:HL("CursorLine", s:none, s:zhi.light_yellow)
call s:HL("NonText", s:zhi.light_gray)
call s:HL("Visual", s:none, s:zhi.lighter_yellow)
call s:HL("Search", s:zhi.black, s:zhi.light_yellow)
call s:HL("IncSearch", s:zhi.black, s:zhi.light_orange)
call s:HL("CursorLineNr", s:none, s:zhi.light_yellow)
call s:HL("LineNr", s:zhi.gray, s:none)
call s:HL("MatchParen", s:zhi.light_green)
call s:HL("SignColumn", s:zhi.black, s:zhi.white)
call s:HL("StatusLine", s:zhi.black, s:zhi.light_yellow)
call s:HL("StatusLineNC", s:zhi.black, s:zhi.lighter_yellow)
call s:HL("VertSplit", s:zhi.black)
call s:HL("TabLine", s:zhi.black, s:zhi.lighter_yellow)
call s:HL("TabLineFill", s:zhi.black, s:zhi.light_yellow)
call s:HL("TabLineSel", s:zhi.black, s:zhi.white)
call s:HL("Directory", s:zhi.orange)
call s:HL("Terminal", s:zhi.black, s:zhi.white)
call s:HL("Whitespace", s:none, s:zhi.light_gray)
call s:HL("Debug", s:zhi.orange)
call s:HL("debugPC", s:none, s:zhi.light_orange)
call s:HL("debugBreakpoint", s:zhi.lighter_yellow, s:zhi.red)

" Popups
call s:HL("NormalFloat", s:zhi.black, s:zhi.light_yellow)
call s:HL("Pmenu", s:zhi.black, s:zhi.light_yellow)
call s:HL("PmenuSel", s:zhi.black, s:zhi.lighter_yellow)
call s:HL("PmenuBold", s:zhi.black, s:zhi.light_yellow)
call s:HL("PmenuSbar", s:none, s:zhi.gray)
call s:HL("PmenuThumb", s:none, s:zhi.true_white)

" Prompts
call s:HL("Question", s:zhi.green)
call s:HL("ModeMsg", s:zhi.green)
call s:HL("MoreMsg", s:zhi.black)
call s:HL("ErrorMsg", s:zhi.red, s:none, s:bold)
call s:HL("WarningMsg", s:zhi.orange, s:none, s:bold)

" Keywords
call s:HL("Keyword", s:zhi.red, s:none, s:bold)
call s:HL("Statement", s:zhi.red)
call s:HL("Conditional", s:zhi.red, s:none, s:bold)
call s:HL("Exception", s:zhi.red, s:none, s:bold)
call s:HL("Repeat", s:zhi.red, s:none, s:bold)
call s:HL("Operator", s:zhi.black)
call s:HL("Label", s:zhi.red, s:none, s:bold)

" Identifiers
call s:HL("Identifier", s:zhi.black)
call s:HL("Function", s:zhi.green, s:none, s:bold)

" Preprocessor related
call s:HL("PreProc", s:zhi.cyan)
call s:HL("Include", s:zhi.orange)
call s:HL("Define", s:zhi.cyan)
call s:HL("Macro", s:zhi.cyan)
call s:HL("PreCondit", s:zhi.cyan)

" Bytes
call s:HL("Constant", s:zhi.purple)
call s:HL("Number", s:zhi.purple)
call s:HL("Float", s:zhi.purple)
call s:HL("Boolean", s:zhi.purple)
call s:HL("Character", s:zhi.purple)
call s:HL("String", s:zhi.green, s:none, s:italic)

" Comment
call s:HL("Comment", s:zhi.gray, s:none, s:italic)
call s:HL("SpecialComment", s:zhi.gray, s:none, s:italic)

" Types
call s:HL("Type", s:zhi.blue)
call s:HL("Structure", s:zhi.blue)
call s:HL("StorageClass", s:zhi.blue)
call s:HL("Typedef", s:zhi.blue)

" Spelling
call s:HL("SpellBad", s:none, s:none, s:undercurl, s:zhi.red)
call s:HL("SpellCap", s:none, s:none, s:undercurl, s:zhi.orange)
call s:HL("SpellLocal", s:none, s:none, s:undercurl, s:zhi.blue)
call s:HL("SpellRare", s:none, s:none, s:undercurl, s:zhi.black)

" Diffs
call s:HL("DiffAdd", s:zhi.green, s:none, s:inverse)
call s:HL("DiffDelete", s:zhi.red, s:none, s:inverse)
call s:HL("DiffChanged", s:zhi.cyan, s:none, s:inverse)
call s:HL("DiffText", s:zhi.orange, s:none, s:inverse)
call s:HL("diffAdded", s:zhi.green)
call s:HL("diffRemoved", s:zhi.red)
call s:HL("diffChanged", s:zhi.cyan)
call s:HL("diffFile", s:zhi.blue)
call s:HL("diffNewFile", s:zhi.orange)
call s:HL("diffLine", s:zhi.black, s:none, s:bold)

" Others
call s:HL("Todo", s:zhi.yellow, s:none, s:bold)
call s:HL("Underlined", s:zhi.black, s:none, s:underline)
call s:HL("Ignore", s:none, s:none)
call s:HL("Delimiter", s:zhi.black)
call s:HL("Special", s:zhi.black)
call s:HL("SpecialChar", s:zhi.black)
call s:HL("Tag", s:zhi.black)
call s:HL("Title", s:zhi.red, s:none, s:bold)
call s:HL("Error", s:zhi.red)
call s:HL("Conceal", s:zhi.black)
call s:HL("Folded", s:none, s:zhi.light_yellow)
call s:HL("FoldColumn", s:none, s:zhi.light_gray)

if has('nvim-0.6.0')
  " LSP Diagnostic
  call s:HL("DiagnosticError", s:zhi.red)
  call s:HL("DiagnosticWarn", s:zhi.orange)
  call s:HL("DiagnosticInfo", s:zhi.cyan)
  call s:HL("DiagnosticHint", s:zhi.blue)
  call s:HL("DiagnosticUnderlineError", s:zhi.red, s:none, s:undercurl)
  call s:HL("DiagnosticUnderlineWarn", s:zhi.orange, s:none, s:undercurl)
  call s:HL("DiagnosticUnderlineInfo", s:zhi.cyan, s:none, s:undercurl)
  call s:HL("DiagnosticUnderlineHint", s:zhi.blue, s:none, s:undercurl)

  " Nvim Tree (kyazdani42/nvim-tree.lua)
  call s:HL("NvimTreeSymlink", s:zhi.cyan)
  call s:HL("NvimTreeFolderName", s:zhi.black)
  call s:HL("NvimTreeRootFolder", s:zhi.blue)
  call s:HL("NvimTreeFolderIcon", s:zhi.orange)
  call s:HL("NvimTreeEmptyFolderName", s:zhi.black)
  call s:HL("NvimTreeOpenedFolderName", s:zhi.black)
  call s:HL("NvimTreeExecFile", s:zhi.red)
  call s:HL("NvimTreeOpenedFile", s:zhi.green)
  call s:HL("NvimTreeSpecialFile", s:zhi.black)
  call s:HL("NvimTreeImageFile", s:zhi.black)
  call s:HL("NvimTreeIndentMarker", s:zhi.gray)

  " Neogit
  call s:HL("NeogitNotificationInfo", s:zhi.black)
  call s:HL("NeogitNotificationWarning", s:zhi.orange)
  call s:HL("NeogitNotificationError", s:zhi.red)

  " Fidget (j-hui/fidget.nvim)
  call s:HL("FidgetTitle", s:zhi.black, s:none, s:bold)
  call s:HL("FidgetTask", s:zhi.gray)
endif
