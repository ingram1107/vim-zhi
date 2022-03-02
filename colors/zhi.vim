highlight clear

if exists("syntax_on")
  syntax reset
endif

if has("vim")
  set t_Co=256
endif

let g:colors_name="zhi"
set background=light

" TruePaper palette
let s:truepaper={}

" classic 10 colors
let s:truepaper.white=["#fbf7b7", 229]
let s:truepaper.black=["#2a2c2b", 233]
let s:truepaper.gray=["#686d6b", 237]
let s:truepaper.red=["#57021e", 52]
let s:truepaper.orange=["#824C04", 94]
let s:truepaper.yellow=["#a49b09", 178]
let s:truepaper.green=["#1E5702", 22]
let s:truepaper.cyan=["#2C6565", 37]
let s:truepaper.blue=["#021e57", 27]
let s:truepaper.purple=["#3b0257", 54]

" extra flavours
let s:truepaper.true_white=["#fefde9", 255]
let s:truepaper.lighter_yellow=["#f9f28e", 227]
let s:truepaper.light_yellow=["#f6ee65", 227]
let s:truepaper.light_gray=["#b3b6b5", 250]
let s:truepaper.light_orange=["#DCA945", 179]
let s:truepaper.light_green=["#45712E", 22]

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

" TruePaper Highlight Groups

" Visuals
call s:HL("Normal", s:truepaper.black, s:truepaper.white)
call s:HL("Cursor", s:none, s:none, s:inverse)
call s:HL("vCursor", s:none, s:none, s:inverse)
call s:HL("iCursor", s:none, s:none, s:inverse)
call s:HL("lCursor", s:none, s:none, s:inverse)
call s:HL("CursorIM", s:none, s:none, s:inverse)
call s:HL("CursorColumn", s:none, s:truepaper.light_yellow)
call s:HL("CursorLine", s:none, s:truepaper.light_yellow)
call s:HL("NonText", s:truepaper.light_gray)
call s:HL("Visual", s:none, s:truepaper.lighter_yellow)
call s:HL("Search", s:truepaper.black, s:truepaper.light_yellow)
call s:HL("IncSearch", s:truepaper.black, s:truepaper.light_orange)
call s:HL("CursorLineNr", s:none, s:truepaper.light_yellow)
call s:HL("LineNr", s:truepaper.gray, s:none)
call s:HL("MatchParen", s:truepaper.light_green)
call s:HL("SignColumn", s:truepaper.black, s:truepaper.white)
call s:HL("StatusLine", s:truepaper.black, s:truepaper.light_yellow)
call s:HL("StatusLineNC", s:truepaper.black, s:truepaper.lighter_yellow)
call s:HL("VertSplit", s:truepaper.lighter_yellow)
call s:HL("TabLine", s:truepaper.black, s:truepaper.lighter_yellow)
call s:HL("TabLineFill", s:truepaper.black, s:truepaper.light_yellow)
call s:HL("TabLineSel", s:truepaper.black, s:truepaper.white)
call s:HL("Directory", s:truepaper.orange)
call s:HL("Terminal", s:truepaper.black, s:truepaper.white)
call s:HL("Whitespace", s:none, s:truepaper.light_gray)
call s:HL("Debug", s:truepaper.orange)
call s:HL("debugPC", s:none, s:truepaper.light_orange)
call s:HL("debugBreakpoint", s:truepaper.lighter_yellow, s:truepaper.red)

" Popups
call s:HL("NormalFloat", s:truepaper.black, s:truepaper.light_yellow)
call s:HL("Pmenu", s:truepaper.black, s:truepaper.light_yellow)
call s:HL("PmenuSel", s:truepaper.black, s:truepaper.lighter_yellow)
call s:HL("PmenuBold", s:truepaper.black, s:truepaper.light_yellow)
call s:HL("PmenuSbar", s:none, s:truepaper.gray)
call s:HL("PmenuThumb", s:none, s:truepaper.true_white)

" Prompts
call s:HL("Question", s:truepaper.green)
call s:HL("ModeMsg", s:truepaper.green)
call s:HL("MoreMsg", s:truepaper.black)
call s:HL("ErrorMsg", s:truepaper.red, s:none, s:bold)
call s:HL("WarningMsg", s:truepaper.orange, s:none, s:bold)

" Keywords
call s:HL("Keyword", s:truepaper.red, s:none, s:bold)
call s:HL("Statement", s:truepaper.red)
call s:HL("Conditional", s:truepaper.red, s:none, s:bold)
call s:HL("Exception", s:truepaper.red, s:none, s:bold)
call s:HL("Repeat", s:truepaper.red, s:none, s:bold)
call s:HL("Operator", s:truepaper.black)
call s:HL("Label", s:truepaper.red, s:none, s:bold)

" Identifiers
call s:HL("Identifier", s:truepaper.black)
call s:HL("Function", s:truepaper.green, s:none, s:bold)

" Preprocessor related
call s:HL("PreProc", s:truepaper.cyan)
call s:HL("Include", s:truepaper.orange)
call s:HL("Define", s:truepaper.cyan)
call s:HL("Macro", s:truepaper.cyan)
call s:HL("PreCondit", s:truepaper.cyan)

" Bytes
call s:HL("Constant", s:truepaper.purple)
call s:HL("Number", s:truepaper.purple)
call s:HL("Float", s:truepaper.purple)
call s:HL("Boolean", s:truepaper.purple)
call s:HL("Character", s:truepaper.purple)
call s:HL("String", s:truepaper.green, s:none, s:italic)

" Comment
call s:HL("Comment", s:truepaper.gray, s:none, s:italic)
call s:HL("SpecialComment", s:truepaper.gray, s:none, s:italic)

" Types
call s:HL("Type", s:truepaper.blue)
call s:HL("Structure", s:truepaper.blue)
call s:HL("StorageClass", s:truepaper.blue)
call s:HL("Typedef", s:truepaper.blue)

" Spelling
call s:HL("SpellBad", s:none, s:none, s:undercurl, s:truepaper.red)
call s:HL("SpellCap", s:none, s:none, s:undercurl, s:truepaper.orange)
call s:HL("SpellLocal", s:none, s:none, s:undercurl, s:truepaper.blue)
call s:HL("SpellRare", s:none, s:none, s:undercurl, s:truepaper.black)

" Diffs
call s:HL("DiffAdd", s:truepaper.green, s:none, s:inverse)
call s:HL("DiffDelete", s:truepaper.red, s:none, s:inverse)
call s:HL("DiffChanged", s:truepaper.cyan, s:none, s:inverse)
call s:HL("DiffText", s:truepaper.orange, s:none, s:inverse)
call s:HL("diffAdded", s:truepaper.green)
call s:HL("diffRemoved", s:truepaper.red)
call s:HL("diffChanged", s:truepaper.cyan)
call s:HL("diffFile", s:truepaper.blue)
call s:HL("diffNewFile", s:truepaper.orange)
call s:HL("diffLine", s:truepaper.black, s:none, s:bold)

" Others
call s:HL("Todo", s:truepaper.yellow, s:none, s:bold)
call s:HL("Underlined", s:truepaper.black, s:none, s:underline)
call s:HL("Ignore", s:none, s:none)
call s:HL("Delimiter", s:truepaper.black)
call s:HL("Special", s:truepaper.black)
call s:HL("SpecialChar", s:truepaper.black)
call s:HL("Tag", s:truepaper.black)
call s:HL("Title", s:truepaper.red, s:none, s:bold)
call s:HL("Error", s:truepaper.red)
call s:HL("Conceal", s:truepaper.black)
call s:HL("Folded", s:none, s:truepaper.light_yellow)
call s:HL("FoldColumn", s:none, s:truepaper.light_gray)
