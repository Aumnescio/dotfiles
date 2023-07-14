let s:typstindentObj = 'require("typst-indent").GetAumTypstIndent(_A.lnum)'

func! typstindent#GetAumTypstIndent(lnum)
    return luaeval(s:typstindentObj, {'lnum': a:lnum})
endfunc
