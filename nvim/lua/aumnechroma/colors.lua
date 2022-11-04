-- Core colors of Aumnechroma theme.
colors = {
    -- === Background ===
    -- Primary background color.            (STATE: Good'ish)
    crust       = "#100F1D",                -- Orig: 100F1D     (Quite dark blue)

    -- Alt Primary background color.        (STATE: Good)
    darkcrust   = "#040206",                -- Orig: 040206     (Very dark blue, near black)

    -- Secondary background color.          (STATE: Good'ish)
    remnant     = "#04040C",                -- Orig: 04040C     (Very dark blue) 

    -- Tertiary background color.           (STATE: OK'ish)
    monolith    = "#0F0B16",                -- Orig: 0F0B16

    -- Quaternary background color.         (STATE: OK'ish)
    alloy       = "#21202F",                -- Orig: 21202F

    -- === Foreground ===
    -- Primary foreground.                  (STATE: Good)
    text        = "#ADAAD5",                -- Orig: ADAAD5

    -- Secondary foreground.                (STATE: Good)
    heaven      = "#BCB9DE",                -- Orig: BCB9DE

    -- Tertiary foreground.                 (STATE: Good)
    snow        = "#C0C8ED",                -- Orig: C0C8ED

    -- Quaternary foreground.               (STATE: Good)
    hail        = "#9AA7DD",                -- Orig: 9AA7DD

    -- === Reds ===
    -- Mostly used for operators.           (STATE: Very Good)
    red         = "#EE5260",                -- Orig: EE5260

    -- Mostly used for (alt) keywords.      (STATE: Working on it.)
    rose        = "#DA596D",                -- Orig: DA596D

    -- Mostly used for errors.              (STATE: Working on it.)
    crimson     = "#D24A4A",                -- Orig: D24A4A

    -- Mostly used for exceptions.          (STATE: Not used?)
    rouge       = "#DC5D51",                -- Orig: DC5D51

    -- === Greens ===
    -- Mostly used for statements.          (STATE: Not sure)
    green       = "#5CC75F",                -- Orig: 5CC75F

    -- Mostly used for strings.             (STATE: Very Good) 
    sage        = "#81C171",                -- Orig: 81C171

    -- Mostly used for characters.          (STATE: OK'ish)
    moss        = "#A1CE80",                -- Orig: A1CE80

    -- === Blues ===
    -- Mostly used for properties.          (STATE: OK'ish)
    blue        = "#8183F2",                -- Orig: 8183F2

    -- Mostly used for fields.              (STATE: Very Good)
    azure       = "#7E77DA",                -- Orig: 7E77DA

    -- Mostly used for types.               (STATE: Good'ish)
    sea         = "#928BDE",                -- Orig: 928BDE

    -- Mostly used for namespaces.          (STATE: Good'ish)
    lavender    = "#A98BF2",                -- Orig: A98BF2

    -- === Cyans ===
    -- Mostly used for constants.           (STATE: Okay'ish.)
    cyan        = "#84CAC8",                -- Orig: 84CAC8

    -- Mostly used for repeat / loops.      (STATE: Working on it.)
    cobalt      = "#91C7ED",                -- Orig: 91C7ED

    -- Mostly used for delimiters.          (STATE: Quite Good)
    sky         = "#9CDEE6",                -- Orig: 9CDEE6

    -- Mostly used for brackets.            (STATE: Quite Good)
    ceru        = "#47A6E1",                -- Orig: 47A6E1

    -- Mostly used for constructors.        (STATE: Quite Good)
    teal        = "#60DDC1",                -- Orig: 60DDC1

    -- === Magentas ===
    -- Mostly used for conditionals.        (STATE: Working on it.)
    magenta     = "#CE8DE8",                -- Orig: CE8DE8

    -- Mostly used for keywords.            (STATE: Good)
    mauve       = "#AE88DF",                -- Orig: AE88DF

    -- Mostly used for keyword.function.    (STATE: Working on it.)
    plum        = "#9F82F0",                -- Orig: 9F82F0

    -- Mostly used for identifiers.         (STATE: Working on it.)
    pink        = "#E881B6",                -- Orig: E881B6

    -- Mostly used for includes.            (STATE: Okay, but WIP.)
    flamingo    = "#EBAADF",                -- Orig: EBAADF

    -- Mostly used for return keyword.      (STATE: Working on it.)
    lilac       = "#B077F8",                -- Orig: B077F8

    -- Mostly used for function.macro.      (STATE: Working on it.)
    rosy        = "#ECB5C9",                -- Orig: ECB5C9

    -- === Yellows ===
    -- Mostly used for structures.          (STATE: Working on it.)
    yellow      = "#DAC57C",                -- Orig: DAC57C

    -- Mostly used for parameters.          (STATE: Working on it.)
    amber       = "#F3C16A",                -- Orig: F3C16A

    -- Mostly used for functions.           (STATE: Working on it.)
    apricot     = "#E9BA87",                -- Orig: E9BA87

    -- Mostly used for keyword.function.    (STATE: Working on it.)
    marigold    = "#E8E8A3",                -- Orig: E8E8A3

    -- === Oranges ===
    -- Mostly used for booleans.            (STATE: Quite Good)
    orange      = "#E8A863",                -- Orig: E8A863

    -- Mostly used for warnings.            (STATE: Okay'ish)
    peach       = "#F1BF89",                -- Orig: F1BF89

    -- Mostly used for numbers.             (STATE: Working on it.)
    coral       = "#E7B56B",                -- Orig: E7B56B

    -- Mostly used for func-call.           (STATE: Working on it.)
    valencia    = "#EEB694",                -- Orig: EEB694

    -- Mostly used for ?.                   (STATE: Working on it.)
    titian      = "#F4BB83",                -- Orig: F4BB83

    -- === Misc ===
    -- Cursor color                         (STATE: Quite Good, maybe bit too saturated.)
    cursor      = "#D7A77D",                -- Orig: D7A77D

    -- Comment color                        (STATE: Quite Good)
    comment     = "#7462A6",                -- Orig: 7462A6

    -- For listchars and such.              (STATE: Quite Good)
    ghost       = "#26144A",                -- Orig: 26144A

    -- Another dark blue.                   (STATE: Quite Good)
    night       = "#06020C",                -- Orig: 06020C

    -- Another dark blue. (CursorLine)      (STATE: Quite Good)
    dusk        = "#10081B",                -- Orig: 10081B


    -- Catppuccin colors:
    -- lavender    = "#B4BEFE",        -- Orig: #b4befe
    -- blue        = "#89B4FA",        -- Orig: #89b4fa
    -- sapphire    = "#74C7EC",        -- Orig: #74c7ec
    -- sky         = "#89DCEB",        -- Orig: #89dceb
    -- teal        = "#94E2D5",        -- Orig: #94e2d5
    -- green       = "#A6E3A1",        -- Orig: #a6e3a1
    -- yellow      = "#F9E2AF",        -- Orig: #f9e2af
    -- peach       = "#FAB387",        -- Orig: #fab387
    maroon      = "#EBA0AC",        -- Orig: EBA0AC
    -- red         = "#F38BA8",        -- Orig: #f38ba8
    -- mauve       = "#CBA6F7",        -- Orig: #cba6f7
    -- pink        = "#F5C2E7",        -- Orig: #f5c2e7
    rosewater   = "#F5E0DC",        -- Orig: F5E0DC
}

return colors
