set fish_greeting

#: Global variable exports

#: Editor
set -gx EDITOR nvim
# set -gx MOAR '-colors=16M -style dracula -no-statusbar -no-linenumbers'
#: Looking for better pager.
set -gx PAGER less
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

#: Hope this is not gonna break anything. Testing because of Bevy issue.
#: It is telling me to do something like this.
set -gx PKG_CONFIG_PATH "/usr/lib/x86_64-linux-gnu/pkgconfig/"

#: `Pure` fish-prompt colors. Could customize these I suppose.
#:  - These seem to have been exported to the `~/.config/fish/fish_variables` file.
#: STATE: Fine
# set --universal pure_color_danger brred
# set --universal pure_color_dark 332244
# set --universal pure_color_info cyan
# set --universal pure_color_light white
# set --universal pure_color_mute red
# set --universal pure_color_normal normal
# set --universal pure_color_primary blue
# set --universal pure_color_success green
# set --universal pure_color_warning yellow

#: `ls` and `exa`: Colors
#:  - Created complete version using `set -Ux LS_COLORS` and `set -Ux EXA_COLORS`.
#:      - The settings can be seen in the `~/.config/fish/fish_variables` file.
#:      - The settings can be overwritten by calling the `set -Ux` commands again.
#:  - Help: "https://the.exa.website/docs/colour-themes"
# set -Ux LS_COLORS "fi=34:di=34:ex=34:pi=34:so=34:bd=34:cd=34:ln=34:or=34:*.aac=34:*.alac=34:*.ape=34:*.flac=34:*.m4a=34:*.mka=34:*.mp3=34:*.ogg=34:*.opus=34:*.wav=34:*.wma=34"
# set -Ux EXA_COLORS "uu=38;5;61:un=38;5;62:gu=38;5;64:gn=38;5;65"

#: Path
#: Node version manager `fnm`:
#: - Running this once is enough.
# fish_add_path /home/aum/.fnm

#: `fzf` defaults configuration.
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude ".git" --exclude node_modules --exclude ".ccls-cache" --exclude ".output"'
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
set -gx FZF_ALT_C_COMMAND 'fd -H -t d'

#: Starship config location
# set -gx STARSHIP_CONFIG '/home/aum/.config/starship/starship.toml'

#: Matplotlib kitty backend
set -gx MPLBACKEND 'module://matplotlib-backend-kitty'
set -gx MPLBACKEND_KITTY_SIZING 'manual'

#: `cargo doc` (rustdoc) default theme.
set -gx RUSTDOCFLAGS '--default-theme=ayu'

if status is-interactive
    #: Commands to run in interactive sessions can go here

    # Async git prompt for `pure-fish/pure`:
    set -g async_prompt_functions _pure_prompt_git

    fish_vi_key_bindings

    #: Abbreviations / Aliases:
    abbr --add --global ls-real '/usr/bin/ls'
    abbr --add --global rm 'rm -vi'
    abbr --add --global rmrec 'rm -vIr'
    abbr --add --global cp 'cp -vi'
    abbr --add --global mv 'mv -vi'
    abbr --add --global md 'mkdir -p'
    abbr --add --global mkdir 'mkdir -p'
    abbr --add --global et 'erd'
    abbr --add --global ssh 'kitty +kitten ssh'

    abbr --add --global xcolor 'xcolor --format HEX | xclip -sel clip'

    # START - Navigating back to parent directories.
    abbr --add --global '...' '../..'
    abbr --add --global '....' '../../..'
    abbr --add --global '.....' '../../../..'
    abbr --add --global '......' '../../../../..'
    abbr --add --global '.......' '../../../../../..'
    # END - Navigating back to parent directories.

    # START - Code Editor (Mostly Neovim)
    abbr --add --global nv 'nvim'
    abbr --add --global nvmini 'NVIM_APPNAME=nvim_minimal nvim'
    abbr --add --global nvrepro 'NVIM_APPNAME=nvim_repro nvim'
    abbr --add --global nvs 'nvim ./(fzf)'
    abbr --add --global codi 'codium'
    abbr --add --global notes 'nvim /home/aum/Secondbrain/Vault/mind-tracking-fleeting-notes.norg'
    # END - Code Editor

    # NOTE: `untar` should work automatically for the various bzip and gzip versions too.
    abbr --add --global untar 'tar --extract --verbose --file'
    abbr --add --global untarbzip 'tar --extract --verbose --bzip2 --file'
    abbr --add --global untargzip 'tar --extract --verbose --gzip --file'

    #: This is some old thing. TODO: Test / Remove
    abbr --add --global rodb 'rofi -show kb -modi kb:/home/aum/.config/rofi/custom-modes/rofi-kb-mode.bash'

    #: Opening Music Player `ncmpcpp`
    abbr --add --global aumusic 'ncmpcpp'

    #: Screen Recording
    abbr --add --global aumrec 'aum-record-region'

    #: Setting keyboard repeat rate easily, because it tends to reset sometimes.
    abbr --add --global setkeyboardrepeatrate 'xset r rate 196 80'
    abbr --add --global fixkeyboardrepeatrate 'xset r rate 196 80'

    #: Hmm.
    abbr --add --global python 'python3'

    # - START - Image Viewing
    abbr --add --global siv 'sxiv -bft'
    abbr --add --global fehere 'feh -FYZ ./'
    abbr --add --global icat 'kitty +kitten icat'
    # - END - Image Viewing

    #: `fd`, `rg` and `xclip` defaults
    abbr --add --global fd 'fd --hidden'
    abbr --add --global rg 'rg -S'
    abbr --add --global xclip 'xclip -sel clip'

    #: For showing keypresses of screen.
    abbr --add --global screenkey-drag 'screenkey --mouse --no-systray -p fixed -g $(slop -n -f "%g")'

    #: START => Web Development
    #: |> browser-sync
    abbr --add --global browsync 'browser-sync start --config ./bs-config.js'
    #: END => Web Development

    #: TODO: Probably remove these and `kb`.
    abbr --add --global kbl 'kb list'
    abbr --add --global kbe 'kb edit'
    abbr --add --global kba 'kb add --title'
    abbr --add --global kbv 'kb view'
    abbr --add --global kbd 'kb delete --id'
    abbr --add --global kbg 'kb grep -ivm'
    abbr --add --global kbt 'kb list --tags'

    #: START => LaTeX
    #: Compiling a `.tex` LaTeX file using `lualatex`. (into `.output` dir)
    abbr --add --global pdfout 'lualatex -output-directory=".output/"'
    #: END => LaTeX

    #: Timed shutdown script
    abbr --add --global aumshutdownsoon '/home/aum/Secondbrain/programming/scripts/aum-timed-shutdown/aumpoweroff.sh'

    #: NOTE: Requires the user to click the target window.
    abbr --add --global get_wm_class 'xprop | rg -S "wm_class" | choose 3 | tr -d "\""'

    #: START => C / C++ / Java compilation
    #   - NOTE: These are dated.

    #: For compiling single .cpp file.
    abbr --add --global cppcompile 'g++ -Wall -std=c++20 -o ./exe.out'
    abbr --add --global gradaum-bnr './gradlew build && printf "\nRunning Java program...\n\n" && java -jar ./build/libs/Main.jar'

    #: NOTE: Ran from root of project.
    abbr --add --global cmake-basic 'cmake -S ./src/ -B ./out/build/'

    #: NOTE: Ran from root of project.
    abbr --add --global cmake-init-cpp '/home/aum/Secondbrain/programming/scripts/aum-cmake-init-scripts/init.sh'
    #: END => C / C++

    #: Vim custom binds for fish shell command line interaction.
    #: On cli "bind --function-names" shows list of available commands.
    #: DocLink: "https://fishshell.com/docs/current/cmds/bind.html?highlight=keybindings"

    bind --mode default e forward-char
    bind --mode default q backward-char

    bind --mode default n forward-word
    bind --mode default o backward-word

    bind --mode default s kill-selection
    bind --mode default ss kill-whole-line
    bind --mode default S kill-whole-line

    bind --mode visual e forward-char
    bind --mode visual q backward-char

    bind --mode visual n forward-word
    bind --mode visual o backward-word

    bind --mode visual s kill-selection

    bind --mode default u undo
    bind --mode default r redo

    bind --mode default --sets-mode visual v begin-selection
    bind --mode visual --sets-mode default v end-selection
    bind --mode visual --sets-mode default \e end-selection

    bind --mode default --sets-mode insert w end-selection
    bind --mode default --sets-mode insert W beginning-of-line

    bind --mode default go beginning-of-line
    bind --mode default gn end-of-line

    bind --mode visual go beginning-of-line
    bind --mode visual gn end-of-line

    bind --mode insert \cq backward-char
    bind --mode insert \ce forward-single-char

    bind --mode insert \ca beginning-of-line
    bind --mode insert \co end-of-line

    #: START -> 'exa': file listing functions / aliases.

    function l
        exa --header --long --all --classify --icons --group-directories-first $argv
    end

    function ll
        exa $argv
    end

    function ls
        exa --grid --all --classify --icons --group-directories-first $argv
    end

    function lsr
        exa --grid --all --classify --icons --group-directories-first | rg -S "$argv"
    end

    function lt
        exa --tree --level=3 --header --long --classify --icons --group-directories-first $argv
    end

    #: END -> 'exa': file listing functions / aliases.

    function neo
        neovide --notabs --frame none $argv
    end

    function fplay
        set -l finds (fd --type file -e mp4 -e mov -e mkv --max-depth 3)

        if [ -z "$finds" ] 
            return 0
        end

        set -l fzf_selection (printf '%s\n' $finds | fzf)

        if [ -n "$fzf_selection" ]
            mpv --fs $fzf_selection
        else
            return 0
        end
    end

    function speedup
        ffmpeg -i $argv[1] -filter_complex "[0:v]setpts=0.64*PTS[v];[0:a]atempo=1.5625[a]" -map "[v]" -map "[a]" -c:v libx264 -c:a aac $argv[2]
    end

    function reencodevideo
        ffmpeg -i $argv[1] -filter_complex "[0:v]setpts=1.0*PTS[v];[0:a]atempo=1.0[a]" -map "[v]" -map "[a]" -c:v libx264 -c:a aac $argv[2]
    end

    function zd
        set -l finds (fd --type directory --max-depth 5)

        if [ -z "$finds" ]
            return 0
        end

        set -l fzf_selection (printf '%s\n' $finds | fzf)

        if [ -n "$fzf_selection" ]
            cd $fzf_selection && exa --grid --all --classify --icons
        else
            return 0
        end
    end

    function zl
        zi
        # exa --grid --all --classify --icons
    end

    #: Opening detached `Graphical File Browser` (nautilus) in Current Directory.
    function naut
        nohup nautilus --new-window $argv[1] > /dev/null 2>&1 & disown
    end

    #: Opening detached `PDF Viewer` (zathura).
    function zath
        nohup zathura $argv[1] > /dev/null 2>&1 & disown
    end

    function reload_fish
        source ~/.config/fish/config.fish
    end

    # =============================================================================
    #: Init pyenv.
    pyenv init - | source
end

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd
    builtin pwd -L
end

# A copy of fish's internal cd function. This makes it possible to use
# `alias cd=z` without causing an infinite loop.
if ! builtin functions -q __zoxide_cd_internal
    if builtin functions -q cd
        builtin functions -c cd __zoxide_cd_internal
    else
        alias __zoxide_cd_internal='builtin cd'
    end
end

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd
    __zoxide_cd_internal $argv
end

# =============================================================================
#
# Hook configuration for zoxide.
#

# Initialize hook to add new entries to the database.
function __zoxide_hook --on-variable PWD
    test -z "$fish_private_mode"
    and command zoxide add -- (__zoxide_pwd)
end

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

set __zoxide_z_prefix 'z!'

# Jump to a directory using only keywords.
function __zoxide_z
    set -l argc (count $argv)
    set -l completion_regex '^'(string escape --style=regex $__zoxide_z_prefix)'(.*)$'

    if test $argc -eq 0
        __zoxide_cd $HOME
    else if test "$argv" = -
        __zoxide_cd -
    else if test $argc -eq 1 -a -d $argv[1]
        __zoxide_cd $argv[1]
    else if set -l result (string match --groups-only --regex $completion_regex $argv[-1])
        __zoxide_cd $result
    else
        set -l result (command zoxide query --exclude (__zoxide_pwd) -- $argv)
        and __zoxide_cd $result
    end
end

# Completions for `z`.
function __zoxide_z_complete
    set -l tokens (commandline --current-process --tokenize)
    set -l curr_tokens (commandline --cut-at-cursor --current-process --tokenize)

    if test (count $tokens) -le 2 -a (count $curr_tokens) -eq 1
        # If there are < 2 arguments, use `cd` completions.
        __fish_complete_directories "$tokens[2]" ''
    else if test (count $tokens) -eq (count $curr_tokens)
        # If the last argument is empty, use interactive selection.
        set -l query $tokens[2..-1]
        set -l result (zoxide query --exclude (__zoxide_pwd) -i -- $query)
        and echo $__zoxide_z_prefix$result
        commandline --function repaint
    end
end

# Jump to a directory using interactive search.
function __zoxide_zi
    set -l result (command zoxide query -i -- $argv)
    and __zoxide_cd $result
end

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

abbr --erase z &>/dev/null
complete --command z --erase
function z
    __zoxide_z $argv
end
complete --command z --no-files --arguments '(__zoxide_z_complete)'

abbr --erase zi &>/dev/null
complete --command zi --erase
function zi
    __zoxide_zi $argv
end

# End of File
