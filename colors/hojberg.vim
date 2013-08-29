" Vim color file - hojberg
"
" Inspired by Mustang, BusyBee and BadWolf
"
" HL function and layout snatched from badwolf by Steve Losh
" http://stevelosh.com/projects/badwolf/

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
  finish
endif

set background=dark

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "hojberg"

" Colors ---------- "
let s:hc = {}

" Normal text.
let s:hc.plain = ['e2e2e5', 254]

" Pure and simple.
let s:hc.snow = ['ffffff', 15]
"let s:hc.coal = ['000000', 16]
let s:hc.coal = ['000000', 0]

let s:hc.brightgravel   = ['d9cec3', 252]
let s:hc.lightgravel    = ['998f84', 245]
let s:hc.gravel         = ['857f78', 243]
let s:hc.mediumgravel   = ['666462', 241]
let s:hc.deepgravel     = ['45413b', 238]
let s:hc.deepergravel   = ['35322d', 236]
let s:hc.darkgravel     = ['242321', 235]
let s:hc.blackgravel    = ['202020', 234]
let s:hc.blackestgravel = ['141413', 232]

" Very light green
let s:hc.neon = ['d0ffc0', 193]

" Mustang lime
let s:hc.lime = ['b1d631', 148]
let s:hc.moss= ['b1d631', 149]

" The star of the show comes straight from Made of Code.
let s:hc.tardis = ['0a9dff', 39]

" a slight greyish purple
let s:hc.nebula = ['7e8aa2', 103]

" A beautiful tan from Tomorrow Night.
let s:hc.dirtyblonde = ['f4cf86', 222]

" Delicious, chewy red from Made of Code for the poppiest highlights.
let s:hc.taffy = ['ff2c4b', 196]
let s:hc.darkred = ['ff2c4b', 52]

" This one's from Mustang, not Florida!
let s:hc.orange = ['ff9800', 208]

" From busybee
let s:hc.paleyellow = ['ffff00', 11]
let s:hc.straw = ['faf4c6', 230]

" Highlighter -----------------------------------------------------------------
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:hc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:hc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:hc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    " echom histring

    execute histring
endfunction

" THEME =======================================================================

" UI --------------------------------------------------------------------------
call s:HL('Normal', 'plain', 'blackgravel')
call s:HL('Folded', 'mediumgravel', 'bg', 'none')
call s:HL('VertSplit', 'coal', 'coal', 'none')
call s:HL('HorSplit', 'coal', 'coal', 'none')
call s:HL('CursorLine',   '', 'darkgravel', 'none')
call s:HL('CursorColumn', '', 'darkgravel')
call s:HL('ColorColumn',  'coal', 'darkgravel')
call s:HL('MatchParen', 'taffy', 'bg')
call s:HL('NonText',    'deepgravel', 'bg')
call s:HL('SpecialKey', 'deepgravel', 'bg')
call s:HL('Visual',    'tardis',  'deepergravel')
call s:HL('VisualNOS', 'snow',  'tardis')
call s:HL('Search',    'coal', 'tardis', 'bold')
call s:HL('IncSearch', 'coal', 'tardis', 'bold')
call s:HL('Underlined', 'fg', '', 'underline')
call s:HL('StatusLine',   'coal', 'lime', 'bold')
call s:HL('StatusLineNC', 'coal', 'bg', 'none')

call s:HL('Directory', 'tardis', '', 'bold')
call s:HL('Title', 'lime')

call s:HL('ErrorMsg',   'taffy',       'bg', 'bold')
call s:HL('MoreMsg',    'lime',   '',   'bold')
call s:HL('ModeMsg',    'dirtyblonde', '',   'bold')
call s:HL('Question',   'dirtyblonde', '',   'bold')
call s:HL('WarningMsg', 'taffy',       '',   'bold')

" Gutter
call s:HL('LineNr',     'blackestgravel')
call s:HL('SignColumn', '',             'coal')
call s:HL('FoldColumn', 'mediumgravel', 'coal')

" Cursor
call s:HL('Cursor',  'coal', 'tardis', 'bold')
call s:HL('vCursor', 'coal', 'tardis', 'bold')
call s:HL('iCursor', 'coal', 'tardis', 'none')

call s:HL('ExtraWhitespace',  '', 'taffy',    'none')

" Syntax  ---------------------------------------------------------------------

call s:HL('Special', 'orange')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call s:HL('Comment',        'blackestgravel')
call s:HL('Todo',           'coal', 'paleyellow', 'bold')
call s:HL('SpecialComment', 'brightgravel', 'bg', 'bold')

call s:HL('String', 'lime')

" Control flow stuff is nebula.
call s:HL('Statement',   'nebula', '', 'none')
call s:HL('Keyword',     'orange', '', 'none')
call s:HL('Conditional', 'nebula', '', 'none')
call s:HL('Operator',    'nebula', '', 'none')
call s:HL('Label',       'nebula', '', 'none')
call s:HL('Repeat',      'nebula', '', 'none')

call s:HL('Identifier', 'nebula', '', 'none')
call s:HL('Function',   'paleyellow', '', 'none')

call s:HL('PreProc',   'straw', '', 'none')
call s:HL('Macro',     'straw', '', 'none')
call s:HL('Define',    'straw', '', 'none')
call s:HL('PreCondit', 'straw', '', 'none')

call s:HL('Include',   'straw', '', 'none')

call s:HL('Constant',  'orange', '', 'none')
call s:HL('Character', 'orange', '', 'none')
call s:HL('Boolean',   'orange', '', 'none')
call s:HL('Number',    'orange', '', 'none')
call s:HL('Float',     'orange', '', 'none')

call s:HL('SpecialChar', 'taffy', '', 'none')

call s:HL('Type', 'orange', '', 'none')
call s:HL('StorageClass', 'orange', '', 'none')
call s:HL('Structure', 'orange', '', 'none')
call s:HL('Typedef', 'orange', '', 'none')

call s:HL('Exception', 'nebula', '', 'none')

" Misc
call s:HL('Error',  'snow',   'taffy', 'bold')
call s:HL('Debug',  'snow',   '',      'bold')
call s:HL('Ignore', 'gravel', '',      '')

" Completion ------------------------------------------------------------------
call s:HL('Pmenu', 'plain', 'deepergravel')
call s:HL('PmenuSel', 'coal', 'tardis', 'bold')
call s:HL('PmenuSbar', '', 'deepergravel')
call s:HL('PmenuThumb', 'brightgravel')

" Diffs -----------------------------------------------------------------------
call s:HL('DiffDelete', 'coal', 'coal')
call s:HL('DiffAdd',    '',     'deepergravel')
call s:HL('DiffChange', '',     'darkgravel')
call s:HL('DiffText',   'snow', 'deepergravel', 'bold')
call s:HL('gitDiff', 'lightgravel', '',)
call s:HL('diffRemoved', 'taffy', '',)
call s:HL('diffAdded', 'lime', '',)
call s:HL('diffFile', 'coal', 'taffy', 'bold')
call s:HL('diffNewFile', 'coal', 'taffy', 'bold')
call s:HL('diffLine', 'coal', 'orange', 'bold')
call s:HL('diffSubname', 'orange', '', 'none')


" Plugins ---------------------------------------------------------------------

" CtrlP -----
" the message when no match is found
call s:HL('CtrlPNoEntries', 'snow', 'taffy', 'bold')

" the matched pattern
call s:HL('CtrlPMatch', 'orange', 'bg', 'none')

" the line prefix '>' in the match window
call s:HL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

" the prompt’s base
call s:HL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

" the prompt’s text
call s:HL('CtrlPPrtText', 'plain', 'bg', 'none')

" the prompt’s cursor when moving over the text
call s:HL('CtrlPPrtCursor', 'coal', 'tardis', 'bold')

" 'prt' or 'win', also for 'regex'
call s:HL('CtrlPMode1', 'coal', 'tardis', 'bold')

" 'file' or 'path', also for the local working dir
call s:HL('CtrlPMode2', 'coal', 'tardis', 'bold')

" the scanning status
call s:HL('CtrlPStats', 'coal', 'tardis', 'bold')

" TODO: CtrlP extensions.
" CtrlPTabExtra  : the part of each line that’s not matched against (Comment)
" CtrlPqfLineCol : the line and column numbers in quickfix mode (|s:HL-Search|)
" CtrlPUndoT     : the elapsed time in undo mode (|s:HL-Directory|)
" CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
" CtrlPUndoNr    : the undo number inside [] in undo mode (String)

" EasyMotion -----
call s:HL('EasyMotionTarget', 'tardis',     'bg', 'bold')
call s:HL('EasyMotionShade',  'deepgravel', 'bg')

" Filetype Specific -----------------------------------------------------------

" CSS -----
call s:HL('cssColorProp', 'straw', '', 'none')
call s:HL('cssBoxProp', 'straw', '', 'none')
call s:HL('cssTextProp', 'straw', '', 'none')
call s:HL('cssRenderProp', 'straw', '', 'none')
call s:HL('cssGeneratedContentProp', 'straw', '', 'none')
call s:HL('cssValueLength', 'plain', '', 'none')
call s:HL('cssColor', 'straw', '', 'bold')
call s:HL('cssBraces', 'lightgravel', '', 'none')
call s:HL('cssIdentifier', 'paleyellow', '', 'bold')
call s:HL('cssClassName', 'paleyellow', '', 'none')

" LessCSS -----
call s:HL('lessVariable', 'orange')
" HTML ----

" Punctuation
call s:HL('htmlTag',            'plain', 'bg', 'none')
call s:HL('htmlEndTag',         'plain', 'bg', 'none')
call s:HL('htmlTagName',        'plain', '', 'bold')
call s:HL('htmlSpecialTagName', 'straw', '', 'bold')
call s:HL('htmlSpecialChar',    'lime',   '', 'none')
call s:HL('htmlArg',            'nebula', '', 'none')
call s:HL('htmlLink',           'tardis', '', 'underline')

" Markdown -----
call s:HL('markdownHeadingRule', 'lightgravel', '', 'bold')
call s:HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownListMarker', 'lightgravel', '', 'bold')
call s:HL('markdownItalic', 'snow', '', 'bold')
call s:HL('markdownBold', 'snow', '', 'bold')
call s:HL('markdownH1', 'orange', '', 'bold')
call s:HL('markdownH2', 'lime', '', 'bold')
call s:HL('markdownH3', 'lime', '', 'none')
call s:HL('markdownH4', 'lime', '', 'none')
call s:HL('markdownH5', 'lime', '', 'none')
call s:HL('markdownH6', 'lime', '', 'none')
call s:HL('markdownLinkText', 'straw', '', 'underline')
call s:HL('markdownIdDeclaration', 'straw')
call s:HL('markdownAutomaticLink', 'straw', '', 'bold')
call s:HL('markdownUrl', 'straw', '', 'bold')
call s:HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call s:HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call s:HL('markdownCode', 'dirtyblonde', '', 'none')
call s:HL('markdownCodeBlock', 'dirtyblonde', '', 'none')

" MySQL -----
call s:HL('mysqlSpecial', 'taffy', '', 'bold')

" Vim -----
call s:HL('VimCommentTitle',  'lightgravel',  '', 'bold')
call s:HL('VimMapMod',        'taffy',        '', 'none')
call s:HL('VimMapModKey',     'taffy',        '', 'none')
call s:HL('VimNotation',      'taffy',        '', 'none')
call s:HL('VimBracket',       'taffy',        '', 'none')

" Javascript ------------------------------------------------------------------
call s:HL('javaScriptDocComment', 'blackestgravel')
call s:HL('javaScriptDocTags',    'lightgravel')
call s:HL('javaScriptDocParam',   'lightgravel', '', 'bold')
call s:HL('javaScriptDocSeeTag',   'snow')
call s:HL('javaScriptReserved', 'taffy')
call s:HL('javaScriptOperator', 'orange')
call s:HL('javaScriptBraces', 'lightgravel')
call s:HL('javaScriptParens', 'lightgravel')
