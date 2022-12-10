-- Core colors of Aumnechroma theme.
colors = {
    -- === Background ===
    -- Primary background color.            (STATE: Very Good)
    darkcrust   = "#040206",                -- Orig: 040206     (Very dark blue, near black)

    -- Alt Primary background color.        (STATE: Good'ish)
    crust       = "#100F1D",                -- Orig: 100F1D     (Quite dark blue)

    -- Secondary background color.          (STATE: Good'ish)
    remnant     = "#04040C",                -- Orig: 04040C     (Very dark blue) 

    -- Tertiary background color.           (STATE: OK'ish)
    monolith    = "#0F0B16",                -- Orig: 0F0B16

    -- Quaternary background color.         (STATE: OK'ish)
    alloy       = "#21202F",                -- Orig: 21202F

    -- === Foreground ===
    -- Primary foreground.                  (STATE: Very Good, Contrast Ratio: 13.42:1)
    text        = "#CCCCFF",                -- Orig: CCCCFF
    oldtext     = "#ADAAD5",                -- Orig: ADAAD5

    -- Secondary foreground.                (STATE: Very Good, Contrast Ratio: 13.91:1)
    heaven      = "#D2D2EA",                -- Orig: D2D2EA
    oldheaven   = "#BCB9DE",                -- Orig: BCB9DE

    -- Tertiary foreground.                 (STATE: Good, Contrast Ratio: 11.73:1)
    snow        = "#B7C2EB",                -- Orig: B7C2EB
    oldsnow     = "#C0C8ED",                -- Orig: C0C8ED

    -- Quaternary foreground.               (STATE: Very Good, Contrast Ratio: 9.6:1)
    hail        = "#A3AFE0",                -- Orig: A3AFE0
    oldhail     = "#9AA7DD",                -- Orig: 9AA7DD

    -- === Reds ===
    -- Operators: '=', '>', '<', '+', '-'.  (STATE: Very Good, Contrast Ratio: 7.04:1)
    red         = "#FA6969",                -- Orig: FA6969
    oldred      = "#EE5260",                -- Orig: EE5260

    -- Mostly used for alt keywords.        (STATE: Good, Contrast Ratio: 7.21:1)
    rose        = "#E27989",                -- Orig: E27989
    oldrose     = "#DA596D",                -- Orig: DA596D

    -- Errors.                              (STATE: Very Good, Contrast Ratio: 7.01:1)
    crimson     = "#FF6161",                -- Orig: FF6161
    oldcrimson  = "#D24A4A",                -- Orig: D24A4A

    -- Mostly used for exceptions.          (STATE: Good, Contrast Ratio: 8.27:1)
    rouge       = "#E98A80",                -- Orig: E98A80
    oldrouge    = "#DC5D51",                -- Orig: DC5D51

    -- Mostly used for <?>.                 (STATE: Good, Contrast Ratio: 9.99:1)
    maroon      = "#EBA0AC",                -- Orig: EBA0AC

    -- Mostly used for titles.              (STATE: Good, Contrast Ratio: 16.3:1)
    rosewater   = "#F5E0DC",                -- Orig: F5E0DC

    -- === Greens ===
    -- Mostly used for statements.          (STATE: Good?, Contrast Ratio: 10.73:1)
    green       = "#72CF77",                -- Orig: 72CF77
    oldgreen    = "#5CC75F",                -- Orig: 5CC75F

    -- Mostly used for strings.             (STATE: Very Good, Contrast Ratio: 10.72:1)
    sage        = "#92C983",                -- Orig: 92C983
    oldsage     = "#81C171",                -- Orig: 81C171

    -- Mostly used for characters.          (STATE: Very Good, Contrast Ratio: 12:1)
    moss        = "#B8CE84",                -- Orig: B8CE84
    oldmoss     = "#A1CE80",                -- Orig: A1CE80

    -- === Blues ===
    -- Mostly used for properties.          (STATE: Good?, Contrast Ratio: 7.95:1)
    blue        = "#9698F3",                -- Orig: 9698F3
    oldblue     = "#8183F2",                -- Orig: 8183F2

    -- Mostly used for fields.              (STATE: Good?, Contrast Ratio: 7.5:1)
    azure       = "#9992E8",                -- Orig: 9992E8
    oldazure    = "#7E77DA",                -- Orig: 7E77DA

    -- Mostly used for types.               (STATE: Good?, Contrast Ratio: 7.94:1)
    sea         = "#A098E1",                -- Orig: A098E1
    oldsea      = "#928BDE",                -- Orig: 928BDE

    -- Mostly used for namespaces.          (STATE: Good, Contrast Ratio: 7.98:1)
    lavender    = "#AD91F3",                -- Orig: AD91F3
    oldlavender = "#A98BF2",                -- Orig: A98BF2

    -- === Cyans ===
    -- Mostly used for constants.           (STATE: Very Good?, Contrast Ratio: 11.05:1)
    cyan        = "#74CADD",                -- Orig: 74CADD

    -- Mostly used for repeat / loops.      (STATE: Very Good?, Contrast Ratio: 11.4:1)
    cobalt      = "#91C7ED",                -- Orig: 91C7ED

    -- Mostly used for delimiters.          (STATE: Very Good?, Contrast Ratio: 13.77:1)
    sky         = "#9CDEE6",                -- Orig: 9CDEE6

    -- Mostly used for brackets.            (STATE: Good?, Contrast Ratio: 9.15:1)
    ceru        = "#65B5E6",                -- Orig: 65B5E6
    oldceru     = "#47A6E1",                -- Orig: 47A6E1

    -- Mostly used for constructors.        (STATE: Very Good?, Contrast Ratio: 12.4:1)
    teal        = "#60DDC1",                -- Orig: 60DDC1

    -- Mostly used for URL / Reference.     (STATE: Good?, Contrast Ratio: 10.11:1)
    linkblue    = "#95B9DF",                -- Orig: 95B9DF

    -- === Magentas ===
    -- Mostly used for conditionals.        (STATE: Good?, Contrast Ratio: 10.1:1)
    magenta     = "#D7A2EC",                -- Orig: D7A2EC
    oldmagenta  = "#CE8DE8",                -- Orig: CE8DE8

    -- Mostly used for keywords.            (STATE: Good?, Contrast Ratio: 10.1:1)
    mauve       = "#BD9EE5",                -- Orig: BD9EE5
    oldmauve    = "#AE88DF",                -- Orig: AE88DF

    -- Mostly used for keyword.function.    (STATE: Good?, Contrast Ratio: 8.67:1)
    plum        = "#B29AF4",                -- Orig: B29AF4
    oldplum     = "#9F82F0",                -- Orig: 9F82F0

    -- Mostly used for identifiers.         (STATE: Good?, Contrast Ratio: 9.3:1)
    pink        = "#EB93BF",                -- Orig: EB93BF
    oldpink     = "#E881B6",                -- Orig: E881B6

    -- Mostly used for includes.            (STATE: Good?, Contrast Ratio: 10.66:1)
    flamingo    = "#EAA4DC",                -- Orig: EAA4DC
    oldflamingo = "#EBAADF",                -- Orig: EBAADF

    -- Mostly used for return keyword.      (STATE: Good?, Contrast Ratio: 8.05:1)
    lilac       = "#BC8BF8",                -- Orig: BC8BF8
    oldlilac    = "#B077F8",                -- Orig: B077F8

    -- Mostly used for function.macro.      (STATE: Good?, Contrast Ratio: 10.8:1)
    rosy        = "#E9AAC1",                -- Orig: E9AAC1
    oldrosy     = "#ECB5C9",                -- Orig: ECB5C9

    -- === Yellows ===
    -- Mostly used for structures.          (STATE: Good?, Contrast Ratio: 12.2:1)
    yellow      = "#DBC680",                -- Orig: DBC680
    oldyellow   = "#DAC57C",                -- Orig: DAC57C

    -- Mostly used for match/search.        (STATE: Very Good, Contrast Ratio: 12.44:1)
    amber       = "#F3C16A",                -- Orig: F3C16A

    -- Mostly used for parameters.          (STATE: Very Good, Contrast Ratio: 11.64:1)
    apricot     = "#E9BA87",                -- Orig: E9BA87

    -- Mostly used for functions.           (STATE: Very Good, Contrast Ratio: 15.23:1)
    marigold    = "#E1E1A1",                -- Orig: E1E1A1

    -- === Oranges ===
    -- Mostly used for booleans.            (STATE: Very Good, Contrast Ratio: 12.46:1)
    orange      = "#EEC190",                -- Orig: EEC190
    oldorange   = "#E8A863",                -- Orig: E8A863

    -- Mostly used for warnings.            (STATE: Very Good, Contrast Ratio: 12.35:1)
    peach       = "#F1BF89",                -- Orig: F1BF89

    -- Mostly used for numbers.             (STATE: Very Good, Contrast Ratio: 11.03:1)
    coral       = "#E7B56B",                -- Orig: E7B56B

    -- Mostly used for func-call.           (STATE: Very Good, Contrast Ratio: 11.56:1)
    valencia    = "#EEB694",                -- Orig: EEB694

    -- Mostly used for special.             (STATE: Very Good, Contrast Ratio: 12.08:1)
    titian      = "#F4BB83",                -- Orig: F4BB83

    -- === Misc ===
    -- Cursor                               (STATE: Good, Contrast Ratio: 11.47:1)
    cursor      = "#E0BA9A",                -- Orig: E0BA9A
    oldcursor   = "#D7A77D",                -- Orig: D7A77D

    -- Comments                             (STATE: Very Good, Contrast Ratio: 4.52:1)
    -- NOTE:    Comments intentonally lower contrast,
    --          but still passes "WCAG AA" quality, even for thin text. (AAA for bold text.)
    comment     = "#7C6CAC",                -- Orig: 7C6CAC
    oldcomment  = "#7462A6",                -- Orig: 7462A6

    -- For listchars and such.              (STATE: Very Good, Contrast Ratio: 1.26:1)
    -- NOTE:    Ghost intentonally lower contrast, meant to be near invisible.
    ghost       = "#26144A",                -- Orig: 26144A
    altghost    = "#4E2A93",                -- Orig: 4E2A93

    -- Another dark blue, near black.       (STATE: Good)
    night       = "#06020C",                -- Orig: 06020C

    -- Another dark blue. (CursorLine)      (STATE: Good, Contrast Ratio: 1.05:1)
    dusk        = "#10081B",                -- Orig: 10081B
}

return colors
